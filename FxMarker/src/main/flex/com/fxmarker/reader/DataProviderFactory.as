/**
 *   FxMarker - a template based content generator for Flex and Air applications 
 *   Copyright (C) 2008-2010 Alex Ciobanu
 *
 *   This program is free software: you can redistribute it and/or modify
 *   it under the terms of the GNU General Public License as published by
 *   the Free Software Foundation, either version 3 of the License, or
 *   (at your option) any later version.
 * 
 *   This program is distributed in the hope that it will be useful,
 *   but WITHOUT ANY WARRANTY; without even the implied warranty of
 *   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 *   GNU General Public License for more details.
 *
 *   You should have received a copy of the GNU General Public License
 *   along with this program.  If not, see <http://www.gnu.org/licenses/>.
 */
 package com.fxmarker.reader
{
	import flash.utils.Dictionary;
	
	/**
	 * 
	 * @author Alexutz
	 * 
	 */	
	public class DataProviderFactory
	{
		private static var _instance : DataProviderFactory;
		/**
		 * Get the singleton instance
		 * @return 
		 * 
		 */		
		public static function get instance() : DataProviderFactory{
			if(!_instance){
				new DataProviderFactory();
			}
			return _instance;
		}
		
		private var providerMap : Dictionary;
		/**
		 * Constructor
		 * 
		 */		
		public function DataProviderFactory()
		{
			if(_instance){
				throw new Error("Do not instanciate ReaderFactory. User ReaderFactory.instance instead!");
			}
			_instance = this;
		}	
		/**
		 * 
		 * @param dataType
		 * @param clasz
		 * 
		 */		
		public function registerProvider(dataType : String, clasz : Class) : void{
			if(dataType && clasz){
				if(providerMap){
					providerMap = new Dictionary();
				}
				providerMap[dataType] = clasz;
			}
		}	
		/**
		 * 
		 * @param source
		 * @return 
		 * 
		 */		
		public function getXmlReader(source : Object) : IDataProvider{
			return getReader(XmlDataProvider.TYPE, source);
		} 
		/**
		 * 
		 * @param source
		 * @return 
		 * 
		 */		
		public function getPropertiesReader(source : Object) : IDataProvider{
			return getReader("properties", source);
		} 
		/**
		 * 
		 * @param source
		 * @return 
		 * 
		 */		
		public function getDefaultProvider(source : Dictionary) : IDataProvider{
			return getReader(DefaultDataProvider.TYPE, source);
		}		
		/**
		 * 
		 * @param type
		 * @param source
		 * @return 
		 * 
		 */		
		private function getReader(type : String, source : Object) : IDataProvider{
			var clasz : Class = providerMap[type];
			if(clasz){
				return new clasz() as IDataProvider;
			}
			throw new Error("Provider class not found for type " + type);
		}
	}
}
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
 package com.fxmarker
{
	
	import com.fxmarker.dataModel.DataModel;
	import com.fxmarker.template.Template;
	import com.fxmarker.writer.Writer;

	public class FullTest
	{
		
		[Embed(source="/assets/Interface.template", mimeType="application/octet-stream")]
		private var xmlLocalizationSource : Class;
		
		[Test]
		public function testContextVariables() : void{
			var testData : String = new String(new xmlLocalizationSource());
			var tmpl : Template = FxMarker.instance.getTemplate(testData);
			var dataModel : DataModel = new DataModel();
			var writer : Writer = new Writer();
			tmpl.process(dataModel, writer);
		}
	}
}
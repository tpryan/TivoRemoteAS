package components
{
	import flash.display.GradientType;
	import flash.display.Shape;
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.events.MouseEvent;
	import flash.geom.Matrix;
	import flash.text.TextField;
	import flash.text.TextFieldType;
	import flash.text.TextFormat;
	
	
	
	import flashx.textLayout.formats.TextAlign;
	
	public class SettingTextBox extends Sprite
	{
		private var _textValue:String = "";
		
		private var field:TextField;		
		private var title:TextField;
		private var fieldWidth:int = 250;
		private var TITLE_FONTFACE:String = "Droid Sans";
		private var FIELD_FONTFACE:String = "Droid Sans Mono";
		
		public function SettingTextBox()
		{
			super();
			init();
		}
		


		public function get textValue():String
		{
			return _textValue;
		}

		public function set textValue(value:String):void
		{
			_textValue = value;
			field.text = value;
		}

		private function init():void
		{
			var alphas:Array = [0.38, 1, 0.54];
			var colors:Array = [0x000000, 0x000000, 0x000000];			
			var ratios:Array = [0x00, 0x7F, 0xFF];
			var matrix:Matrix = new Matrix();
			var border:Shape = null;
			
			
			
			title = new TextField();
			title.width = 290;
			title.x = 10;
			title.y = 10;
			title.defaultTextFormat = new TextFormat( TITLE_FONTFACE, 20, 0xFFFFFF, true, null, null, null, null, TextAlign.CENTER );
			title.selectable = false;
			title.text = "Tivo Hostname or IP Address:";
			addChild( title );
			
			border = new Shape();
			border.graphics.lineStyle( 1, 0x000000 );
			border.graphics.beginFill( 0xFFFFFF );
			border.graphics.drawRoundRect( 0, 0, fieldWidth, 50, 8 );
			border.graphics.endFill();
			border.x = 10;
			border.y = 40;
			addChild( border );
			
			field = new TextField();
			field.width = fieldWidth;
			field.height = 50;
			field.x = 10;
			field.y = 43;
			field.defaultTextFormat = new TextFormat( FIELD_FONTFACE, 35, 0x000000, false, null, null, null, null, TextAlign.LEFT );
			field.type = TextFieldType.INPUT;
			field.text = _textValue;
			field.addEventListener(Event.CHANGE, fieldUpdate);
			addChild( field );
			
		}
		
		protected function fieldUpdate(event:Event):void
		{
			this.textValue = field.text;
			trace('field updates: this.text = ' + this.textValue);
			
		}
		
	}
}
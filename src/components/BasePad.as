package components
{
	import components.IconButton;
	
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.events.MouseEvent;
	import flash.text.TextFormat;
	
	public class BasePad extends Sprite
	{
		
		
		public var COLUMN_COUNT:int = 10;
		public var ROW_COUNT:int = 10;
		public var BUTTON_WIDTH:int
		public var BUTTON_HEIGHT:int;
		public var FONT_SIZE:int;
		public var PADDING:int;
		public var ROWS:Array;
		public var COLUMNS:Array;
		
		public var deviceScreenWidth:int;
		
		public function BasePad(screenWidth:int=480)
		{
			deviceScreenWidth = screenWidth;
			
			BUTTON_WIDTH = initButtonDefaults();
			BUTTON_HEIGHT = initButtonDefaults();
			FONT_SIZE = initFontSizeDefault();
			PADDING = initPaddingDefault();
			ROWS = initRows();
			COLUMNS = initColumns();
			
			
			
			
			super();
		}
		
		
		
		public function getLabelButton(label:String, x:int, y:int, fontSize:int=0,width:int=0,height:int=0):LabelButton{
			if (height == 0) height = BUTTON_HEIGHT;
			if (width == 0) width = BUTTON_WIDTH;
			if (fontSize == 0) fontSize = FONT_SIZE;
			
			var button:LabelButton = new LabelButton(label,fontSize,width,height);
			button.x = x;
			button.y = y;
			return button;
		}
		
		public function getIconButton(icon:String, x:int, y:int,width:int=0,height:int=0):IconButton{
			if (height == 0) height = BUTTON_HEIGHT;
			if (width == 0) width = BUTTON_WIDTH;
			var button:IconButton = new IconButton(icon,width,height);
			button.x = x;
			button.y = y;
			return button;
			
		}
		
		protected function initFontSizeDefault():int
		{
			var result:int = 24;
			if (deviceScreenWidth < 400){
				result = 14;
			}
			return result;
		}
		
		protected function initButtonDefaults():int{
			var result:int = 82;
			if (deviceScreenWidth < 400){
				result = 50;
			}
			return result;
		}
		
		protected function initPaddingDefault():int{
			var result:int = 3;
			if (deviceScreenWidth < 400){
				result = 1;
			}
			return result;
		}
		
		
		private function initRows():Array{
			var result:Array = new Array();
			var i:int = 0;
			
			for (i=0; i < ROW_COUNT; i++){
				result.push((BUTTON_HEIGHT * i) + (PADDING *i));
			}
			
			return result;
		}
		
		private function initColumns():Array{
			var result:Array = new Array();
			var i:int = 0;
			
			for (i=0; i < COLUMN_COUNT; i++){
				result.push((BUTTON_WIDTH * i) + (PADDING *i));
			}
			
			return result;
		}
		
		
	}
}
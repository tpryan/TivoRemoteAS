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
		public var PADDING:int;
		public var ROWS:Array;
		public var COLUMNS:Array;
		
		public var deviceScreenWidth:int;
		
		public function BasePad(screenWidth:int=480)
		{
			deviceScreenWidth = screenWidth;
			
			BUTTON_WIDTH = initButtonDefaults();
			BUTTON_HEIGHT = initButtonDefaults();
			PADDING = initPaddingDefault();
			ROWS = initRows();
			COLUMNS = initColumns();
			
			
			
			
			super();
		}
		
		public function getLabelButton(label:String, x:int, y:int, fontSize:int=20,width:int=0,height:int=0):LabelButton{
			if (height == 0) height = BUTTON_HEIGHT;
			if (width == 0) width = BUTTON_WIDTH;
			
			var button:LabelButton = new LabelButton(label, fontSize,width,height);
			button.x = x;
			button.y = y;
			return button;
		}
		
		protected function getIconButton(icon:String, x:int, y:int,width:int=0,height:int=0):IconButton{
			if (height == 0) height = BUTTON_HEIGHT;
			if (width == 0) width = BUTTON_WIDTH;
			var button:IconButton = new IconButton(icon,width,height);
			button.x = x;
			button.y = y;
			return button;
			
		}
		
		
		protected function initButtonDefaults():int{
			var result:int = 70;
			if (deviceScreenWidth < 400){
				result = 30;
			}
			return result;
		}
		
		protected function initPaddingDefault():int{
			var result:int = 10;
			if (deviceScreenWidth < 400){
				result = 5;
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
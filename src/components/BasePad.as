package components
{
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.events.MouseEvent;
	import flash.text.TextFormat;
	import components.IconButton;
	
	public class BasePad extends Sprite
	{
		
		protected const BUTTON_WIDTH:int = 50;
		protected const BUTTON_HEIGHT:int = 50;
		protected var COLUMNS:Array = new Array(0,60,120);
		protected var ROWS:Array = new Array(0,60,120,180);
		
		public function BasePad()
		{
			super();
		}
		
		public function getLabelButton(label:String, x:int, y:int, fontSize:int=20,width:int=BUTTON_WIDTH,height:int=BUTTON_HEIGHT):LabelButton{
			var button:LabelButton = new LabelButton(label, fontSize,width,height);
			button.x = x;
			button.y = y;
			return button;
		}
		
		public function getIconButton(icon:String, x:int, y:int ):IconButton{
			var button:IconButton = new IconButton(icon);
			button.x = x;
			button.y = y;
			return button;
			
		}
		
	}
}
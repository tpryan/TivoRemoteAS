package components
{
	
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.events.MouseEvent;
	import flash.text.TextFormat;
	
	import components.IconButton;
	
	[Event(name="upClick", type="flash.events.Event")]
	[Event(name="downClick", type="flash.events.Event")]
	
	public class ThumbsPad extends BasePad
	{
		public function ThumbsPad()
		{
			
			super();
			
			
			
			
			//up
			var up:IconButton = getIconButton("/assets/controls/thumbsup_s1.png", COLUMNS[0], ROWS[0]);
			up.addEventListener(MouseEvent.CLICK, up_clicked);
			addChild(up);
			
			//down
			var down:IconButton = getIconButton("/assets/controls/thumbsdown_s1.png", COLUMNS[0], ROWS[1]);
			down.addEventListener(MouseEvent.CLICK, down_clicked);
			addChild(down);
			
			
		}
		
		private function up_clicked(e:MouseEvent):void{
			dispatchEvent(new Event("upClick")); 
		}
		
		private function down_clicked(e:MouseEvent):void{
			dispatchEvent(new Event("downClick")); 
		}
	
	}
	
	
}
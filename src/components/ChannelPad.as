package components
{
	
	import components.ChannelPad;
	
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.events.MouseEvent;
	import flash.text.TextField;
	import flash.text.TextFormat;
	
	
	[Event(name="upClick", type="flash.events.Event")]
	[Event(name="downClick", type="flash.events.Event")]
	
	import flashx.textLayout.formats.TextAlign;
	
	
	public class ChannelPad extends BasePad
	{
		public function ChannelPad()
		{
			
			super();
			
			
			//up
			var up:IconButton = getIconButton("/assets/controls/c_up_s1.png", COLUMNS[0], ROWS[0]);
			up.addEventListener(MouseEvent.CLICK, up_clicked);
			addChild(up);
			
			//down
			var down:IconButton = getIconButton("/assets/controls/c_down_s1.png", COLUMNS[0], ROWS[1]);
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
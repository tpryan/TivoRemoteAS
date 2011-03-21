package components
{
	import flash.display.Sprite;
	import flash.events.MouseEvent;
	import flash.events.Event;
	
	import components.PlayControlPad;
	
	[Event(name="reverse", type="flash.events.Event")]
	[Event(name="replay", type="flash.events.Event")]
	[Event(name="pause", type="flash.events.Event")]
	[Event(name="slow", type="flash.events.Event")]
	[Event(name="forward", type="flash.events.Event")]
	
	public class PlayControlPad extends BasePad
	{
		public function PlayControlPad()
		{
			super();
			
			
			
			
			//reverse
			var reverse:IconButton = getIconButton("/assets/controls/reverse_s1.png", COLUMNS[0], ROWS[1]);
			reverse.addEventListener(MouseEvent.CLICK, reverse_clicked);
			addChild(reverse);
			
			//pause
			var pause:PauseButton = new PauseButton();
			pause.x = COLUMNS[1];
			pause.y = ROWS[1];
			pause.addEventListener(MouseEvent.CLICK, pause_clicked);
			addChild(pause);
			
			//forward
			var forward:IconButton = getIconButton("/assets/controls/forward_s1.png", COLUMNS[2], ROWS[1]);
			forward.addEventListener(MouseEvent.CLICK, forward_clicked);
			addChild(forward);
			
			//replay
			var replay:IconButton = getIconButton("/assets/controls/backup_s1.png", COLUMNS[0], ROWS[2]);
			replay.addEventListener(MouseEvent.CLICK, replay_clicked);
			addChild(replay);
			
			//slow
			var slow:IconButton = getIconButton("/assets/controls/slow_s1.png", COLUMNS[1], ROWS[3]);
			slow.addEventListener(MouseEvent.CLICK, slow_clicked);
			addChild(slow);
			
			//advace
			var advance:IconButton = getIconButton("/assets/controls/advance_s1.png", COLUMNS[2], ROWS[2]);
			advance.addEventListener(MouseEvent.CLICK, slow_clicked);
			addChild(advance);
			
			
			//record
			var record:IconButton = getIconButton("/assets/controls/record_s1.png", COLUMNS[1], ROWS[2]);
			record.addEventListener(MouseEvent.CLICK, slow_clicked);
			addChild(record);
			
			
		}
		
		private function reverse_clicked(e:MouseEvent):void{
			dispatchEvent(new Event("reverse")); 
		}
		
		private function pause_clicked(e:MouseEvent):void{
			dispatchEvent(new Event("pause")); 
		}
		
		private function forward_clicked(e:MouseEvent):void{
			dispatchEvent(new Event("forward")); 
		}
		
		private function slow_clicked(e:MouseEvent):void{
			dispatchEvent(new Event("slow")); 
		}
		
		private function replay_clicked(e:MouseEvent):void{
			dispatchEvent(new Event("replay")); 
		}
		
	}
}
package components
{
	
	
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.events.MouseEvent;
	
	
	[Event(name="pause", type="flash.events.Event")]
	
	
	public class PauseButton extends BasePad
	{
		protected var paused:Boolean = false;
		protected var play:IconButton;
		protected var pause:IconButton;
		
		public function PauseButton(screenWidth:int=480)
		{
			super(screenWidth);
			
			//play
			play = getIconButton("/assets/controls/play_s1.png", 0,0);
			play.addEventListener(MouseEvent.CLICK, pause_clicked);
			addChild(play);
			
			//pause
			pause = getIconButton("/assets/controls/pause_s1.png", 0,0);
			pause.addEventListener(MouseEvent.CLICK, pause_clicked);
			addChild(pause);
			
			play.visible = false;
			
			
		}
		
		
		private function pause_clicked(e:MouseEvent):void{
			dispatchEvent(new Event("pause"));
			
			if (paused){
				paused = false;
				play.visible = false;
				pause.visible = true;
			}
			else{
				paused = true;
				play.visible = true;
				pause.visible = false;
			}
		}
		
		
		
	}
}
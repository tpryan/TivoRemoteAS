package
{
	
	import com.terrenceryan.tivoremote.Tivo;
	import com.terrenceryan.tivoremote.TivoRemote;
	import com.terrenceryan.tivoremote.TivoService;
	
	import components.LabelButton;
	import components.ArrowPad;
	import components.BasePad;
	import components.ChannelPad;
	import components.NumberPad;
	import components.PlayControlPad;
	import components.ThumbsPad;
	
	import flash.desktop.NativeApplication;
	import flash.display.Sprite;
	import flash.display.StageAlign;
	import flash.display.StageScaleMode;
	import flash.events.Event;
	import flash.events.MouseEvent;
	
	public class TivoRemoteInterface extends Sprite
	{
	
		protected var tivoService:TivoService = new TivoService();
		protected var tivoRemote:TivoRemote = null;
		
		protected var numpad:NumberPad = null;
		protected var arrowPad:ArrowPad = null;
		protected var playControlPad:PlayControlPad = null;
		protected var channelPad:ChannelPad = null;
		protected var thumbsPad:ThumbsPad = null;
		
		private const BUTTON_WIDTH:int = 170;
		private const BUTTON_HEIGHT:int = 50;
		private const COL1X:int= 10;
		private const COL2X:int= 200;
		private const COL3X:int= 390;
		private const TOP:int= 10;
		private const ROW2Y:int = 280;
		
		private var centerLine:int = 0;
		
		
		private const COLUMNS:Array = new Array(0,60,120,180,240,300,360,420,480,540,600,660);
		private const ROWS:Array = new Array(0,60,120,180,240,300,360,420,480,540,600,660);
		
		public function TivoRemoteInterface()
		{
			super();
			
			// support autoOrients
			stage.align = StageAlign.TOP_LEFT;
			stage.scaleMode = StageScaleMode.NO_SCALE;
			centerLine = stage.stageWidth/2;
			
			drawArrowPad();
			drawPlayControlPad();
			drawNumPad();
			
			drawChannelPad();
			drawThumbsPad();
			
			drawOtherButtons();
			
			tivoRemote = new TivoRemote("D");
			//tivoRemote = new TivoRemote("10.0.1.191");
			
				
		}
		
		private function drawOtherButtons():void{
			var basePad:BasePad = new BasePad();
			
			var tivoButton:LabelButton = basePad.getLabelButton("Tivo",centerLine - 45, ROWS[0],14);
			tivoButton.addEventListener(MouseEvent.CLICK, tivo_clickHandler);
			addChild(tivoButton);
			
			var liveButton:LabelButton =  basePad.getLabelButton("Live",channelPad.x, channelPad.y + channelPad.height + 10,14);;
			liveButton.addEventListener(MouseEvent.CLICK, live_clickHandler);
			addChild(liveButton);
			
			var infoButton:LabelButton =  basePad.getLabelButton("Info",tivoButton.x - 120, ROWS[0],14);
			infoButton.addEventListener(MouseEvent.CLICK, live_clickHandler);
			addChild(infoButton);
			
			var guideButton:LabelButton =  basePad.getLabelButton("Guide",thumbsPad.x, thumbsPad.y + thumbsPad.height + 10,14);
			guideButton.addEventListener(MouseEvent.CLICK, live_clickHandler);
			addChild(guideButton);
		}
		
		
		private function drawChannelPad():void{
			channelPad = new ChannelPad();
			channelPad.x = (arrowPad.x - channelPad.width) -10 ;
			channelPad.y = ROWS[1]+ 25;
			channelPad.addEventListener("upClick", channelUp_clickHandler);
			channelPad.addEventListener("downClick", channelDown_clickHandler);
			addChild(channelPad);
		}
		
		private function drawThumbsPad():void{
			thumbsPad = new ThumbsPad();
			thumbsPad.x =  arrowPad.x + arrowPad.width + 10 ;
			thumbsPad.y =  ROWS[1]+ 25;
			thumbsPad.addEventListener("upClick", thumbsUp_clickHandler);
			thumbsPad.addEventListener("downClick", thumbsDown_clickHandler);
			addChild(thumbsPad);
		}
		
		private function drawPlayControlPad():void{
			playControlPad = new PlayControlPad();
			playControlPad.x= stage.stageWidth/2 - playControlPad.width/2 -20;
			playControlPad.y = ROWS[4];
			playControlPad.addEventListener("reverse", actionReverse_clickHandler);
			playControlPad.addEventListener("replay", actionReplay_clickHandler);
			playControlPad.addEventListener("pause", actionPause_clickHandler);
			playControlPad.addEventListener("slow", actionSlow_clickHandler);
			playControlPad.addEventListener("forward", actionForward_clickHandler);
			
			addChild(playControlPad);
		}
		
		private function drawArrowPad():void{
			arrowPad = new ArrowPad();
			arrowPad.x= stage.stageWidth/2 - arrowPad.width/2 -20;
			arrowPad.y= ROWS[1];
			arrowPad.addEventListener("upClick", up_clickHandler);
			arrowPad.addEventListener("downClick", down_clickHandler);
			arrowPad.addEventListener("leftClick", left_clickHandler);
			arrowPad.addEventListener("rightClick", right_clickHandler);
			arrowPad.addEventListener("selectClick", select_clickHandler);
			addChild(arrowPad);
		}
		
		private function drawNumPad():void{
			numpad = new NumberPad();
			numpad.x = stage.stageWidth/2 - numpad.width/2 -20;
			numpad.y = ROWS[8];
			numpad.addEventListener("num1", pad1_clickHandler);
			numpad.addEventListener("num2", pad2_clickHandler);
			numpad.addEventListener("num3", pad3_clickHandler);
			numpad.addEventListener("num4", pad4_clickHandler);
			numpad.addEventListener("num5", pad5_clickHandler);
			numpad.addEventListener("num6", pad6_clickHandler);
			numpad.addEventListener("num7", pad7_clickHandler);
			numpad.addEventListener("num8", pad8_clickHandler);
			numpad.addEventListener("num9", pad9_clickHandler);
			numpad.addEventListener("num0", pad0_clickHandler);
			numpad.addEventListener("e", enter_clickHandler);
			numpad.addEventListener("c", clear_clickHandler);
			addChild(numpad);
		}
		
		
		
		
		protected function actionPause_clickHandler(e:Event):void{
			tivoRemote.pause();
		}
		
		protected function actionReplay_clickHandler(e:Event):void{
			tivoRemote.replay();
		}
		
		protected function actionForward_clickHandler(e:Event):void{
			tivoRemote.forward();
		}
		
		protected function actionReverse_clickHandler(e:Event):void{
			tivoRemote.reverse();
		}
		
		protected function actionSlow_clickHandler(e:Event):void{
			tivoRemote.slow();
		}
		
		protected function channelUp_clickHandler(e:Event):void{
			tivoRemote.channelup();
		}
		
		protected function channelDown_clickHandler(e:Event):void{
			tivoRemote.channeldown();
		}
		
		protected function select_clickHandler(e:Event):void{
			tivoRemote.select();
		}
		
		protected function up_clickHandler(e:Event):void{
			tivoRemote.up();
		}
		
		protected function down_clickHandler(e:Event):void{
			tivoRemote.down();
		}
		
		protected function left_clickHandler(e:Event):void{
			tivoRemote.left();
		}
		
		protected function right_clickHandler(e:Event):void{
			tivoRemote.right();
		}
		
		protected function tivo_clickHandler(e:Event):void{
			tivoRemote.tivo();
		}
		
		protected function live_clickHandler(e:Event):void{
			tivoRemote.livetv();
		}
		
		protected function pad1_clickHandler(e:Event):void{
			tivoRemote.num1();
		}
		
		protected function pad2_clickHandler(e:Event):void{
			tivoRemote.num2();
		}
		
		protected function pad3_clickHandler(e:Event):void{
			tivoRemote.num3();
		}
		
		protected function pad4_clickHandler(e:Event):void{
			tivoRemote.num4();
		}
		
		protected function pad5_clickHandler(e:Event):void{
			tivoRemote.num5();
		}
		
		protected function pad6_clickHandler(e:Event):void{
			tivoRemote.num6();
		}
		
		protected function pad7_clickHandler(e:Event):void{
			tivoRemote.num7();
		}
		
		protected function pad8_clickHandler(e:Event):void{
			tivoRemote.num8();
		}
		
		protected function pad9_clickHandler(e:Event):void{
			tivoRemote.num9();
		}
		
		protected function pad0_clickHandler(e:Event):void{
			tivoRemote.num0();
		}
		
		protected function enter_clickHandler(e:Event):void{
			tivoRemote.enter();
		}
		
		protected function clear_clickHandler(e:Event):void{
			tivoRemote.clear();
		}
		
		protected function thumbsUp_clickHandler(e:Event):void
		{
			tivoRemote.thumbsup();
		}
		
		protected function thumbsDown_clickHandler(e:Event):void
		{
			tivoRemote.thumbsdown();
		}
		
		protected function play_clickHandler():void{
			tivoRemote.play();
		}
		
		protected function advance_clickHandler():void{
			tivoRemote.advance();
		}
		
		protected function replay_clickHandler():void{
			tivoRemote.replay();
		}
		
		private function closeWindow(event:MouseEvent):void{
			NativeApplication.nativeApplication.exit();
		}
		
	}
}
package
{
	
	import com.terrenceryan.tivoremote.Tivo;
	import com.terrenceryan.tivoremote.TivoRemote;
	import com.terrenceryan.tivoremote.TivoService;
	
	import components.ArrowPad;
	import components.BasePad;
	import components.ChannelPad;
	import components.LabelButton;
	import components.NumberPad;
	import components.PlayControlPad;
	import components.ThumbsPad;
	
	import flash.desktop.NativeApplication;
	import flash.display.GradientType;
	import flash.display.Graphics;
	import flash.geom.Matrix;
	import flash.display.SpreadMethod;
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
		protected var tivoButton:LabelButton = null;
		
		
		private var centerLine:int = 0;
		
		private var BUTTON_WIDTH:int;
		private var BUTTON_HEIGHT:int;
		private var PADDING:int;
		
		private const COLUMN_COUNT:int = 10;
		private const ROW_COUNT:int = 10;
		
		private var ROWS:Array = initRows();
		
		private var deviceScreenWidth:int;
		
		public function TivoRemoteInterface()
		{
			super();
			
			deviceScreenWidth = stage.fullScreenWidth;
			
			BUTTON_WIDTH = initButtonDefaults();
			BUTTON_HEIGHT = initButtonDefaults();
			PADDING = initPaddingDefault();
			
			// support autoOrients
			stage.align = StageAlign.TOP_LEFT;
			stage.scaleMode = StageScaleMode.NO_SCALE;
			centerLine = deviceScreenWidth/2;
			
			trace(centerLine);
			
			var basePad:BasePad = new BasePad();
			
			var tivoButton_width:int = (5 * BUTTON_WIDTH) + (5 * PADDING );
			drawBG();
			
			tivoButton = basePad.getLabelButton("Tivo",0, 10,14,tivoButton_width);
			tivoButton.x = centerLine - tivoButton.width/2;
			tivoButton.addEventListener(MouseEvent.CLICK, tivo_clickHandler);
						addChild(tivoButton);
			
			
			
			
			
			drawArrowPad();
			
			drawPlayControlPad();
			drawNumPad();
			
			drawChannelPad();
			drawThumbsPad();
			
			drawOtherButtons();
			
			tivoRemote = new TivoRemote("D");
			//tivoRemote = new TivoRemote("10.0.1.191");
			
				
		}
		
		private function initButtonDefaults():int{
			var result:int = 70;
			if (deviceScreenWidth < 400){
				result = 30;
			}
			return result;
		}
		
		private function initPaddingDefault():int{
			var result:int = 8;
			if (deviceScreenWidth < 400){
				result = 4;
			}
			return result;
		}
		
		private function initRows():Array{
			var result:Array = new Array();
			var i:int = 0;
			
			for (i=0; i < ROW_COUNT; i++){
				result.push((BUTTON_HEIGHT * i) + (PADDING *i) + 10);
			}
			
			return result;
		}
		
		
		private function locateBelow(object:Object):int{
			var result:int = object.y + object.height + PADDING;
			return result;
		}
		
		private function centerObject(object:Object):void{
			object.x= centerLine - object.width/2;
		}
		
		private function drawOtherButtons():void{
			var basePad:BasePad = new BasePad();
			
		
			
			var liveButton:LabelButton =  basePad.getLabelButton("Live",channelPad.x, channelPad.y + channelPad.height + PADDING,14);;
			liveButton.addEventListener(MouseEvent.CLICK, live_clickHandler);
			addChild(liveButton);
			
			
			
			var guideButton:LabelButton =  basePad.getLabelButton("Guide",thumbsPad.x, thumbsPad.y + thumbsPad.height + PADDING,14);
			guideButton.addEventListener(MouseEvent.CLICK, live_clickHandler);
			addChild(guideButton);
			
			var infoButton:LabelButton =  basePad.getLabelButton("Info",thumbsPad.x, numpad.y,14);
			infoButton.addEventListener(MouseEvent.CLICK, live_clickHandler);
			addChild(infoButton);
		}
		
		private function drawChannelPad():void{
			channelPad = new ChannelPad();
			channelPad.x = (arrowPad.x - channelPad.width) -10 ;
			channelPad.y = arrowPad.y;
			channelPad.addEventListener("upClick", channelUp_clickHandler);
			channelPad.addEventListener("downClick", channelDown_clickHandler);
			addChild(channelPad);
		}
		
		private function drawThumbsPad():void{
			thumbsPad = new ThumbsPad();
			thumbsPad.x =  arrowPad.x + arrowPad.width + 10 ;
			thumbsPad.y = arrowPad.y;
			thumbsPad.addEventListener("upClick", thumbsUp_clickHandler);
			thumbsPad.addEventListener("downClick", thumbsDown_clickHandler);
			addChild(thumbsPad);
		}
		
		private function drawPlayControlPad():void{
			playControlPad = new PlayControlPad();
			centerObject(playControlPad);
			playControlPad.y = locateBelow(arrowPad);
			playControlPad.addEventListener("reverse", actionReverse_clickHandler);
			playControlPad.addEventListener("replay", actionReplay_clickHandler);
			playControlPad.addEventListener("pause", actionPause_clickHandler);
			playControlPad.addEventListener("slow", actionSlow_clickHandler);
			playControlPad.addEventListener("forward", actionForward_clickHandler);
			
			addChild(playControlPad);
		}
		
		private function drawArrowPad():void{
			arrowPad = new ArrowPad(deviceScreenWidth);
			centerObject(arrowPad);
			arrowPad.y= locateBelow(tivoButton);
			arrowPad.addEventListener("upClick", up_clickHandler);
			arrowPad.addEventListener("downClick", down_clickHandler);
			arrowPad.addEventListener("leftClick", left_clickHandler);
			arrowPad.addEventListener("rightClick", right_clickHandler);
			arrowPad.addEventListener("selectClick", select_clickHandler);
			addChild(arrowPad);
		}
		
		private function drawNumPad():void{
			numpad = new NumberPad();
			numpad.x = centerLine - numpad.width/2;
			numpad.y = locateBelow(playControlPad);
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
		
		private function drawBG():void{
			/****************************
			 Define Variables
			 ****************************/
			//Type of Gradient we will be using
			var fType:String = GradientType.LINEAR;
			//Colors of our gradient in the form of an array
			var colors:Array = [0x555555, 0x222222 ];
			//Store the Alpha Values in the form of an array
			var alphas:Array = [ 1, 1 ];
			//Array of color distribution ratios.  
			//The value defines percentage of the width where the color is sampled at 100%
			var ratios:Array = [ 0, 255 ];
			//Create a Matrix instance and assign the Gradient Box
			var matr:Matrix = new Matrix();
			matr.createGradientBox( stage.fullScreenWidth,  stage.fullScreenHeight, Math.PI/2, 0,0);
			//SpreadMethod will define how the gradient is spread. Note!!! Flash uses CONSTANTS to represent String literals
			var sprMethod:String = SpreadMethod.PAD;
			//Start the Gradietn and pass our variables to it
			var sprite:Sprite = new Sprite();
			//Save typing + increase performance through local reference to a Graphics object
			var g:Graphics = sprite.graphics;
			g.beginGradientFill( fType, colors, alphas, ratios, matr, sprMethod );
			g.drawRect( 0, 0, stage.fullScreenWidth, stage.fullScreenHeight );
			
			addChild( sprite );
			
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
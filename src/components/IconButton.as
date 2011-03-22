package components
{
	import flash.display.DisplayObject;
	import flash.display.GradientType;
	import flash.display.Shape;
	import flash.display.SimpleButton;
	import flash.display.Sprite;
	import flash.events.MouseEvent;
	import flash.geom.Matrix;
	import flash.text.TextField;
	import flash.text.TextFormat;
	
	[Event(name="MouseEvent.CLICK", type="flash.events.MouseEvent")]
	
	import flashx.textLayout.formats.TextAlign;
	import flash.display.Loader;
	import flash.net.URLRequest;
	import flash.events.Event;
	
	public class IconButton extends SimpleButton
	{
		
		
		private var BUTTON_WIDTH:int = 50;
		private var BUTTON_HEIGHT:int = 50;
		private var BUTTON_CURVE:int = 10;
		private var loader:Loader;
		private var image:DisplayObject;
		private var _iconPath:String = "";
		private var _buttonWidth:int;
		private var _buttonHeight:int;
		
		public function IconButton(iconPath:String,buttonWidth:int=50,buttonHeight:int=50):void
		{
			super(null, null, null, null);
			_iconPath = iconPath;
			_buttonWidth = buttonWidth;
			_buttonHeight = buttonHeight;
			init();
		}
		
		
		public function get iconPath():String
		{
			return _iconPath;
		}

		public function set iconPath(value:String):void
		{
			_iconPath = value;
		}

		private function init():void
		{
			var alphas:Array = [1, 1];
			var colors:Array = [0xCCCCCC, 0x999999];			
			var ratios:Array = [0x00, 0xFF];
			var matrix:Matrix = new Matrix();
			var hit:Shape = null;
			var state:Sprite = null;
			var label:TextField = null;
			
			var urlReq:URLRequest = new URLRequest(_iconPath);
			
			matrix.createGradientBox( _buttonWidth, _buttonHeight, 90 * ( Math.PI / 180 ) );			
			
			// Up
			state = new Sprite();
			state.graphics.lineStyle( 1, 0x00FF00, 0 );
			state.graphics.beginGradientFill( GradientType.LINEAR, colors, alphas, ratios, matrix );  
			state.graphics.drawRoundRect( 0, 0, _buttonWidth, _buttonHeight, BUTTON_CURVE, BUTTON_CURVE );
			state.graphics.endFill();
			
			var uploader:Loader = new Loader();
			uploader.contentLoaderInfo.addEventListener(Event.COMPLETE, imageComplete);
			uploader.load(urlReq);
			state.addChild(uploader);
			
			upState = state;
			
			// Hit
			hit = new Shape();	
			hit.graphics.lineStyle( 1, 0x00FF00, 0 );
			hit.graphics.beginGradientFill( GradientType.LINEAR, colors, alphas, ratios, matrix );  
			hit.graphics.drawRoundRect( 0, 0, _buttonWidth, _buttonHeight, BUTTON_CURVE, BUTTON_CURVE );
			hit.graphics.endFill();			
			
			hitTestState = hit;
			
			
			// Over
			colors = [0x999999, 0xCCCCCC];
			
			state = new Sprite();
			state.graphics.lineStyle( 1, 0x00FF00, 0 );
			state.graphics.beginGradientFill( GradientType.LINEAR, colors, alphas, ratios, matrix );  
			state.graphics.drawRoundRect( 0, 0, _buttonWidth, _buttonHeight, BUTTON_CURVE, BUTTON_CURVE );
			state.graphics.endFill();
			var overloader:Loader = new Loader();
			overloader.contentLoaderInfo.addEventListener(Event.COMPLETE, imageComplete);
			overloader.load(urlReq);
			state.addChild(overloader);
			overState = state;	
			
			// Down
			colors = [0xCCCCCC, 0x999999];
			
			state = new Sprite();
			state.graphics.lineStyle( 1, 0x00FF00, 0 );
			state.graphics.beginGradientFill( GradientType.LINEAR, colors, alphas, ratios, matrix );  
			state.graphics.drawRoundRect( 1, 1, _buttonWidth, _buttonHeight, BUTTON_CURVE, BUTTON_CURVE );
			state.graphics.endFill();
			
			var downloader:Loader = new Loader();
			downloader.contentLoaderInfo.addEventListener(Event.COMPLETE, imageCompleteDown);
			downloader.load(urlReq);
			
			state.addChild(downloader);
			downState = state;
			
						
			
		}
		
		protected function imageComplete(event:Event):void
		{
			event.currentTarget.loader.x = _buttonWidth/2 - event.currentTarget.width/2;
			event.currentTarget.loader.y = _buttonWidth/2 - event.currentTarget.height/2;
		}
		
		protected function imageCompleteDown(event:Event):void
		{
			event.currentTarget.loader.x = _buttonWidth/2 - event.currentTarget.width/2 + 1;
			event.currentTarget.loader.y = _buttonWidth/2 - event.currentTarget.height/2 + 1;
		}
		
	}
}
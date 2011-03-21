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
	
	public class LabelButton extends SimpleButton
	{
		
		private const BUTTON_WIDTH:int = 50;
		private const BUTTON_HEIGHT:int = 50;
		private var BUTTON_CURVE:int = 10;
		private var FONTFACE:String = "Droid Sans";
		
		public function LabelButton(buttonLabel:String, fontSize:int=20,buttonWidth:int=BUTTON_WIDTH,buttonHeight:int = BUTTON_HEIGHT)
		{
			super(null, null, null, null);
			init(buttonLabel, fontSize,buttonWidth,buttonHeight);
		}
		
		private function init(buttonLabel:String,fontSize:int=20,buttonWidth:int=50,buttonHeight:int=50):void
		{
			var alphas:Array = [1, 1];
			var colors:Array = [0xCCCCCC, 0x999999];			
			var ratios:Array = [0x00, 0xFF];
			var matrix:Matrix = new Matrix();
			var hit:Shape = null;
			var state:Sprite = null;
			var label:TextField = null;
			
			matrix.createGradientBox( buttonWidth, buttonHeight, 90 * ( Math.PI / 180 ) );			
			
			// Up
			state = new Sprite();
			state.graphics.lineStyle( 1, 0x00FF00, 0 );
			state.graphics.beginGradientFill( GradientType.LINEAR, colors, alphas, ratios, matrix );  
			state.graphics.drawRoundRect( 0, 0, buttonWidth, buttonHeight, BUTTON_CURVE, BUTTON_CURVE );
			state.graphics.endFill();
			
			label = new TextField();
			label.width = buttonWidth;
			label.height = buttonHeight;
			label.x = 0;
			label.y = buttonHeight/4;
			label.defaultTextFormat = new TextFormat( FONTFACE, fontSize, 0x000000, true, null, null, null, null, TextAlign.CENTER );
			label.selectable = false;
			label.text = buttonLabel;			
			state.addChild( label );
			
			upState = state;
			
			// Hit
			hit = new Shape();	
			hit.graphics.lineStyle( 1, 0x00FF00, 0 );
			hit.graphics.beginGradientFill( GradientType.LINEAR, colors, alphas, ratios, matrix );  
			hit.graphics.drawRoundRect( 0, 0, buttonWidth, buttonHeight, BUTTON_CURVE, BUTTON_CURVE );
			hit.graphics.endFill();			
			
			hitTestState = hit;
			
			// Over
			colors = [0x999999, 0xCCCCCC];
			
			state = new Sprite();
			state.graphics.lineStyle( 1, 0x00FF00, 0 );
			state.graphics.beginGradientFill( GradientType.LINEAR, colors, alphas, ratios, matrix );  
			state.graphics.drawRoundRect( 0, 0, buttonWidth, buttonHeight, BUTTON_CURVE, BUTTON_CURVE );
			state.graphics.endFill();
			
			label = new TextField();
			label.width = buttonWidth;
			label.height = buttonHeight;
			label.x = 0;
			label.y = buttonHeight/4;
			label.defaultTextFormat = new TextFormat( FONTFACE, fontSize, 0xFFFFFF, true, null, null, null, null, TextAlign.CENTER );
			label.selectable = false;
			label.text = buttonLabel;			
			state.addChild( label );
			
			overState = state;	
			
			// Down
			colors = [0xCCCCCC, 0x999999];
			
			state = new Sprite();
			state.graphics.lineStyle( 1, 0x00FF00, 0 );
			state.graphics.beginGradientFill( GradientType.LINEAR, colors, alphas, ratios, matrix );  
			state.graphics.drawRoundRect( 3, 3, buttonWidth, buttonHeight, BUTTON_CURVE, BUTTON_CURVE );
			state.graphics.endFill();
			
			label = new TextField();
			label.width = buttonWidth;
			label.height = buttonHeight;
			label.x = 3;
			label.y = (buttonHeight/4) +3;
			label.defaultTextFormat = new TextFormat( FONTFACE, fontSize, 0xFFFFFF, true, null, null, null, null, TextAlign.CENTER );
			label.selectable = false;
			label.text = buttonLabel;			
			state.addChild( label );
			
			downState = state;
		}
		
	}
}
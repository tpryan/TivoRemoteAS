package components
{
	import flash.display.GradientType;
	import flash.display.Graphics;
	import flash.display.SpreadMethod;
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.events.FocusEvent;
	import flash.events.MouseEvent;
	import flash.geom.Matrix;
	import flash.text.TextField;
	import flash.text.TextFormat;
	
	import flashx.textLayout.formats.TextAlign;
	
	
	[Event(name="settingChanged", type="flash.events.Event")]
	
	
	public class Settings extends Sprite
	{
		
		protected var _settingWidth:int;
		protected var _settingHeight:int;
		protected var hostname:Hostname = new Hostname();
		public var textBox:SettingTextBox = new SettingTextBox();
		protected var message:TextField = new TextField();
		private var FONTFACE:String = "Droid Sans";
		
		
		
		public function Settings(settingWidth:int,settingHeight:int)
		{
			super();
			_settingWidth = settingWidth;
			_settingHeight = settingHeight;
			
			drawBG();
			textBox.textValue = hostname.name;
			textBox.addEventListener(FocusEvent.FOCUS_IN,clearMessage);
			addChild(textBox);
			
			
			var saveButton:LabelButton = new LabelButton("Save",20,250,50);
			saveButton.x = 10;
			saveButton.y = textBox.y + textBox.height + 10;
			saveButton.addEventListener(MouseEvent.CLICK, saveHostname);
			addChild(saveButton);
			
			var closeButton:LabelButton = new LabelButton("Close",20,250,50);
			closeButton.x = 10;
			closeButton.y = settingHeight - saveButton.height - 10;
			closeButton.addEventListener(MouseEvent.CLICK, close);
			addChild(closeButton);
			
			
			message.x = 10;
			message.width = 250;
			message.y = saveButton.y + saveButton.height + 10;
			message.defaultTextFormat = new TextFormat( FONTFACE, 16, 0x000000, true, null, null, null, null, TextAlign.LEFT );
			addChild(message);
			
			
		}
		
		protected function clearMessage(event:FocusEvent):void
		{
			message.text = "";
			
		}
		
		protected function saveHostname(event:MouseEvent):void
		{
			hostname.name = textBox.textValue;
			hostname.save();
			dispatchEvent(new Event("settingChanged"));
			message.text = "Tivo Info Saved";
			
		}
		
		protected function close(event:MouseEvent):void
		{
			parent.removeChild(this);
			
		}		
		
		private function drawBG():void{
			/****************************
			 Define Variables
			 ****************************/
			//Type of Gradient we will be using
			var fType:String = GradientType.LINEAR;
			//Colors of our gradient in the form of an array
			var colors:Array = [0xAAAAAA, 0x555555 ];
			//Store the Alpha Values in the form of an array
			var alphas:Array = [ 1, 1 ];
			//Array of color distribution ratios.  
			//The value defines percentage of the width where the color is sampled at 100%
			var ratios:Array = [ 0, 255 ];
			//Create a Matrix instance and assign the Gradient Box
			var matr:Matrix = new Matrix();
			matr.createGradientBox( _settingWidth,  _settingHeight, Math.PI/2, 0,0);
			//SpreadMethod will define how the gradient is spread. Note!!! Flash uses CONSTANTS to represent String literals
			var sprMethod:String = SpreadMethod.PAD;
			//Start the Gradietn and pass our variables to it
			var sprite:Sprite = new Sprite();
			//Save typing + increase performance through local reference to a Graphics object
			var g:Graphics = sprite.graphics;
			g.beginGradientFill( fType, colors, alphas, ratios, matr, sprMethod );
			g.drawRect( 0, 0, _settingWidth,  _settingHeight);
			
			addChild( sprite );
			
		}
		
		
		
	}
}
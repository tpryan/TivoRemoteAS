package components
{
	import flash.display.GradientType;
	import flash.display.Graphics;
	import flash.display.SpreadMethod;
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.events.MouseEvent;
	import flash.geom.Matrix;
	
	[Event(name="settingChanged", type="flash.events.Event")]
	
	
	public class Settings extends Sprite
	{
		
		protected var _settingWidth:int;
		protected var _settingHeight:int;
		protected var hostname:Hostname = new Hostname();
		public var textBox:SettingTextBox = new SettingTextBox();
		
		public function Settings(settingWidth:int,settingHeight:int)
		{
			super();
			_settingWidth = settingWidth;
			_settingHeight = settingHeight;
			
			drawBG();
			textBox.textValue = hostname.name;
			addChild(textBox);
			
			
			var saveButton:LabelButton = new LabelButton("Save",20,290,50);
			saveButton.x = 10;
			saveButton.y = textBox.y + textBox.height + 10;
			saveButton.addEventListener(MouseEvent.CLICK, saveHostname);
			addChild(saveButton);
			
			var closeButton:LabelButton = new LabelButton("Close",20,290,50);
			closeButton.x = 10;
			closeButton.y = settingHeight - saveButton.height - 10;
			closeButton.addEventListener(MouseEvent.CLICK, close);
			addChild(closeButton);
			
		}
		
		protected function saveHostname(event:MouseEvent):void
		{
			hostname.name = textBox.textValue;
			hostname.save();
			dispatchEvent(new Event("settingChanged")); 
			
		}
		
		protected function close(event:MouseEvent):void
		{
			this.x = _settingWidth;
			
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
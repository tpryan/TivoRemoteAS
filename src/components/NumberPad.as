package components
{
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.events.MouseEvent;
	import flash.text.TextFormat;
	
	
	[Event(name="num1", type="flash.events.Event")]
	[Event(name="num2", type="flash.events.Event")]
	[Event(name="num3", type="flash.events.Event")]
	[Event(name="num4", type="flash.events.Event")]
	[Event(name="num5", type="flash.events.Event")]
	[Event(name="num6", type="flash.events.Event")]
	[Event(name="num7", type="flash.events.Event")]
	[Event(name="num8", type="flash.events.Event")]
	[Event(name="num9", type="flash.events.Event")]
	[Event(name="num0", type="flash.events.Event")]
	[Event(name="e", type="flash.events.Event")]
	[Event(name="c", type="flash.events.Event")]
	
	
	
	public class NumberPad extends BasePad
	{
		
		protected var COLUMNSLOCAL:Array = new Array(0,50,100);
		protected var ROWSLOCAL:Array = new Array(0,50,100,150);
		
		public function NumberPad()
		{
			
			super();
			
			//1
			var num1:LabelButton = getLabelButton("1", COLUMNSLOCAL[0], ROWSLOCAL[0]);
			num1.addEventListener(MouseEvent.CLICK, num0_clicked);
			addChild(num1);
			
			//2
			var num2:LabelButton = getLabelButton("2", COLUMNSLOCAL[1], ROWSLOCAL[0]);
			num2.addEventListener(MouseEvent.CLICK, num2_clicked);
			addChild(num2);
			
			//3
			var num3:LabelButton = getLabelButton("3", COLUMNSLOCAL[2], ROWSLOCAL[0]);
			num3.addEventListener(MouseEvent.CLICK, num3_clicked);
			addChild(num3);
			
			//4
			var num4:LabelButton = getLabelButton("4", COLUMNSLOCAL[0], ROWSLOCAL[1]);
			num4.addEventListener(MouseEvent.CLICK, num4_clicked);
			addChild(num4);
			
			//5
			var num5:LabelButton = getLabelButton("5", COLUMNSLOCAL[1], ROWSLOCAL[1]);
			num5.addEventListener(MouseEvent.CLICK, num5_clicked);
			addChild(num5);
			
			//6
			var num6:LabelButton = getLabelButton("6", COLUMNSLOCAL[2], ROWSLOCAL[1]);
			num6.addEventListener(MouseEvent.CLICK, num6_clicked);
			addChild(num6);
			
			//7
			var num7:LabelButton = getLabelButton("7", COLUMNSLOCAL[0], ROWSLOCAL[2]);
			num7.addEventListener(MouseEvent.CLICK, num7_clicked);
			addChild(num7);
			
			//8
			var num8:LabelButton = getLabelButton("8", COLUMNSLOCAL[1], ROWSLOCAL[2]);
			num8.addEventListener(MouseEvent.CLICK, num8_clicked);
			addChild(num8);
			
			//9
			var num9:LabelButton = getLabelButton("9", COLUMNSLOCAL[2], ROWSLOCAL[2]);
			num9.addEventListener(MouseEvent.CLICK, num9_clicked);
			addChild(num9);
			
			//c - Clear button
			var numc:LabelButton = getLabelButton("Clear", COLUMNSLOCAL[0], ROWSLOCAL[3], 14);
			numc.addEventListener(MouseEvent.CLICK, c_clicked);
			addChild(numc);
			
			//0
			var num0:LabelButton = getLabelButton("0", COLUMNSLOCAL[1], ROWSLOCAL[3]);
			num0.addEventListener(MouseEvent.CLICK, num0_clicked);
			addChild(num0);
			
			//e
			var nume:LabelButton = getLabelButton("Enter", COLUMNSLOCAL[2], ROWSLOCAL[3],14);
			nume.addEventListener(MouseEvent.CLICK, e_clicked);
			addChild(nume);
		
		}
		
		public override function getLabelButton(label:String, x:int, y:int, fontSize:int=20,width:int=BUTTON_WIDTH,height:int=BUTTON_HEIGHT):LabelButton{
			return super.getLabelButton(label, x, y, fontSize,40,40);
		}
		
		
		
		private function num1_clicked(e:MouseEvent):void{
			dispatchEvent(new Event("num1")); 
		}
		private function num2_clicked(e:MouseEvent):void{
			dispatchEvent(new Event("num2")); 
		}
		private function num3_clicked(e:MouseEvent):void{
			dispatchEvent(new Event("num3")); 
		}
		private function num4_clicked(e:MouseEvent):void{
			dispatchEvent(new Event("num4")); 
		}
		private function num5_clicked(e:MouseEvent):void{
			dispatchEvent(new Event("num5")); 
		}
		private function num6_clicked(e:MouseEvent):void{
			dispatchEvent(new Event("num6")); 
		}
		private function num7_clicked(e:MouseEvent):void{
			dispatchEvent(new Event("num7")); 
		}
		private function num8_clicked(e:MouseEvent):void{
			dispatchEvent(new Event("num8")); 
		}
		private function num9_clicked(e:MouseEvent):void{
			dispatchEvent(new Event("num9")); 
		}
		private function num0_clicked(e:MouseEvent):void{
			dispatchEvent(new Event("num0")); 
		}
		private function e_clicked(e:MouseEvent):void{
			dispatchEvent(new Event("e")); 
		}
		private function c_clicked(e:MouseEvent):void{
			dispatchEvent(new Event("c")); 
		}
		
	}
}
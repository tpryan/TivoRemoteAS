package components
{
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.events.MouseEvent;
	import flash.text.TextFormat;
	
	
	
	[Event(name="upClick", type="flash.events.Event")]
	[Event(name="downClick", type="flash.events.Event")]
	[Event(name="leftClick", type="flash.events.Event")]
	[Event(name="rightClick", type="flash.events.Event")]
	[Event(name="selectClick", type="flash.events.Event")]
	
	public class ArrowPad extends BasePad
	{
		public function ArrowPad(screenWidth:int=480)
		{
			super(screenWidth);
			var fontSize:int = 24;
			
			if (screenWidth < 400){
				fontSize = 14;
			}
			
			
			//up
			var up:IconButton = getIconButton("/assets/controls/a_up_s1.png", COLUMNS[1], ROWS[0]);
			up.addEventListener(MouseEvent.CLICK, up_clicked);
			addChild(up);
			
			//left
			var left:IconButton = getIconButton("/assets/controls/a_left_s1.png", COLUMNS[0], ROWS[1]);
			left.addEventListener(MouseEvent.CLICK, left_clicked);
			addChild(left);
			
			//right
			var right:IconButton = getIconButton("/assets/controls/a_right_s1.png", COLUMNS[2], ROWS[1]);
			right.addEventListener(MouseEvent.CLICK, right_clicked);
			addChild(right);
			
			//down
			var down:IconButton = getIconButton("/assets/controls/a_down_s1.png", COLUMNS[1], ROWS[2]);
			down.addEventListener(MouseEvent.CLICK, down_clicked);
			addChild(down);
			
			//select
			var select:LabelButton = getLabelButton("Select", COLUMNS[1], ROWS[1], fontSize);
			down.addEventListener(MouseEvent.CLICK, select_clicked);
			addChild(select);
			
			
			
			
			
			
		}
		
		private function up_clicked(e:MouseEvent):void{
			dispatchEvent(new Event("upClick")); 
		}
		
		private function down_clicked(e:MouseEvent):void{
			dispatchEvent(new Event("downClick")); 
		}
		
		private function left_clicked(e:MouseEvent):void{
			dispatchEvent(new Event("leftClick")); 
		}
		
		private function right_clicked(e:MouseEvent):void{
			dispatchEvent(new Event("rightClick")); 
		}
		
		private function select_clicked(e:MouseEvent):void{
			dispatchEvent(new Event("selectClick")); 
		}
		
	}
}
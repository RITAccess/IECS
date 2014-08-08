package  {
	
	import flash.display.MovieClip;
	import flash.events.MouseEvent;
	import flash.geom.Point;
	
	public class Block extends MovieClip {
		
		protected var Position:Point;
		
		public function Block() {
			x =622.35
			Position = new Point(x,y);
			buttonMode = true;
			addEventListener(MouseEvent.MOUSE_DOWN, down);
			
		}
		
		protected function down(event:MouseEvent):void
		{
			parent.addChild(this);
			startDrag();
			stage.addEventListener(MouseEvent.MOUSE_UP, stageUp);
			trace(parent.name);
			
		}
		protected function stageUp(event:MouseEvent):void
		{
			stage.removeEventListener(MouseEvent.MOUSE_UP, stageUp);
			if (event.target.x <= 505.75) {
				returnToOriginalPos();
				//event.target.x = 622.35
			}
			if (event.target.y <= 116.05) {
				event.target.y = 116.05
			}
			if (event.target.y >= 767.2) {
				event.target.y = 767.2
			}
			stopDrag();
			



			
			if(dropTarget.parent.name == "root1")
			{
				trace("dropped")

			}
			else
			{
				trace("dropped on nothing")
				x = parent.x
				y = event.target.y +40
			}
		}	
		protected function returnToOriginalPos():void
		{
			x = Position.x;
			y = Position.y;
		}
		
	}
	
}

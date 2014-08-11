package  {
	
	import flash.display.MovieClip;
	import flash.events.MouseEvent;
	import flash.geom.Point;
	
	public class Block extends MovieClip {
		
		protected var Position:Point;
		
		public function Block() {
			Position = new Position(x,y);
			buttonMode = true;
			addEventListener(MouseEvent.MOUSE_DOWN, down);
			
		}
		
		protected function down(event:MouseEvent):void
		{
			parent.addChild(this);
			startDrag();
			stage.addEventListener(MouseEvent.MOUSE_UP, stageUp);
			
		}
		protected function stageUp(event:MouseEvent):void
		{
			stage.removeEventListener(MouseEvent.MOUSE_UP, stageUp);
			stopDrag();
			
			if(dropTarget.parent.name == "ocean")
			{
				trace("dropped")
				Position.x = 2
				Position.y =3
			}
		}
	}
	
}

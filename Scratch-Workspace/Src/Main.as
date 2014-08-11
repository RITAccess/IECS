package {
	import flash.display.Sprite;
	import flash.events.MouseEvent;
	public class Main extends Sprite {
		var xPos: int;
		var yPos: int;
		public function Main(): void {
			addListeners(ocean);
		}
		private function getPosition(target: Object): void {
			xPos = target.x;
			yPos = target.y;
		}
		private function dragObject(e: MouseEvent): void {
			getPosition(e.target);
			e.target.startDrag(true);
		}
		private function stopDragObject(e: MouseEvent): void {
			if (e.target.hitTestObject(getChildByName(e.target.name + "Target"))) {
				e.target.x = getChildByName(e.target.name + "Target").x;
				e.target.y = getChildByName(e.target.name + "Target").y;
			}
			if (e.target.x <= 505.75) {
				e.target.x = 505.75
			}
			if (e.target.y <= 116.05) {
				e.target.y = 116.05
			}
			if (e.target.y >= 767.2) {
				e.target.y = 767.2
			}
			e.target.stopDrag();
		}
		//class Foo {

		//	private var tl:MovieClip; // timeline
		//	private var mc:MovieClip; // the attached movieclip

		//	function Foo(t:MovieClip)
		//	{
		//		tl = t;
		//		mc = tl.attachMovie("AttachMe", "mc", 10);
		//		var b:Button = mc.btn;
		//		EventDispatcher.initialize(b);
		//		b.addEventListener("click", Delegate.create(this, onClick));
		//	}
		//	private function onClick(e:Object):Void
		//	{
		//		trace("Hi!");
		//	}
		//}
		private function addListeners(...objects): void {
			for (var i: int = 0; i < objects.length; i++) {
				objects[i].addEventListener(MouseEvent.MOUSE_DOWN, dragObject);
				objects[i].addEventListener(MouseEvent.MOUSE_UP, stopDragObject);
			}
		}
	}
}
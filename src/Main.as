package 
{
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.events.KeyboardEvent;
	import flash.ui.Keyboard;
	
	/**
	 * ...
	 * @author Jordi Prummel
	 */
	public class Main extends Sprite 
	{
		private var tank:Tank;
		private var wPressed:Boolean = false;
		private var aPressed:Boolean = false;
		private var sPressed:Boolean = false;
		private var dPressed:Boolean = false;
		
		
		
		public function Main():void 
		{
			if (stage) init();
			else addEventListener(Event.ADDED_TO_STAGE, init);
		}
		
		private function init(e:Event = null):void
		{
			removeEventListener(Event.ADDED_TO_STAGE, init);
			// entry point
			tank = new Tank();
			this.addChild(tank);
			tank.x = stage.stageWidth * 0.5;
			tank.y = stage.stageHeight * 0.5;
			
			
			stage.addEventListener(KeyboardEvent.KEY_DOWN, onKeyDown);
			stage.addEventListener(KeyboardEvent.KEY_UP, onKeyUp);
			this.addEventListener(Event.ENTER_FRAME, loop);
			
		}
		
		private function loop(e:Event):void 
		{
			if (wPressed)
			{
				tank.y -= 5;
			}
			if (aPressed)
			{
				tank.x -= 5;
			}
			if (sPressed)
			{
				tank.y += 5;
			}
			if (dPressed)
			{
				tank.x += 5;
			}
			
			
		}
		
		private function onKeyDown(e:KeyboardEvent):void 
		{
			if (e.keyCode == Keyboard.W)
			{
				//W is ingedrukt
				wPressed = true;
			}
			if (e.keyCode == Keyboard.A)
			{
				//A is ingedrukt
				aPressed = true;
			}
			if (e.keyCode == Keyboard.S)
			{
				//S is ingedrukt
				sPressed = true;
			}
			if (e.keyCode == Keyboard.D)
			{
				//D is ingedrukt
				dPressed = true;
			}
		
		}
		
		private function onKeyUp(e:KeyboardEvent):void
		{
			if (e.keyCode == Keyboard.W)
			{
				//W is losgelaten
				wPressed = false;
			}
			if (e.keyCode == Keyboard.A)
			{
				//A is losgelaten
				aPressed = false;
			}
			if (e.keyCode == Keyboard.S)
			{
				//S is losgelaten
				sPressed = false;
			}
			if (e.keyCode == Keyboard.D)
			{
				//D is losgelaten
				dPressed = false;
			}
		}
	}
	
}
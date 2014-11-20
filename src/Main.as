package 
{
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.events.KeyboardEvent;
	import flash.ui.Keyboard;
	
	import flash.geom.Point;
	
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
		
		private var input:Point;
		private var speed:Number =  0;
		
		
		
		public function Main():void 
		{
			if (stage) init();
			else addEventListener(Event.ADDED_TO_STAGE, init);
		}
		
		private function init(e:Event = null):void
		{
			
			input = new Point();
			
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
			//Y as gebruikt sin
			//X as gebruikt cos
			//ymove = sin(rot);
			//xmove = cos(rot);
			//rot is een radian en geen angle
			// we moeten onze angle omzetten naar een radian
			
			//degrees * Math.PI / 180;
			//radians * 180 / Math.PI;
			
			speed = input.y * 5;
			
			tank.rotation += input.x * 5;
			
			var radians:Number = tank.rotation * Math.PI / 180;
			var xMove:Number =  Math.cos(radians);
			var yMove:Number = Math.sin(radians);
			
			tank.x += xMove * -speed;
			tank.y += yMove * -speed;
			
			var diffX:Number = mouseX - tank.x;
			var diffY:Number = mouseY - tank.y;
			radians = Math.atan2(diffY, diffX)
			var degrees:Number = radians * 180 / Math.PI;
			
			tank.turnTurret(degrees - tank.rotation);
			
			
		}
		
		private function onKeyDown(e:KeyboardEvent):void 
		{
			if (e.keyCode == Keyboard.W)
			{
				//W is ingedrukt
				input.y = -1;
			}
			if (e.keyCode == Keyboard.A)
			{
				//A is ingedrukt
				input.x = -1;
			}
			if (e.keyCode == Keyboard.S)
			{
				//S is ingedrukt
				input.y = 1;
			
			}
			if (e.keyCode == Keyboard.D)
			{
				//D is ingedrukt				
				input.x = 1;
			}
		
		}
		
		private function onKeyUp(e:KeyboardEvent):void
		{
			if (e.keyCode == Keyboard.W)
			{
				//W is losgelaten
				input.y = 0;
			}
			if (e.keyCode == Keyboard.A)
			{
				//A is losgelaten
				input.x = 0;
			}
			if (e.keyCode == Keyboard.S)
			{
				//S is losgelaten
				input.y = 0;
			}
			if (e.keyCode == Keyboard.D)
			{
				//D is losgelaten
				input.x = 0;
			}
		}
	}
	
}
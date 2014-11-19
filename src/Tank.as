package  
{
	import flash.display.MovieClip;
	/**
	 * ...
	 * @author Jordi Prummel
	 */
	public class Tank extends MovieClip
	{
		private var tankBodyArt:MovieClip;
		private var tankTurrerArt:TankTurretArt;
		
		
		public function Tank() 
		{
			tankBodyArt = new TankBodyArt();//instantieren van de Class
			this.addChild(tankBodyArt);
			
			tankTurrerArt = new TankTurretArt();
			this.addChild(tankTurrerArt);
		}
		
	}

}
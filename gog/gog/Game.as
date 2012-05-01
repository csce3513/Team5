package gog {
	
	import flash.display.MovieClip;
	
	public class Game extends MovieClip
	{
		
		protected var userManager;
		
		public function Game(userManager : UserManager)
		{
			super();
			this.userManager = userManager;
		}
		
	} 
	
}
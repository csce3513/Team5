package gog {
	
	import flash.display.MovieClip;
	
	import flash.display.Sprite;
	import flash.display.SimpleButton;
	import flash.events.MouseEvent;
	
	public class GameMenu extends MovieClip
	{
		
		public function GameMenu(userManager : UserManager)
		{
			
			ricochetBall.label = "Ricochet";
			
			hiScoresButton.label = "Hiscores";
			
			ballDodgeButton.label = "Ball Dodge";
			
			ricochetBall.addEventListener(MouseEvent.CLICK, function() {
				  dispatchEvent(new GameEvent(GameEvent.INIT, "ricochet"));
			});
			
			hiScoresButton.addEventListener(MouseEvent.CLICK, function() {
				dispatchEvent(new GameEvent(GameEvent.HISCORES, ""));
			});
	
		}
		
	}
	
}
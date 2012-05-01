package gog {
	
	import flash.display.MovieClip;
	import gog.games.Ricochet;
	
	public class GameOfGames extends MovieClip
	{
		
		private var userManager : UserManager;
		private var loginScreen : LoginScreen;
		private var gameMenu : GameMenu;
		private var userName : String;
		
		private var game : Game;
		
		public function GameOfGames()
		{
			
			userManager = new UserManager();
			
			loginScreen = new LoginScreen(userManager);
			
			gameMenu = new GameMenu(userManager);
			
			var that = this;
			
			loginScreen.addEventListener(LoginEvent.AUTHED, function() {
				that.removeChild(loginScreen);
				that.addChild(gameMenu);
			});
			
			gameMenu.addEventListener(GameEvent.INIT, function(evt : GameEvent) {
				playGame(evt.getGame());
			});
			
			addChild(loginScreen);
			
		}
		
		private function replayGame(gameName : String)
		{
			playGame(gameName);
		}
		
		private function playGame(gameName : String)
		{
			if (gameName == "ricochet") {
				game = new Ricochet();
				if (getChildByName("gameMenu") != null) {
					removeChild(gameMenu);
				}
				addChild(game);
				bindGameEvents();
			} else if (gameName == "ballDodge") {

			}
		}
		
		private function bindGameEvents() : void
		{
			game.addEventListener(GameEvent.REPLAY, function(evt : GameEvent) {
				replayGame(evt.getGame());   
			});
			game.addEventListener(GameEvent.BACK_MENU, function(evt : GameEvent) {
				removeChild(game);
				game = null;
				addChild(gameMenu);
			});
		}
	

	}
	
}
package gog {
	
	import flash.display.MovieClip;
	import gog.games.Ricochet;
	
	public class GameOfGames extends MovieClip
	{
		
		private var userManager : UserManager;
		private var loginScreen : LoginScreen;
		private var gameMenu : GameMenu;
		//private var userName : String;
		private var user : User = null;
		
		private var scores : HiscoresMenu;
		
		private var game : Game;
		
		public function GameOfGames()
		{
			
			userManager = new UserManager();
			
			loginScreen = new LoginScreen(userManager);
			
			gameMenu = new GameMenu(userManager);
			
			var that = this;
			
			loginScreen.addEventListener(LoginEvent.AUTHED, function(evt : LoginEvent) {
				user = evt.getUser();
				that.removeChild(loginScreen);
				that.addChild(gameMenu);
			});
			
			gameMenu.addEventListener(GameEvent.INIT, function(evt : GameEvent) {
				playGame(evt.getGame());
			});
			
			gameMenu.addEventListener(GameEvent.HISCORES, function() {
				scores = new HiscoresMenu(userManager, user.getName());
				removeChild(gameMenu);
				addChild(scores);
				scores.addEventListener(GameEvent.HISCORES_EXIT, function() {
					removeChild(scores);
				  	scores = null;
					addChild(gameMenu);
				});
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
				game = new Ricochet(userManager);
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
			game.addEventListener(ScoreEvent.UPDATED, function(evt : ScoreEvent) {
				user.recordScore(evt.game, evt.score);
				userManager.saveUser(user);
			});
		}
	

	}
	
}
package gog {
	
	import flash.display.MovieClip;
	
	public class GameOfGames extends MovieClip
	{
		
		private var userManager : UserManager;
		private var loginScreen : LoginScreen;
		private var userName : String;
		
		public function GameOfGames()
		{
			
			userManager = new UserManager();
			
			loginScreen = new LoginScreen(userManager);
			
			var that = this;
			
			loginScreen.addEventListener(LoginEvent.AUTHED, function() {
				that.removeChild(loginScreen);  
			});
			
			addChild(loginScreen);
		}
	

	}
	
}
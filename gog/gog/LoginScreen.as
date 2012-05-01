package gog {
	
	import flash.display.MovieClip;
	
	import flash.display.Sprite;
	import flash.display.SimpleButton;
	import flash.events.MouseEvent;
	
	public class LoginScreen extends MovieClip
	{
		
		public function LoginScreen(userManager : UserManager)
		{
			
			loginButton.label = "Login";
			output.text = "";
			
			loginButton.addEventListener(MouseEvent.CLICK, function() {
				var un = username.text;
				if (un.match(/^[A-Za-z0-9]+$/)) {
					var user = userManager.getUserByName(un);
					if (user === null) {
						user = new User();
						user.setName(un);
						user.setLevel(1);
						userManager.saveUser(user);
					}
					dispatchEvent(new LoginEvent(LoginEvent.AUTHED, user));
				} else {
					output.text = "Usernames must be alphanumeric";
				}
			});
		}
		
	}
	
}
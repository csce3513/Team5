package {
	
	import flash.display.Sprite;
	import flash.display.SimpleButton;
	import flash.events.MouseEvent;
	import gog.UserManager;
	import gog.User;
	
	public class splash extends Sprite {
		public var game : the_game;
		
		public function splash(game : the_game) {
			
			playButton.visible = false;
			
			playButton.addEventListener(MouseEvent.CLICK, function() {
				game.select_the_level();
			});
			
			this.game = game;
			
			output.text = "";
			
			button.label = "Go!";
			button.addEventListener(MouseEvent.CLICK, function() {
				var un = username.text;
				if (un.match(/^[A-Za-z0-9]+$/)) {
					var um : UserManager = game.getUserManager();
					var user = um.getUserByName(un);
					var existed = (user !== null);
					if (user === null) {
						user = new User();
						user.setName(un);
						user.setLevel(1);
						um.saveUser(user);
					}
					button.visible = false;
					output.text = (existed) ? "User has been restored" : "User has been created";
					username.visible = false;
					playButton.visible = true;
				} else {
					output.text = "Usernames must be alphanumeric";
				}
			});
		}
		
		public function on_play_button_clicked(event:MouseEvent) {
			game.select_the_level();
		}
	
	}
	
}
package gog {
	
	import flash.display.MovieClip;
	
	import flash.display.Sprite;
	import flash.display.SimpleButton;
	import flash.events.MouseEvent;
	
	public class HiscoresMenu extends MovieClip
	{
		
		private var userManager : UserManager;
		private var userName;
		
		public function HiscoresMenu(userManager : UserManager, userName : String)
		{
			
			this.userManager = userManager;
			this.userName = userName;
			
			var highest = getHighestScore();
			
			if (highest) {
				highestLabel.text = highest.name + " with " + highest.score;
			} else {
				highestLabel.text = "N/A";
			}
			
			youLabel.text = new String(getUserScore());
			
			hiscoresBackButton.label = "Back to Menu";
			
			hiscoresBackButton.addEventListener(MouseEvent.CLICK, function() {
				  dispatchEvent(new GameEvent(GameEvent.HISCORES_EXIT, ""));
			});
	
		}
		
		private function getHighestScore() : Object
		{
			var max = null,
				users = userManager.getAllUsers(),
				score : int = 0,
				scores = {};
			for (var i in users) {
				if (users.hasOwnProperty(i)) {
					scores = users[i].getScores();
					score = sumScores(scores);
					if (!max || max.score < score) {
						max = {name: users[i].getName(), score: score};
					}
				}
			}
			return max;
		}
		
		private function getUserScore() : int
		{
			var user : User = userManager.getUserByName(userName);
			if (user) {
				return sumScores(user.getScores());
			}
			return 0;
		}
		
		private function sumScores(scores) : int
		{
			var total : int = 0;
			for (var i in scores) {
				if (scores.hasOwnProperty(i)) {
					total += scores[i];
				}
			}
			return total;
		}
		
	}
	
}
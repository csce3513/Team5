package
{
	import flash.display.Sprite;
	import flash.events.MouseEvent;
	import flash.display.MovieClip;
	import gog.games.BrickBreaker;
	
	public class level_selection extends Sprite {
		
		public var main_class:the_game;
		
		private var brickBreakerButton:level_thumbnail;
		
		private var brickBreaker:BrickBreaker;
		
		public function level_selection(game : the_game)
		{
			brickBreakerButton = new level_thumbnail("Ricochet", game);
			
			brickBreakerButton.y = 50;
			
			brickBreakerButton.addEventListener(MouseEvent.CLICK, (function(that) {
				return function(evt:MouseEvent) {
					that.removeChild(brickBreakerButton);
					that.brickBreaker = new BrickBreaker();
					that.addChild(brickBreaker);
				};
			}(this)));
			
			addChild(brickBreakerButton);
		}
		
	}
}
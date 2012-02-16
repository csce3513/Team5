package {
	import flash.display.Sprite;
	import flash.events.MouseEvent;
	public class level_selection extends Sprite {
		public var main_class:the_game;
		private var level_thumb:level_thumbnail;
		public function level_selection(passed_class:the_game) {
			main_class = passed_class;
			for (var i:int = 1; i<=5; i++) {
				level_thumb = new level_thumbnail(i,main_class);
				addChild(level_thumb);
			}
		}
	}
}
package {
	import flash.display.Sprite;
	import flash.display.SimpleButton;
	import flash.events.MouseEvent;
	import flash.text.*;
	public class the_game_itself extends Sprite {
		public var main_class:the_game;
		public var current_level:int;
		public function the_game_itself(passed_class:the_game,level:int) {
			current_level = level;
			gametext.text = "Playing level "+level;
			main_class = passed_class;

		}
	
	}
}
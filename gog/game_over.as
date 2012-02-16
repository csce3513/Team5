package {
	import flash.display.Sprite;
	import flash.display.SimpleButton;
	import flash.events.MouseEvent;
	import flash.text.*;
	public class game_over extends Sprite {
		public var main_class:the_game;
		public var last_level:int;
		public function game_over(passed_class:the_game,level:int) {
			last_level = level;
			main_class = passed_class;
			overtext.text = "Level "+level+" failed";
			play_again_button.addEventListener(MouseEvent.CLICK, play_again_button_clicked);
			level_select_button.addEventListener(MouseEvent.CLICK, level_select_button_clicked);
		}
		public function play_again_button_clicked(event:MouseEvent) {
			main_class.play_the_game(last_level);
		}
		public function level_select_button_clicked(event:MouseEvent) {
			main_class.select_the_level();
		}
	}
}
package {
	import flash.display.Sprite;
	import flash.display.SimpleButton;
	import flash.events.MouseEvent;
	public class how_to_play extends Sprite {
		public var main_class:the_game;
		public function how_to_play(passed_class:the_game) {
			main_class = passed_class;
			play_button.addEventListener(MouseEvent.CLICK, on_play_button_clicked);
			back_button.addEventListener(MouseEvent.CLICK, on_back_button_clicked);
		}
		public function on_play_button_clicked(event:MouseEvent) {
			main_class.select_the_level();
		}
		public function on_back_button_clicked(event:MouseEvent) {
			main_class.show_splash();
		}
	}
}
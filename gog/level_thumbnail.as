package {
	import flash.display.Sprite;
	import flash.events.MouseEvent;
	import flash.text.*;
	public class level_thumbnail extends Sprite {
		public var main_class:the_game;
		public var level_number:int
		public function level_thumbnail(i:int,passed_class:the_game) {
			main_class = passed_class;
			level_number = i
			y = 30+i*60 // check the value of y
			leveltext.text = "Game "+i
			addEventListener(MouseEvent.CLICK, on_level_clicked);
		}
		public function on_level_clicked(event:MouseEvent) {
			main_class.play_the_game(level_number);
		}
	}
}
package
{
	
	import flash.display.Sprite;
	import flash.events.MouseEvent;
	import flash.text.*;
	
	public class level_thumbnail extends Sprite
	{
		private var _game:the_game;
		private var _name:String;
		
		public function level_thumbnail(name:String, game:the_game)
		{
			_game = game;
			_name = name;
			leveltext.text = name;
		}
		
	}
}
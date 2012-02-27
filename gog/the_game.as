package 
{
	import flash.display.Sprite;
	
	import gog.User;
	import gog.ClassA;
	import gog.Multiplier;
	
	public class the_game extends Sprite
	{
		
		//Flash has this great idea that if a class isn't used
		//then don't export it.  That's all fine and well,
		//but for unit testing it's a bit of a pain...
		//(This is here just so gog.User is exported in the swc)
		private var dummy:User;
		private var dummy2:ClassA;
		private var dummy3:Multiplier;
		
		public var splash_screen:splash;
		public var play_screen:the_game_itself;
		public var game_over_screen:game_over;
		public var level_select_screen:level_selection;
		public var how_to_play_screen:how_to_play;
		public var congratz_screen:game_won;
		public function the_game()
		{
			show_splash();
		}
		public function show_splash()
		{
			splash_screen = new splash(this);
			remove_how_to_play();
			addChild(splash_screen);// check child is added
		}
		public function show_how_to_play()
		{
			how_to_play_screen = new how_to_play(this);
			remove_splash();
			addChild(how_to_play_screen);
		}
		public function show_game_over(level)
		{
			game_over_screen = new game_over(this,level);
			remove_play();
			addChild(game_over_screen);

		}
		public function show_congratz(level)
		{
			congratz_screen = new game_won(this,level);
			remove_play();
			addChild(congratz_screen);
		}
		public function select_the_level()
		{
			level_select_screen = new level_selection(this);
			remove_splash();// check splash screen is removed
			remove_how_to_play();
			remove_game_over();
			remove_congratz();
			addChild(level_select_screen);
		}
		public function play_the_game(level)
		{
			play_screen = new the_game_itself(this,level);
			remove_level_select();
			remove_game_over();
			remove_congratz();
			addChild(play_screen);
		}
		public function remove_if_possible(screen)
		{
			if (screen) {
				removeChild(screen);
				screen = null;
			}
		}
		public function remove_splash()
		{
			if (splash_screen) {
				removeChild(splash_screen);
				splash_screen = null;
			}
		}
		public function remove_how_to_play()
		{
			if (how_to_play_screen) {
				removeChild(how_to_play_screen);
				how_to_play_screen = null;
			}
		}
		public function remove_game_over()
		{
			if (game_over_screen) {
				removeChild(game_over_screen);
				game_over_screen = null;
			}
		}
		public function remove_level_select()
		{
			if (level_select_screen) {
				removeChild(level_select_screen);
				level_select_screen = null;
			}
		}
		public function remove_play()
		{
			if (play_screen) {
				removeChild(play_screen);
				play_screen = null;
			}
		}
		public function remove_congratz()
		{
			if (congratz_screen) {
				removeChild(congratz_screen);
				congratz_screen = null;
			}
		}
	}
}
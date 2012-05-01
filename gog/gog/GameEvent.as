package gog {
	
	import flash.events.Event;
	
	public class GameEvent extends Event
	{
		
		public static const INIT : String = "init";
		public static const START : String = "started";
		public static const LOST : String = "lost";
		public static const REPLAY : String = "replay";
		public static const BACK_MENU : String = "back_menu";
		public static const HISCORES : String = "hiscores";
		public static const HISCORES_EXIT : String = "hiscores_exit";
		
		private var game : String;
		
		public function GameEvent(type : String, game : String)
		{
			super(type);
			this.game = game;
		}
		
		public function getGame() : String
		{
			return game;
		}
	
	}
	
}
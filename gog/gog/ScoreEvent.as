package gog {
	
	import flash.events.Event;
	
	public class ScoreEvent extends Event
	{
		
		public static const UPDATED : String = "updated";
		
		public var game : String;
		public var score : int;
		
		public function ScoreEvent(type : String, game : String, score : int)
		{
			super(type);
			this.game = game;
			this.score = score;
		}
	
	}
	
}
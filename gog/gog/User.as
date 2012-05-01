package gog
{
	
	public class User
	{
		
		private var _name : String;
		private var _level : int;
		
		private var _scores : Object;
		
		public function User()
		{
			this._name = null;
			this._level = 1;
			this._scores = {};
		}
		
		public function setName(n:String) : void
		{
			this._name = n;
		}
		
		public function getName() : String
		{
			return this._name;
		}
		
		public function getLevel() : int
		{
			return this._level;
		}
		
		public function setLevel(level : int)
		{
			this._level = level;
		}
		
		public function recordScore(game : String, score : int) : User
		{
			if (!this._scores[game] || this._scores[game] < score) {
				this._scores[game] = score
			}
			return this;
		}
		
		public function getScore(game : String) : int
		{
			return (this._scores[game]) ? this._scores[game] : 0;
		}
		
		public function getScores() : Object
		{
			return (this._scores) ? this._scores : {};
		}
		
		public function setScores(scores : Object)
		{
			this._scores = scores;
		}
	
	}
	
}
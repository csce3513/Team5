package gog
{
	
	public class User
	{
		
		private var _name:String;
		private var _level : int;
		
		public function User()
		{
			this._name = null;
			this._level = 1;
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
	
	}
	
}
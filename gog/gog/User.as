package gog
{
	
	public class User
	{
		
		private var _name:String;
		
		public function User() {}
		
		public function setName(n:String) : void
		{
			this._name = n;
		}
		
		public function getName() : String
		{
			return this._name;
		}
	
	}
	
}
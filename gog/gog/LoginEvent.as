package gog {
	
	import flash.events.Event;
	
	public class LoginEvent extends Event
	{
		
		public static const AUTHED : String = "authed";
		public static const FAILED : String = "failed";
		
		private var user : User = null;
		
		public function LoginEvent(type : String, user : User = null)
		{
			super(type);
			this.user = user;
		}
		
		public function getUser() : User
		{
			return user;
		}
	
	}
	
}
package gog
{
	
	//import flash.filesystem.*;
	import flash.errors.EOFError;
	import gog.User;
	
	public class UserManager
	{
		
		//private var _file : File;
		
		private var _users : Object;
		
		public function UserManager()
		{
			this._users = {};
		}
		
		public function saveUser(user : User) : Boolean
		{
			
			this._users[user.getName()] = user;
			
			return true;
			
		}
		
		public function getAllUsers() : Object
		{
			return this._users;
		}
		
		public function count() : int
		{
			var users = getAllUsers();
			return users.length;
		}
		
		public function getUserByName(name : String) : User
		{
			if (this._users.hasOwnProperty(name)) {
				return this._users[name];
			} else {
				return null;
			}
		}
		
		public function clear()
		{
			this._users = {};
		}
	
	}
	
}
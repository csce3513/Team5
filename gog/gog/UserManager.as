package gog
{
	
	//import flash.filesystem.*;
	import flash.errors.EOFError;
	import gog.User;
	import flash.net.SharedObject;
	
	public class UserManager
	{
		
		//private var _file : File;
		
		private var _storage : SharedObject;
		
		public function UserManager()
		{
			this._storage = SharedObject.getLocal("users");
			if (!this._storage.data.users) {
				this._storage.data.users = {};
			}
		}
		
		public function saveUser(user : User) : Boolean
		{
			
			var u = {};
			u.name = user.getName();
			u.scores = user.getScores();
			
			this._storage.data.users[u.name] = u;
			
			return true;
			
		}
		
		public function getAllUsers() : Object
		{
			var u = {};
			for (var i in this._storage.data.users) {
				if (this._storage.data.users.hasOwnProperty(i)) {
					u[this._storage.data.users[i].name] = makeUser(this._storage.data.users[i]);
				}
			}
			return u;
		}
		
		public function count() : int
		{
			var users = getAllUsers();
			var num : int = 0;
			for (var u in users) {
				++num;
			}
			return num;
		}
		
		public function getUserByName(name : String) : User
		{
			if (this._storage.data.users.hasOwnProperty(name)) {
				return makeUser(this._storage.data.users[name]);
			} else {
				return null;
			}
		}
		
		public function clear()
		{
			this._storage.clear();
		}
		
		private function makeUser(u) : User
		{
			var user = new User();
			user.setName(u.name);
			user.setScores((u.scores) ? u.scores : {});
			return user;
		}
	
	}
	
}
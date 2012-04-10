package gog
{
	
	import flash.filesystem.*;
	import flash.errors.EOFError;
	import gog.User;
	
	public class UserManager
	{
		
		private var _file : File;
		
		private var _users : Object;
		
		//1046: Type was not found or was not a compile-time constant: File.
		//Confirmed to break for Tyler and Jon's computer
		public function UserManager(file : File)
		{
			this._users = {};
			this._file = file;
			
			if (this._file.exists) {
				var fs = new FileStream();
				fs.open(this._file, FileMode.READ);
				try {
					this._users = fs.readObject();
				} catch(err : EOFError) {
					this._users = {};
				}
				fs.close();
			} else {
				this._users = {};
			}
		}
		
		public function saveUser(user : User) : Boolean
		{
			
			this._users[user.getName()] = {"name": user.getName(), level: user.getLevel()};
			
			var fs = new FileStream();
			
			fs.open(this._file, FileMode.WRITE);
			
			fs.writeObject(this._users);
			
			fs.close();
			
			return true;
			
		}
		
		public function getAllUsers() : Array
		{
			var users = [];
			var u;
			var tmp;
			for (u in this._users) {
				if (this._users.hasOwnProperty(u)) {
					tmp = new User();
					tmp.setName(this._users[u].name);
					tmp.setLevel(this._users[u].level);
					users.push(tmp);
				}
			}
			return users;
		}
		
		public function count() : int
		{
			var users = getAllUsers();
			return users.length;
		}
		
		public function getUserByName(name : String) : User
		{
			if (this._users.hasOwnProperty(name)) {
				var u =  new User();
				u.setName(this._users[name].name);
				u.setLevel(this._users[name].level);
				return u;
			} else {
				return null;
			}
		}
		
		public function clear()
		{
			if (this._file.exists) {
				this._file.deleteFile();
			}
			this._users = {};
		}
	
	}
	
}
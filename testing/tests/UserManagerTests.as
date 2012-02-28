package tests
{
	
	import flexunit.framework.Assert;
	import org.flexunit.assertThat;
	import gog.UserManager;
	import gog.User;
	import flash.filesystem.File;
	
	public class UserManagerTests
	{

		[Test]
		public function testStoresAndRetrieves()
		{
		
			var f : File = File.applicationStorageDirectory.resolvePath("TestUsers");
			
			var um : UserManager = new UserManager(f);
			
			var u : User = new User();
			
			u.setName("test");
			u.setLevel(5);
			um.saveUser(u);
			
			var users = um.getAllUsers();
			Assert.assertTrue(users.length == 1);
			Assert.assertTrue(users[0].getName() == "test");
			
			f.deleteFile();
			
		}
		
		[Test]
		public function testCorrectCount()
		{
			var f : File = File.applicationStorageDirectory.resolvePath("UsersTest");
			var um : UserManager = new UserManager(f);
			
			var user : User = new User();
			user.setName("blah");
			user.setLevel(1);
			
			um.saveUser(user);
			
			user = new User();
			user.setName("blahh");
			user.setLevel(5);
			
			um.saveUser(user);
			
			Assert.assertTrue(um.count() == 2);
			
			f.deleteFile();
			
		}
		
		[Test]
		public function testGetUserByName()
		{
			var f : File = File.applicationStorageDirectory.resolvePath("UsersTest");
			var um : UserManager = new UserManager(f);
			
			var u = new User();
			u.setName("fake");
			u.setLevel(5);
			
			um.saveUser(u);
			
			var fetched = um.getUserByName("fake");
			
			Assert.assertTrue(fetched.getName() == "fake");
			
			f.deleteFile();
			
		}
	
		[Test]
		public function testNonExistingUser()
		{
			
			var f : File = File.applicationStorageDirectory.resolvePath("UsersTest");
			var um : UserManager = new UserManager(f);
			
			Assert.assertTrue(um.getUserByName("fake") === null);

			if (f.exists) {
				f.deleteFile();
			}
			
		}
		
		[Test]
		public function setCanClearUsers()
		{
			
			var f : File = File.applicationStorageDirectory.resolvePath("UsersTest");
			var um : UserManager = new UserManager(f);
			
			um.saveUser(new User());

			Assert.assertTrue(um.count() == 1);

			um.clear();
			
			Assert.assertTrue(um.count() == 0);
			
		}
	
	}
	
}
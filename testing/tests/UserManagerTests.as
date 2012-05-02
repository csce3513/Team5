package tests
{
	
	import flexunit.framework.Assert;
	import org.flexunit.assertThat;
	import gog.UserManager;
	import gog.User;
	
	public class UserManagerTests
	{

		//Tests to make sure that users can be stored and retrieved
		[Test]
		public function testStoresAndRetrieves()
		{
			
			var um : UserManager = new UserManager();
			
			var u : User = new User();
			
			u.setName("test");
			u.setLevel(5);
			um.saveUser(u);
			
			var users = um.getAllUsers();
			Assert.assertTrue(users.length == 1);
			Assert.assertTrue(users[0].getName() == "test");
			
		}
		
		//Makes sure that the count() method returns the correct number
		[Test]
		public function testCorrectCount()
		{
			var um : UserManager = new UserManager();
			
			um.clear();
			
			var user : User = new User();
			user.setName("blah");
			user.setLevel(1);
			
			um.saveUser(user);
			
			user = new User();
			user.setName("blahh");
			user.setLevel(5);
			
			um.saveUser(user);
			
			Assert.assertTrue(um.count() == 2);
			
		}
		
		//Test to make sure User objects can be fetched by name
		[Test]
		public function testGetUserByName()
		{
			
			var um : UserManager = new UserManager();
			
			var u = new User();
			u.setName("fake");
			u.setLevel(5);
			
			um.saveUser(u);
			
			var fetched = um.getUserByName("fake");
			
			Assert.assertTrue(fetched.getName() == "fake");
			
		}
	
		//Tests to make sure that non-existing users return null when searched for
		[Test]
		public function testNonExistingUser()
		{
			
			var um : UserManager = new UserManager();
			
			Assert.assertTrue(um.getUserByName("fake") === null);
			
		}
		
		//Tests that clear() properly erases all users
		[Test]
		public function testCanClearUsers()
		{
			
			var um : UserManager = new UserManager();
			
			um.clear();
			
			um.saveUser(new User());

			Assert.assertTrue(um.count() == 1);

			um.clear();
			
			Assert.assertTrue(um.count() == 0);
			
		}
	
	}
	
}
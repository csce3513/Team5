package tests
{
	
	import flexunit.framework.Assert;
	import org.flexunit.assertThat;
	import gog.User;
	
	public class UserTests
	{
		
		//Basically an example test.  Just makes sure the getName() getter works
		[Test]
		public function testNameGetter()
		{
			//Completely pointless test, but...
			//Just an example :)
			var user:User = new User();
			user.setName("name");
			Assert.assertTrue(user.getName() == "name");
		}
	
	}
	
}
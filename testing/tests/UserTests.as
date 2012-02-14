package tests
{
	
	import flexunit.framework.Assert;
	import org.flexunit.assertThat;
	import gog.User;
	
	public class UserTests
	{
		
		[Test]
		public function testNameGetter()
		{
			//Completely pointless test, but...
			//Just an example :)
			var user:User = new User();
			Assert.assertTrue(true);
		}
	
	}
	
}
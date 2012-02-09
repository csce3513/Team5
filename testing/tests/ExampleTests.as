package tests
{
	
	import flexunit.framework.Assert;
	import org.flexunit.assertThat;
	
	public class ExampleTests
	{
	
		[Test( description = "This test should fail!" )]
		public function testThisShouldFail()
		{
			Assert.assertTrue(false);
		}
		
		[Test]
		public function testThisShouldPass()
		{
			Assert.assertTrue(true);
		}
	
	}
	
}
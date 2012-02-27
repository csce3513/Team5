package tests
{
	
	import flexunit.framework.Assert;
	import org.flexunit.assertThat;
	import gog.Multiplier;
	
	public class MultiplierTests
	{
		
		[Test]
		public function testMultipliesPositiveNumbersCorrectly()
		{
			var m : Multiplier = new Multiplier();
			Assert.assertTrue(m.mul(5,2) == 10);
		}
		
		[Test]
		public function testMultipliesNegativeNumbersCorrectly()
		{
			var m : Multiplier = new Multiplier();
			Assert.assertTrue(m.mul(-5,2) == -10);
		}
	
	}
	
}
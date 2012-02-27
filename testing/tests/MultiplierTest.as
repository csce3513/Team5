package tests {
	
	
	import flexunit.framework.Assert;
	import org.flexunit.assertThat;
	import gog.MultiplierTest;
	
	public class MultiplierTest {
		
		[Test]
		public function MultiplierTest() { 
		
			var m : Multiplier = new Multiplier();
			Assert.assertTrue(m.mul(5,2) == 10);
		}
	
	}	
}
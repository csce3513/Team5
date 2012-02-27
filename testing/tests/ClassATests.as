package tests {
	
	import flexunit.framework.Assert;
	import org.flexunit.assertThat;
	import gog.ClassA;
	
	public class ClassATests {
		
		[Test]
		public function testSquare()
		{
			var a : ClassA = new ClassA();
			Assert.assertEquals(a.square(2), 4);
			Assert.assertTrue(false);
		}
	}
	
}
package tests
{
	
	import flexunit.framework.Assert;
	import org.flexunit.assertThat;
	import gog.games.BallDodge;
	import gog.UserManager;
	
	public class BallDodgeTests
	{
		
		[Test]
		public function testInitialState()
		{
			//Tests that the scores starts out as 0
			var bd : BallDodge = new BallDodge(new UserManager());
			Assert.assertTrue(bd.getScore() == 0);
		}
		
		[Test]
		public function testScoreIncrease()
		{
			var bd : BallDodge = new BallDodge(new UserManager());
			bd.ballPassed();
			Assert.assertTrue(bd.getScore() > 0);
		}
		
		[Test]
		public function testGameOver()
		{
			var bd : BallDodge = new BallDodge(new UserManager());
			bd.ballPassed();
			bd.gameOver();
			Assert.assertTrue(bd.getScore() > 0);
		}
		
		
	}
	
}
package tests
{
	
	import flexunit.framework.Assert;
	import org.flexunit.assertThat;
	import gog.games.BrickBreaker;
	
	public class BrickBreakerTests
	{
		
		[Test]
		public function testInitialState()
		{
			//Tests that the scores starts out as 0
			var bb : BrickBreaker = new BrickBreaker();
			Assert.assertTrue(bb.score == 0);
			Assert.assertTrue(bb.ballVelocityX == 0);
			Assert.assertTrue(bb.ballVelocityY == 0);
		}
		
		[Test]
		public function testBouncingEdge()
		{
			//Tests to make sure the ball changes direction
			//when it hits the top border.
			
			var bb : BrickBreaker = new BrickBreaker();
			
			bb.setBallVelocity(1, 1);
			bb.bounceOnWall(bb.WALL_TOP);
			
			//At least one of the two has to change direction
			Assert.assertTrue(bb.ballVelocityY < 0);
			
		}
		
		[Test]
		public function testLosingGame()
		{
			//Makes sure the game ends if the ball hits the bottom border
			var bb : BrickBreaker = new BrickBreaker();
			bb.bounceOnWall(bb.WALL_BOTTOM);
			Assert.assertTrue(bb.gameOver);
		}
		
		[Test]
		public function testScoreIncreases()
		{
			//Make sure the score increases when the ball bounces on the paddle
			var bb : BrickBreaker = new BrickBreaker();
			var score:Number = bb.score;
			Assert.assertTrue(score == 0);
			bb.bounceOnPaddle();
			Assert.assertTrue(bb.score > score);
			score = bb.score;
			bb.bounceOnPaddle();
			Assert.assertTrue(bb.score > score);
		}
		
		[Test]
		public function testBouncingOnPaddle()
		{
			//Makes sure the ball changes direction and increases speed
			//when it hits the paddle.
			var bb : BrickBreaker = new BrickBreaker();
			
			
			bb.setBallVelocity(0, -1);
			
			bb.bounceOnPaddle();
			
			var vx:Number = bb.ballVelocityX;
			var vy:Number = bb.ballVelocityY;
			
			//Much be going up now
			Assert.assertTrue(vy > 0);
			
			var spd:Number = Math.sqrt(vx*vx + vy*vy);
			
			//Speed must have increased
			Assert.assertTrue(spd > 1);
			
		}
		
	}
	
}
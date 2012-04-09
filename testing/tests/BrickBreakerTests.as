package tests {
	
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
			assertTrue(bb.getScore() == 0);
			assertTrue(bb.getBallVelocityX() == 0);
			assertTrue(bb.getVallVelocityY() == 0);
		}
		
		[Test]
		public function testBouncingOnTopEdge()
		{
			//Tests to make sure the ball changes direction
			//when it hits the top border.
			
			var bb : BrickBreaker = new BrickBreaker();
			
			bb.setBallVelocity(1, 1);
			bb.bounceOnWall();
			
			var velX:Number = bb.getBallVelocityX();
			var velY:Number = bb.getBallVelocityY();
			
			//At least one of the two has to change direction
			assertTrue(velX < 0 || velY < 0);
			
		}
		
		[Test]
		public function testLosingGame()
		{
			//Makes sure the game ends if the ball hits the bottom border
			var bb : BrickBreaker = new BrickBreaker();
			bb.hitBottomWall();
			assertTrue(bb.isGameOver());
		}
		
		[Test]
		public function testScoreIncreases()
		{
			//Make sure the score increases when the ball bounces on the paddle
			var bb : BrickBreaker = new BrickBreaker();
			var score:Number = bb.getScore();
			assertTrue(score == 0);
			bb.bounceOnWall();
			assertTrue(bb.getScore() > score);
			score = bb.getScore();
			bb.bounceOnWall();
			assertTrue(bb.getScore() > score);
		}
		
		[Test]
		public function testBouncingOnPaddle()
		{
			//Makes sure the ball changes direction and increases speed
			//when it hits the paddle.
			var bb : BrickBreaker = new BrickBreaker();
			
			
			bb.setBallVelocity(1, -1);
			
			bb.bounceOnPaddle();
			
			var vx:Number = bb.getBallVelocityX();
			var vy:Number = bb.getBallVelocityY();
			
			//Much be going up now
			assertTrue(vy > 0);
			
			var spd:Number = Math.sqrt(vx*vx + vy*vy);
			
			//Speed must have increased
			assertTrue(spd > 1);
			
		}
		
	}
	
}
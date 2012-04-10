package gog.games
{
	
	import flash.display.Sprite;
	
	public class BrickBreaker
	{
		
		private var _score:int;
		private var _ballVelocityX:Number;
		private var _ballVelocityY:Number;
		private var _gameOver:Boolean;
		
		private var _ball:Sprite;
		private var _paddle:Sprite;
		
		public const WALL_TOP:int = 1;
		public const WALL_RIGHT:int = 2;
		public const WALL_BOTTOM:int = 3;
		public const WALL_LEFT:int = 4;
		
		public function BrickBreaker()
		{
			score = 0;
			ballVelocityX = 0;
			ballVelocityY = 0;
			_gameOver = false;
			
			_ball = new Sprite();
			_paddle = new Sprite();
			
		}
		
		public function get score() : int
		{
			return _score;
		}
		
		public function set score(value:int) : void
		{
			_score = value;
		}
		
		public function get ballVelocityX() : Number
		{
			return _ballVelocityX;
		}
		
		public function get ballVelocityY() : Number
		{
			return _ballVelocityY;
		}
		
		public function set ballVelocityX(value:Number) : void
		{
			_ballVelocityX = value;
		}
		
		public function set ballVelocityY(value:Number) : void
		{
			_ballVelocityY = value;
		}
		
		public function get gameOver() : Boolean
		{
			return _gameOver;
		}
		
		public function setBallVelocity(x:Number, y:Number)
		{
			ballVelocityX = x;
			ballVelocityY = y;
		}
		
		public function bounceOnWall(wall:int) : void
		{
			switch(wall) {
				case WALL_TOP:
					ballVelocityY *= -1;
					break;
				case WALL_RIGHT:
				case WALL_LEFT:
					ballVelocityX *= -1;
					break;
				default:
					endGame();
			}
		}
		
		public function endGame() : void
		{
			_gameOver = true;
		}
		
		public function bounceOnPaddle() : void
		{
			//calculates where ball impacts the paddle
			var ballPosition:Number = _ball.x - _paddle.x;
			
			//hitPercent converts ballPosition into a percent
			//All the way to the left is -.5
			//All the way to the right is .5
			//The center is 0
			
			var dw = _paddle.width - _ball.width;
			if (dw == 0) {
				dw = 1;
			}
			
			var hitPercent:Number = (ballPosition / dw) - .5;
		 
			// Converts percentage to value for speed
			_ballVelocityX = hitPercent * 15;
			
			//Inverts y speed to bounce up and increases speed
			_ballVelocityY *= -1.1;
			++_score;
		}
		
	}
	
}
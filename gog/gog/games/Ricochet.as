package gog.games
{
	
	import flash.display.Sprite;
	import flash.display.MovieClip;
	import gog.shapes.Circle;
	import flash.text.TextField;
	import flash.text.TextFieldAutoSize;
	import flash.text.TextFormat;
	import flash.events.Event;
	import flash.events.MouseEvent;
	import flash.geom.Rectangle;
	import gog.Game;
	import flash.ui.Mouse;
	import gog.GameEvent;
	
	public class Ricochet extends Game
	{
		
		private var _score:int;
		private var _ballVelocityX:Number;
		private var _ballVelocityY:Number;
		private var _gameOver:Boolean;
		
		private var _startText:TextField;
		private var _scoreText:TextField;
		
		private var _ball:Sprite;
		private var _paddle:Sprite;
		
		public const WALL_TOP:int = 1;
		public const WALL_RIGHT:int = 2;
		public const WALL_BOTTOM:int = 3;
		public const WALL_LEFT:int = 4;
		
		public function Ricochet()
		{
			score = 0;
			ballVelocityX = 0;
			ballVelocityY = 0;
			_gameOver = false;
			
			addEventListener(Event.ADDED_TO_STAGE, build);
			
			Mouse.hide();
			
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
					if (ballVelocityX > 0) {
						ballVelocityX *= -1;
					}
					break;
				case WALL_LEFT:
					if (ballVelocityX < 0) {
						ballVelocityX *= -1;
					}
					break;
				default:
					endGame();
			}
		}
		
		public function endGame() : void
		{
			_gameOver = true;
			ballVelocityY = ballVelocityX = 0;
			if (_startText) {
				addChild(_startText);
				_startText.text = 'Game Over!';
				var that = this;
				Mouse.show();
				playAgain.visible = true;
				backToMenu.visible = true;
			}
			
			if (_paddle) {
				_paddle.removeEventListener(Event.ENTER_FRAME, movePaddle);
			}
			if (_ball) {
				_ball.removeEventListener(Event.ENTER_FRAME, moveBall);
			}
			
			
			
		}
		
		public function bounceOnPaddle() : void
		{
			
			var ballPosition:Number;
			
			//calculates where ball impacts the paddle
			if (_ball && _paddle) {
				ballPosition = _ball.x - _paddle.x;
			} else {
				ballPosition = 0;
			}
			
			//hitPercent converts ballPosition into a percent
			//All the way to the left is -.5
			//All the way to the right is .5
			//The center is 0
			
			var dw;
			
			if (_ball && _paddle) {
				dw = _paddle.width - _ball.width;
				if (dw == 0) {
					dw = 1;
				}
			} else {
				dw = 1;
			}
			
			var hitPercent:Number = (ballPosition / dw) - .5;
		 
			// Converts percentage to value for speed
			_ballVelocityX = hitPercent * 15;
			
			//Inverts y speed to bounce up and increases speed
			_ballVelocityY *= -1.1;
			++_score;
			
			if (_scoreText) {
				_scoreText.text = String(_score);
				var format:TextFormat = new TextFormat(); 
				format.color = 0xffffff;
				format.size = 30;
				_scoreText.autoSize = TextFieldAutoSize.LEFT;
				_scoreText.y = 10;
				_scoreText.x = stage.stageWidth - _scoreText.width - 15;
				_scoreText.setTextFormat(format);
			}
			
		}
		
		protected function build(evt:Event) : void
		{
			_paddle = new Sprite();
			addChild(_paddle);
			_paddle.graphics.beginFill(0xFFFFFF);
			_paddle.graphics.drawRect(0, 0, 80, 15);
			_paddle.graphics.endFill();
			_paddle.x = (stage.stageWidth - _paddle.width) / 2;
			_paddle.y = stage.stageHeight - _paddle.height - 20;
				
			_startText = new TextField();
			_startText.text = "Click here to start";
			var format:TextFormat = new TextFormat(); 
			format.color = 0xffffff;
			format.size = 30;
			_startText.autoSize = TextFieldAutoSize.CENTER;
			_startText.setTextFormat(format);
			_startText.x = (stage.stageWidth - _startText.width) / 2;
			_startText.y = (stage.stageHeight - _startText.height) / 2;
			
			_startText.addEventListener(MouseEvent.CLICK, startGame);
			
			addChild(_startText);
			addChild(_paddle);
			
			_scoreText = new TextField();
			
			_scoreText.text = '0';
			_scoreText.autoSize = TextFieldAutoSize.LEFT;
			_scoreText.y = 10;
			_scoreText.x = stage.stageWidth - _scoreText.width - 15;
			_scoreText.setTextFormat(format);
			
			playAgain.label = "Play Again";
			playAgain.visible = false;
			
			backToMenu.label = "Back to Menu";
			backToMenu.visible = false;
			
			addChild(_scoreText);
			
			playAgain.addEventListener(MouseEvent.CLICK, function() {
				dispatchEvent(new GameEvent(GameEvent.REPLAY, "ricochet"));
			});
			
			backToMenu.addEventListener(MouseEvent.CLICK, function() {
				dispatchEvent(new GameEvent(GameEvent.BACK_MENU, "ricochet"));					
			});
			
		}
		
		protected function startGame(evt:MouseEvent)
		{
			_startText.removeEventListener(MouseEvent.CLICK, startGame);
			removeChild(_startText);
			
			_ball = new Circle(5, 0xffffff);
			addChild(_ball);
			_ball.x = (stage.stageWidth - _ball.width) / 2;
			_ball.y = 10;
			
			_paddle.addEventListener(Event.ENTER_FRAME, movePaddle);
			
			ballVelocityX = 0;
			ballVelocityY = 8;
			
			_ball.addEventListener(Event.ENTER_FRAME, moveBall);
			
		}
		
		protected function movePaddle(event:Event):void{
	
			//centers paddle on mouse
			_paddle.x = mouseX - _paddle.width / 2;
			
			//creates left and right bound for paddle on stage
			if(mouseX < _paddle.width / 2){
				_paddle.x = 0;
			}
			
			if(mouseX > stage.stageWidth - _paddle.width / 2){
				
				_paddle.x = stage.stageWidth - _paddle.width;
			}
		}
		
		protected function moveBall(event:Event):void{
			//changes position of ball using speed variable
			_ball.x += _ballVelocityX;
			_ball.y += _ballVelocityY; 
			
			
			if(_ball.x >= stage.stageWidth-_ball.width){
				bounceOnWall(WALL_RIGHT);
			} else if(_ball.x <= 0){
				bounceOnWall(WALL_LEFT);
			} else if(_ball.y <= 0){
				bounceOnWall(WALL_TOP);
			} else if(_ball.y >= stage.stageHeight-_ball.height){
				
				//stop ball if it hits the bottom
				
				bounceOnWall(WALL_BOTTOM);
				
				//_ballVelocityY = 0;
				//_ballVelocityX = 0;
				//_gameOver = true; 
				//_paddle.removeEventListener(Event.ENTER_FRAME, movePaddle);
				
			}
			
			
			//Call function for bounce if ball hits paddle
			if(_ball.hitTestObject(_paddle)){
				bounceOnPaddle();
			}
		}
		
		
	}
	
}
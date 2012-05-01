package gog.games {
	
	import gog.Game;
	import gog.UserManager;
	import gog.Enemy;
	import gog.PlayerSprite;
	import flash.events.*;
	import flash.utils.Timer;
	import flash.display.Sprite;
	import gog.GameEvent;
	import gog.ScoreEvent;

	
	public class BallDodge extends Game
	{
		
		private var _score : int;
		private var _enemies : Array;
		
		private var _player : PlayerSprite;
		
		private var _spawnTimer : Timer;
		
		private var _movementTimer : Timer;
		
		private var _playerMouseTracker : Function;
		
		public function BallDodge(userManager : UserManager)
		{
			
			super(userManager);
			
			addEventListener(Event.ADDED_TO_STAGE, buildInitialState);
			
			_enemies = [];
			
			replayButton.addEventListener(MouseEvent.CLICK, function() {
				dispatchEvent(new GameEvent(GameEvent.REPLAY, "ballDodge"));
			});
			
			backButton.addEventListener(MouseEvent.CLICK, function() {
				dispatchEvent(new GameEvent(GameEvent.BACK_MENU, "ballDodge"));
			});
			
		}
		
		protected function buildInitialState(evt : Event)
		{
			//startGame();
			if (!getChildByName("startText")) {
				addChild(startText);
			}
			startText.text = "Click here to start";
			
			var cb : Function = function() {
				removeChild(startText);
				startGame();
				startText.removeEventListener(MouseEvent.CLICK, cb);
			};
			
			startText.addEventListener(MouseEvent.CLICK, cb);
			
			replayButton.label = "Replay";
			backButton.label = "Back to menu";
			
			replayButton.visible = false;
			backButton.visible = false;
			
		}
		
		protected function startGame()
		{
			_spawnTimer = new Timer(1000);
			_spawnTimer.addEventListener(TimerEvent.TIMER, spawnEnemy);
			
			_movementTimer = new Timer(30);
			_movementTimer.addEventListener(TimerEvent.TIMER, movementTick);
			
			_spawnTimer.start();
			_movementTimer.start();
			
			_player = new PlayerSprite();
			_player.x = (stage.stageWidth - _player.width) / 2;
			_player.y = (stage.stageHeight - _player.height) - 30;
			
			_playerMouseTracker = mouseTracker(_player);
			
			_player.addEventListener(Event.ENTER_FRAME, _playerMouseTracker);
			
			_player.addEventListener(Event.ENTER_FRAME, checkCollisions);
			
			addChild(_player);
			
		}
		
		protected function mouseTracker(obj : Sprite)
		{
			
			return function (evt: Event) {
			
				//centers paddle on mouse
				obj.x = mouseX - obj.width / 2;
				obj.y = mouseY - obj.height / 2;
				
				//creates left and right bound for paddle on stage
				if(mouseX < obj.width / 2){
					obj.x = 0;
				}
				
				if(mouseX > stage.stageWidth - obj.width / 2){
					
					obj.x = stage.stageWidth - obj.width;
				}
				
				if (mouseY > stage.stageHeight) {
					obj.y = stage.stageHeight - obj.height;
				}
				
				if (mouseY < obj.height / 2) {
					obj.y = 0;
				}
			
			}
		}
		
		protected function teardownGame()
		{
			if (_spawnTimer) {
				_spawnTimer.stop();
				_spawnTimer = null;
			}
			
			if (_movementTimer) {
				_movementTimer.stop();
				_movementTimer = null;
			}
			
			apply(_enemies, function(elem) { 
				if (elem !== null) {
					removeChild(elem);
				}
				return elem; 
			});
			
			_enemies = [];
			
			_player.removeEventListener(Event.ENTER_FRAME, _playerMouseTracker);
			_player.removeEventListener(Event.ENTER_FRAME, checkCollisions);
			
			removeChild(_player);
			
		}
		
		protected function gameOver()
		{
			teardownGame();
			if (!getChildByName("startText")) {
				addChild(startText);
			}
			startText.text = "Game over!";
			replayButton.visible = true;
			backButton.visible = true;
			dispatchEvent(new ScoreEvent(ScoreEvent.UPDATED, "ballDodge", _score / 3));
		}
		
		protected function spawnEnemy(evt : TimerEvent)
		{

			var ex = Math.random() * 800;
			var ey = 0;
			
			var enemy : Enemy = new Enemy(ex, ey);
			
			_enemies.push(enemy);
			
			addChild(enemy);
			
			_player.width += 1;
			
		}
		
		protected function movementTick(evt : TimerEvent)
		{
			for (var e in _enemies) {
				if (_enemies[e]) {
					_enemies[e].y += 3;
				}
			}
			checkCollisions(null);
		}
		
		private function apply(arr, func : Function)
		{
			for (var idx in arr) {
				if (arr.hasOwnProperty(idx)) {
					arr[idx] = func(arr[idx]);
				}
			}
		}
		
		protected function rerenderScore()
		{
			ballDodgeScore.text = new String((int) (_score / 3));
		}
		
		protected function checkCollisions(evt : Event)
		{
			
			var enemy, en;
			
			for (en in _enemies) {
				if (_enemies.hasOwnProperty(en)) {
					enemy = _enemies[en];
					if (enemy !== null) {
						if (enemy.hitTestObject(_player)) {
							gameOver();
						} else {
							if (enemy.y > stage.stageHeight) {
								++_score;
								rerenderScore();
								removeChild(_enemies[en]);
								_enemies[en] = null;
							}
						}
					}
				} 
			}
		}
		
	}
	
}
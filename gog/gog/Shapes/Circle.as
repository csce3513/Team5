package gog.Shapes 
{
	
	import flash.display.Sprite;
	
	public class Circle extends flash.display.Sprite
	{
		
		private var color : Number;
		private var radius : Number;
		
		public function Circle( radius:Number, color : Number = 0x000000 )
		{

			super();
			
			this.color = color;
			this.radius = radius;
			
			render();
			
		}
		
		public function setRadius( radius : Number) : Circle
		{
			this.radius = radius;
			render();
			return this;
		}
		
		public function setColor( color : Number) : Circle
		{
			this.color = color;
			render();
			return this;
		}
		
		private function render() : void
		{
			graphics.beginFill(color);
			graphics.drawCircle(radius, radius, radius);
			graphics.endFill();
		}
		
	}
	
}
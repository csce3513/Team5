package gog.shapes 
{
	
	import flash.display.Sprite;
	
	public class Rectangle extends flash.display.Sprite
	{
		
		private var color : Number;
		
		public function Rectangle(color : Number = 0x000000, w:Number = 0, h:Number = 0)
		{

			super();
			
			this.color = color;
			
			width = w;
			height = h;
			
		}
		
		public function setColor( color : Number) : Rectangle
		{
			this.color = color;
			return this;
		}
		
		private function render() : void
		{
			graphics.beginFill(color);
			graphics.drawRect(0, 0, 100, 100);
			graphics.endFill();
		}
		
	}
	
}
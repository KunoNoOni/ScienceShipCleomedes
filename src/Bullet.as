package 
{
	import org.flixel.*;

	public class Bullet extends FlxSprite
	{	
		public function Bullet(X:Number,Y:Number)
		{
			super(X, Y);
			loadGraphic(Registry.bullet,false,false,3,1);
		}
		
		override public function update():void
		{
			velocity.x = 500;
			if(x > FlxG.width+3)
			{
				this.kill();
			}
			
			super.update();
		}
	}
}
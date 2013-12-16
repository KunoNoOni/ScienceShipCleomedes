package
{
	import org.flixel.*;
	
	public class AsteroidLarge extends FlxSprite
	{		
		public function AsteroidLarge()
		{
			super();
			loadGraphic(Registry.largeAsteroid,false,false,32,32,false);
			exists = false;
			
			this.width = 24;
			this.height = 24;
			this.centerOffsets(true);
		}
		
		public function launch():void
		{
			x = 432;
			y = Math.floor(26 + (Math.random() * (268 - 26)));//FlxU.floor(FlxG.random()*280);
			/*if(y < 40)
			{
			y -= FlxU.floor(FlxG.random()*100)+40;
			}*/
			velocity.x = -Math.floor(50 + (Math.random() * (150 - 50)));//((FlxG.random() * 100)+100);
			exists = true;
		}
		
		override public function update():void
		{
			super.update();
			if (x < -32)
			{
				exists = false;
			}
		}
	}
}
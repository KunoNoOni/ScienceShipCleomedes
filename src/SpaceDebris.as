package
{
	import org.flixel.*;
	
	public class SpaceDebris extends FlxSprite
	{
		public function SpaceDebris()
		{
			super();
			loadGraphic(Registry.debris,false,false,10,10,false);
			exists = false;
			
			this.width = 8;
			this.height = 8;
			this.centerOffsets(true);
		}
		
		public function launch():void
		{
			x = 404;
			y = Math.floor(26 + (Math.random() * (290 - 26)));//FlxU.floor(FlxG.random()*280);
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
			if (x < -4)
			{
				exists = false;
			}
		}
	}
}
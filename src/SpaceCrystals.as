package
{
	import org.flixel.*;
	
	public class SpaceCrystals extends FlxSprite
	{
		public function SpaceCrystals()
		{
			super();
			loadGraphic(Registry.crystal,false,false,16,16,false);
			exists = false;
			
			this.width = 14;
			this.height = 14;
			this.centerOffsets(true);
		}
		
		public function launch():void
		{
			x = 416;
			y = Math.floor(26 + (Math.random() * (284 - 26)));//FlxU.floor(FlxG.random()*280);
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
			if (x < -16)
			{
				exists = false;
			}
		}
	}
}
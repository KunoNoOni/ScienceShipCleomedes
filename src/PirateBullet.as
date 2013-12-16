package 
{
	import org.flixel.*;

	public class PirateBullet extends FlxSprite
	{	
		public function PirateBullet()
		{
			super();
			loadGraphic(Registry.bullet,false,false,3,1);
			exists = false;
		}
		
		public function launch():void
		{
			x = Registry.pirateX - 4;
			y = Registry.pirateY + 4;
			velocity.x = -300;
			exists = true;
			if(!Registry.noBullets)
			{
				FlxG.play(Registry.WeaponFire,1);
			}
		}
		
		override public function update():void
		{	
			super.update();
			
			if(x < -3)
			{
				exists = false;
			}
		}
	}
}
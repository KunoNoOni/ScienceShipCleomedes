package  
{
	import flash.utils.getTimer;
	
	import org.flixel.*;
	
	public class PirateBulletManager extends FlxGroup
	{
		private var lastReleased:int;
		private var releaseRate:int = 250;
		
		public function PirateBulletManager() 
		{
			super();
			
			for (var i:int = 0; i < 100; i++)
			{
				add(new PirateBullet);
			}
		}
		
		public function release():void
		{
			var b:PirateBullet = PirateBullet(getFirstAvailable());
			if (b)
			{
				b.launch();
			}
		}
		
		override public function update():void
		{
			super.update();
			
			if (getTimer() > lastReleased + releaseRate)
			{
				lastReleased = getTimer();
				release();
			}
			
			if(Registry.stageComplete)
			{
				setAll("exists",false);	
			}
		}
	}
}
package
{
	import flash.utils.getTimer;
	
	import org.flixel.*;

	public class EnemyManager extends FlxGroup
	{
		private var lastReleased:int;
		private var releaseRate:int = 125;
		private var aSmall:AsteroidSmall;
		private var pirates:SpacePirates;
		private var crystals:SpaceCrystals;
		private var aLarge:AsteroidLarge;
		private var debris:SpaceDebris;
		private var i:int;
	
		public function EnemyManager() 
		{
			super();
			
			switch(Registry.stage)
			{
				case 1: //Small Asteroids
				{
					
					for (i = 0; i < 35; i++)
					{
						add(new AsteroidSmall);
					}
					break;
				}
				case 2: //Space Pirates
				{
					for (i = 0; i < 30; i++)
					{
						add(new SpacePirates);
					}
					break;
				}
				case 3: //Space Crystals
				{
					for (i = 0; i < 30; i++)
					{
						add(new SpaceCrystals);
					}
					break;
				}
				case 4: //Large Asteroids
				{
					for (i = 0; i < 25; i++)
					{
						add(new AsteroidLarge);
					}
					break;
				}
				case 5: //Space Debris
				{
					for (i = 0; i < 30; i++)
					{
						add(new SpaceDebris);
					}
					break;
				}
			}
		}
		
		public function release():void
		{
			switch(Registry.stage)
			{
				case 1: //Small Asteroids
				{
					aSmall = AsteroidSmall(getFirstAvailable());
					if (aSmall)
					{
						aSmall.launch();
					}
					break;
				}
				case 2: //Space Pirates
				{
					pirates = SpacePirates(getFirstAvailable());
					if (pirates)
					{
						pirates.launch();
					}
					break;
				}
				case 3: //Space Crystals
				{
					crystals = SpaceCrystals(getFirstAvailable());
					if (crystals)
					{
						crystals.launch();
					}
					break;
				}
				case 4: //Large Asteroids
				{
					aLarge = AsteroidLarge(getFirstAvailable());
					if (aLarge)
					{
						aLarge.launch();
					}
					break;
				}
				case 5: //Space Debris
				{
					debris = SpaceDebris(getFirstAvailable());
					if (debris)
					{
						debris.launch();
					}
					break;
				}
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
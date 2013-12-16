package
{
	import org.flixel.*;
	
	[SWF(width="800", height="600", backgroundColor="#000000")]
	[Frame(factoryClass="Preloader")]
		
	public class ScienceShipCleomedes extends FlxGame
	{
		public function ScienceShipCleomedes()
		{
			super(400,300,TitleState,2,60,60);
			//forceDebugger = true;
			//FlxG.visualDebug = true;
			//FlxG.debug = true;
		}
	}
}
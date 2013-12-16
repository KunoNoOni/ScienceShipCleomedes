package
{
	import org.flixel.*;
	import org.flixel.plugin.photonstorm.*;
	import org.flixel.plugin.photonstorm.FX.StarfieldFX;
		
	public class Instructions extends FlxState
	{
		//Variables got here
		private var stars:FlxSprite;
		private var starfield:StarfieldFX;
		private var ins1:FlxSprite;
		private var ins2:FlxSprite;
		private var ins2Showing:Boolean=false;


		public function Instructions()
		{
			super();
		}
		
		override public function create():void
		{
			FlxG.playMusic(Registry.titleCredits);
			if (FlxG.getPlugin(FlxSpecialFX) == null)
			{
				FlxG.addPlugin(new FlxSpecialFX);
			}
			
			starfield = FlxSpecialFX.starfield();
			starfield.setStarSpeed(-2, 0);
			stars = starfield.create(0, 0, FlxG.width, FlxG.height, 200);
			add(stars);
			
			ins1 = new FlxSprite(0,0,Registry.ins1);
			add(ins1);
		}
		
		override public function update():void
		{
			if(FlxG.keys.justPressed("X"))
			{
				if(ins2Showing)
				{
					FlxG.playMusic(Registry.titleCredits,0);
					FlxG.switchState(new Intro());
				}
				else
				{
					ins1.kill();
					ins2 = new FlxSprite(0,0,Registry.ins2);
					add(ins2);
					ins2Showing = true;
				}
			}
			
			super.update();
		}
		
		override public function destroy():void
		{
			starfield = null;
		}
	}
}
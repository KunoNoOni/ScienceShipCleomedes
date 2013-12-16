package
{
	import org.flixel.*;
	import org.flixel.plugin.photonstorm.*;
	import org.flixel.plugin.photonstorm.FX.StarfieldFX;
		
	public class TitleState extends FlxState
	{
		//Variables got here
		private var stars:FlxSprite;
		private var starfield:StarfieldFX;
		private var title:FlxSprite;
		
		public function TitleState()
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
			
			title = new FlxSprite(0,0,Registry.title);
			add(title);
			
			/*var logo:FlxText = new FlxText(FlxG.width*0.5-200,FlxG.height*0.5-110, 400, "Science Ship Cleomedes");
			logo.setFormat(null,20,0xFFFFFF, "center");
			add(logo);
			
			var instruct:FlxText = new FlxText(FlxG.width*0.5-100,FlxG.height-30, 200, "PRESS [x] TO START");
			instruct.setFormat(null,15,0xFFFFFF, "center");
			add(instruct);*/
			
			Registry.distance = 50000;
			Registry.stage = 1;
			Registry.stageComplete = false;
			Registry.distanceTravelled = 0;
			Registry.thrustOn = false;
			Registry.useThrust = false;
			Registry.fixShields = false;
			Registry.fixWeapons = false;
			Registry.playerDead = false;
			Registry.weaponFired = false;
			Registry.weaponCharging = false;
			Registry.shieldCharging = false;
			Registry.noBullets = false;
		}
		
		override public function update():void
		{
			if(FlxG.keys.X)
			{
				FlxG.switchState(new Instructions());
			}
			
			super.update();
		}
		
		override public function destroy():void
		{
			starfield = null;
		}
	}
}
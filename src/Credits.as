package
{
	import org.flixel.*;
	import org.flixel.plugin.photonstorm.*;
	import org.flixel.plugin.photonstorm.FX.StarfieldFX;
		
	public class Credits extends FlxState
	{
		//Variables got here
		private var earth:FlxSprite;
		private var stars:FlxSprite;
		private var speed:int = -10;
		private var starfield:StarfieldFX;
		private var dialog:Array = new Array("Credits\n\nScience Ship Cleomedes\n\nBy KunoNoOni\n\nCreated for Ludum Dare 28 #LD28\n\nAnd OneGameAMonth #1GAM" +
			"\n\n\n\n\n\nThanks for playing!\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\nPress [x] to continue.");
		private var dialogText:FlxText;
		private var HUD:FlxSprite;
		private var stageLabel:FlxText;
		
		public function Credits()
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
			starfield.setStarSpeed(0, 0);
			stars = starfield.create(0, 0, FlxG.width, FlxG.height, 200);
			add(stars);

			earth = new FlxSprite(144,40,Registry.earth);
			add(earth);
			
			dialogText = new FlxText(55,300,300,"");
			dialogText.setFormat(null,8,0xFFFFFF, "left");
			add(dialogText);
			
			hud();
		}
		
		override public function update():void
		{

			dialogText.text = dialog[0];
			dialogText.velocity.y = speed;
			if(FlxU.floor(dialogText.y) == -255)
				speed = 0;
			
			if(FlxG.keys.X)
				FlxG.switchState(new TitleState());		
			super.update();
		}
		
		private function hud():void
		{
			HUD = new FlxSprite(0,0,Registry.topUI);
			add(HUD);
			stageLabel = new FlxText(330,1,100, "Credits ");
			stageLabel.setFormat(null,8,0xFF0000, "left");
			add(stageLabel);
			
		}
		
		override public function destroy():void
		{
			starfield = null;
		}
	}
}
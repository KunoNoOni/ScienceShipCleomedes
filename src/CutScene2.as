package
{
	import org.flixel.*;
	import org.flixel.plugin.photonstorm.*;
	import org.flixel.plugin.photonstorm.FX.StarfieldFX;
		
	public class CutScene2 extends FlxState
	{
		//Variables got here
		private var ship:Player;
		private var dialogBox:FlxSprite;
		private var stars:FlxSprite;
		private var starfield:StarfieldFX;
		private var dialog:Array = new Array("Captain: Earth this is the Science Ship Cleomedes why won't you answer me?\nEarth: ..." +
			"\nCaptain: Blast it all! Asteroids! Space Pirates! Alien Viruses! What's next!\nTactical: Um... Captain. Space Crystals...\nCaptain:" +
			" ...\n\nPress [x] to continue");
		private var elapsed:Number = 0;
		private var pageIndex:int = 0;;
		private var charIndex:int = 0;
		private var displaySpeed:int = .45;
		private var dialogText:FlxText;
		private var displaying:Boolean = true;
		private var HUD:FlxSprite;
		private var distanceLabel:FlxText;
		private var distanceNumLabel:FlxText;
		private var stageLabel:FlxText;
		
		public function CutScene2()
		{
			super();
		}
		
		override public function create():void
		{			
			if (FlxG.getPlugin(FlxSpecialFX) == null)
			{
				FlxG.addPlugin(new FlxSpecialFX);
			}
			
			starfield = FlxSpecialFX.starfield();
			starfield.setStarSpeed(-2, 0);
			stars = starfield.create(0, 0, FlxG.width, FlxG.height, 200);
			add(stars);
			
			hud();
			
			ship = new Player(25,147);
			add(ship);
			
			dialogBox = new FlxSprite(50,190,Registry.dialogBox);
			add(dialogBox);
			
			dialogText = new FlxText(55,195,300,"");
			dialogText.setFormat(null,8,0xFFFFFF, "left");
			add(dialogText);
		}
		
		override public function update():void
		{
			if(displaying)
			{
				elapsed += FlxG.elapsed;
				if(elapsed > displaySpeed)
				{
					elapsed = 0;
					charIndex++;
					if(charIndex > dialog[pageIndex].length)
					{
						displaying = false;
					}
					dialogText.text = dialog[pageIndex].substr(0, charIndex);
					FlxG.play(Registry.ChatType,.8);
				}
			}

			if(FlxG.keys.X)
				FlxG.switchState(new PlayState());		
			super.update();
		}
		
		private function hud():void
		{
			HUD = new FlxSprite(0,0,Registry.topUI);
			add(HUD);
			distanceLabel = new FlxText(10,1,100, "Distance Left: ");
			distanceLabel.setFormat(null,8,0xFF0000, "left");
			add(distanceLabel);
			distanceNumLabel = new FlxText(30,10,100, ""+Registry.distance);
			distanceNumLabel.setFormat(null,8,0xFF0000, "left");
			add(distanceNumLabel);
			stageLabel = new FlxText(330,1,100, "Cutscene ");
			stageLabel.setFormat(null,8,0xFF0000, "left");
			add(stageLabel);
		}
		
		override public function destroy():void
		{
			starfield = null;
		}
	}
}
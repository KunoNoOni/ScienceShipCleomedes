package
{
	import org.flixel.*;
	import org.flixel.plugin.photonstorm.*;
	import org.flixel.plugin.photonstorm.FX.StarfieldFX;
		
	public class Epilogue extends FlxState
	{
		//Variables got here
		private var earth:FlxSprite;
		private var stars:FlxSprite;
		private var speed:int = -10;
		private var starfield:StarfieldFX;
		private var dialog:Array = new Array("Epilogue:\n\n\nHaving discovered the alien virus which crippled their ship was sent to their home" +
			" planet of earth, the crew of the Science Ship Cleomedes managed to land on the now barren planet and repair their ship. Devoid of all life" +
			" the crew salvages what they can before they head back out to the emptiness of space to find a new home.\n\nBefore they are about to leave " +
			"one of the crew finds a diary and reads the last few entries.\n\n07/06/2433\n\nThe main system has been acting weirder than normal. " +
			"It has been giving the androids strange orders. Just last week the android janitor came to fix the toilet on the second floor, yet there" +
			" was nothing wrong with it. I have a feeling I may need to restart the system to get the bugs out.\n\n11/06/2433\n\nI have tried several " +
			"times to restart the system of the past few days. Now it seems I'm locked out. Things are getting stranger too, the janitor android attacked" +
			" me when I tried to use the toilet. Saying something about me not being authorized... I got news for you buddy, I have top secret " +
			"clearence. I'm more than authorized to use the toilet!\n\n12/06/2433\n\nThose fools! How could they not have detected there was a virus" +
			" on there ship! Now they have infected us and who know what other alien races. Well it explains why the system has been acting so strange" +
			", I just wish I could do something about it but I'm locked out of the system.\n\n25/06/2433\n\nWhy won't they listen to us! We told them" +
			" it was an accident. We did not intentionally infect their ships with this virus. They won't listen to us though, they believe we have commited" +
			" and act of war and now there screaming about how we have broken the peace treaty which has stood for hundreds of years!\n\n13/11/2433\n\n" +
			"So hungry... water is all contaminated... only a few survivors... they hit us hard... destroyed everything...\n\nThis is the last entry.\n\nThe " +
			"crew of the Science Ship Cleomedes board their ship and takeoff. Hopefully they can find a new world where they can start over...\n\n\n" +
			"\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\nPress [x] to continue.");
		private var dialogText:FlxText;
		private var HUD:FlxSprite;
		private var stageLabel:FlxText;
		
		public function Epilogue()
		{
			super();
		}
		
		override public function create():void
		{			
			FlxG.playMusic(Registry.epilogue);
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

			if(FlxU.floor(dialogText.y) == -680)
				speed = 0;
			
			if(FlxG.keys.X)
				FlxG.switchState(new Credits());		
			super.update();
		}
		
		private function hud():void
		{
			HUD = new FlxSprite(0,0,Registry.topUI);
			add(HUD);
			stageLabel = new FlxText(330,1,100, "Epilogue ");
			stageLabel.setFormat(null,8,0xFF0000, "left");
			add(stageLabel);
			
		}
		
		override public function destroy():void
		{
			starfield = null;
		}
	}
}
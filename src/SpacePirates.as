package
{
	import org.flixel.*;
	
	public class SpacePirates extends FlxSprite
	{
		public function SpacePirates()
		{
			super();
			loadGraphic(Registry.pirates,true,true,20,7,false);
			addAnimation("flying",[0,1,2],10);
			facing = LEFT;
			exists = false;
		}
		
		public function launch():void
		{
			x = 420;
			y = Math.floor(26 + (Math.random() * (293 - 26)));//FlxU.floor(FlxG.random()*280);
			/*if(y < 40)
			{
			y -= FlxU.floor(FlxG.random()*100)+40;
			}*/
			velocity.x = -Math.floor(50 + (Math.random() * (150 - 50)));//((FlxG.random() * 100)+100);
			exists = true;
		}
		
		override public function update():void
		{
			play("flying");
			
			Registry.pirateX = this.x;
			Registry.pirateY = this.y;
			
			super.update();
			if (x < -20)
			{
				exists = false;
			}
		}
	}
}
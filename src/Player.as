package 
{
	import org.flixel.*;

	public class Player extends FlxSprite
	{	
		private var moveSpeed:int = 100;
		
		public function Player(X:Number,Y:Number)
		{
			super(X, Y);
			loadGraphic(Registry.player,true,false,21,7);
			addAnimation("flying",[0,1,2],10);
			addAnimation("flyingS",[3,4,5],10);
		}
		
		override public function update():void
		{
			velocity.y = 0;
			if(Registry.useThrust)
			{
				if(!Registry.thrustOn)
				{
					Registry.thrustOn = true;	
					FlxG.play(Registry.Thrust,.8,true);
				}
			}
			
			if(FlxG.keys.UP && y >=35)
			{
				velocity.y = -moveSpeed;
			}
			
			if(FlxG.keys.DOWN && y <= 290)
			{
				velocity.y = moveSpeed;
			}
			
			if(Registry.fixShields)
			{
				if(FlxG.keys.justPressed("SPACE") && !Registry.shieldCharging && !Registry.shieldOn && !Registry.playerDead)
				{
					Registry.shieldOn = true;
					Registry.shieldBurstDelay.reset(5000);
					FlxG.play(Registry.ShieldUp,1);
				}
				if(FlxG.keys.justPressed("SPACE") && Registry.shieldCharging && !Registry.playerDead)
				{
					FlxG.play(Registry.SCharging,1);
				}
			}
			if(Registry.fixWeapons)
			{
				if(FlxG.keys.justPressed("SPACE") && !Registry.weaponCharging && !Registry.playerDead)
				{
					Registry.weaponFired = true;
					FlxG.play(Registry.WeaponFire,1);
				}
				if(FlxG.keys.justPressed("SPACE") && Registry.weaponCharging && !Registry.playerDead)
				{
					FlxG.play(Registry.WCharging,1);
				}
			}
			
			if(Registry.shieldOn)
				this.play("flyingS");
			else
				this.play("flying");

			super.update();
		}
	}
}
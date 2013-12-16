package
{
	import org.flixel.*;
	import org.flixel.plugin.photonstorm.*;
	import org.flixel.plugin.photonstorm.FX.StarfieldFX;
	
	public class PlayState extends FlxState
	{
		//Variables go here
		private var ship:Player;
		private var bullet:Bullet;
		private var stars:FlxSprite;
		private var starfield:StarfieldFX;
		private var HUD:FlxSprite;
		private var distanceLabel:FlxText;
		private var distanceNumLabel:FlxText;
		private var stageLabel:FlxText;
		private var stageNumLabel:FlxText;
		private var EM:EnemyManager;
		private var PBM:PirateBulletManager;
		private var titleSwitchDelay:FlxDelay;
		private var stateSwitchDelay:FlxDelay;
		private var shieldBurstDelay:FlxDelay;
		private var shieldChargingDelay:FlxDelay;
		private var weaponChargingDelay:FlxDelay;
		private var stageDelay:FlxDelay;
		private var emit:FlxEmitter;
		private var emit2:FlxEmitter;
				
		override public function create():void
		{	
			FlxG.playMusic(Registry.gameplay);
			if (FlxG.getPlugin(FlxSpecialFX) == null)
			{
				FlxG.addPlugin(new FlxSpecialFX);
			}
			
			starfield = FlxSpecialFX.starfield();
			starfield.setStarSpeed(-2, 0);
			stars = starfield.create(0, 0, FlxG.width, FlxG.height, 200);
			add(stars);
			
			if(Registry.stageComplete)
			{
				Registry.stage += 1;
				Registry.stageComplete = false;
			}
			
			EM = new EnemyManager();
			add(EM);
			
			if(Registry.stage == 2)
			{
				PBM = new PirateBulletManager();
				add(PBM);
				Registry.noBullets = false;
			}
			
			hud();
			
			ship = new Player(25,147);
			add(ship);
			
			bullet = new Bullet(0,0);
			add(bullet);
			bullet.kill();
			
			titleSwitchDelay = new FlxDelay(2000); //Delay for when you die.
			stateSwitchDelay = new FlxDelay(3000); //Delay for when you complete a level. Need to travel 10000 miles
			shieldChargingDelay = new FlxDelay(20000); //Delay for when your shield is charging
			weaponChargingDelay = new FlxDelay(20000); //Delay for when your weapon is charging 
			stageDelay = new FlxDelay(12000);	//Delay for how long the level will take. Each 12 secs is 2000 miles. 
			
			stageDelay.start();
			Registry.useThrust = false;
		}	
		
		override public function update():void
		{
			//Checks to see if the 5 sec shield burst has expired if so we start the delay to charge the sheilds
			if(Registry.shieldOn)
			{	
				if(Registry.shieldBurstDelay.hasExpired)
				{
					Registry.shieldOn = false;
					Registry.shieldCharging = true;
					shieldChargingDelay.reset(20000); //<-
					FlxG.play(Registry.ShieldDown,.8);
				}
			}
			
			//Checks to see if the shields are still charging if not turn off the boolean
			if(Registry.shieldCharging)
			{trace(shieldChargingDelay.secondsRemaining);
				if(shieldChargingDelay.hasExpired)
				{
					Registry.shieldCharging = false;
					if(!Registry.playerDead && !Registry.stageComplete)
					{
						FlxG.play(Registry.ShieldReady,1);
					}
				}
			}
			
			//Checks to see if the weapon was fired, if so start charging it
			if(Registry.weaponFired)
			{
				if(!Registry.weaponCharging)
				{
					Registry.weaponCharging = true;
					weaponChargingDelay.reset(20000); //<-
					bullet.reset(ship.x+ship.width,ship.y+4);
				}
			}
			
			//Checks to see if the weapon is still charging, if not we turn off the boolean
			if(Registry.weaponCharging)
			{trace(weaponChargingDelay.secondsRemaining);
				if(weaponChargingDelay.hasExpired)
				{
					Registry.weaponCharging = false;
					Registry.weaponFired = false;
					if(!Registry.playerDead && !Registry.stageComplete)
					{
						FlxG.play(Registry.WeaponReady,1);
					}
				}
			}
			
			
			if(stageDelay.hasExpired && Registry.distanceTravelled != 10000 && !Registry.stageComplete)
			{
				Registry.distance -= 2000;
				Registry.distanceTravelled += 2000;
				distanceNumLabel.text = ""+Registry.distance;
				stageDelay.reset(12000); //<-
			}
			else if(Registry.distanceTravelled == 10000)
			{
				
				FlxG.fade(0x00000000,2);
				Registry.distanceTravelled = 0;
				Registry.stageComplete = true;
				stageDelay.abort();
				shieldChargingDelay.abort();
				weaponChargingDelay.abort();
				Registry.shieldBurstDelay.abort();
				Registry.shieldOn = false;
				stateSwitchDelay.start(); //<-
				Registry.useThrust = false;
				Registry.thrustOn = false;
				Registry.noBullets = true;
			}
					
			if(stateSwitchDelay.hasExpired)
			{
				FlxG.playMusic(Registry.gameplay,0);
				switch(Registry.stage)
				{
					case 1:
					{
						FlxG.switchState(new CutScene1());
						break;
					}
					case 2:
					{
						FlxG.switchState(new CutScene2());
						break;
					}
					case 3:
					{
						FlxG.switchState(new CutScene3());
						break;
					}
					case 4:
					{
						FlxG.switchState(new CutScene4());
						break;
					}
					case 5:
					{
						FlxG.switchState(new Ending());
						break;
					}	
				}
			}
			
			FlxG.overlap(ship,EM,collision);
			FlxG.overlap(ship,PBM,collision);
			FlxG.overlap(bullet,EM,bulletCollision);
			
			if(titleSwitchDelay.hasExpired)	
			{
				stageDelay.abort();
				shieldChargingDelay.abort();
				weaponChargingDelay.abort();
				FlxG.switchState(new TitleState());
			}
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
			stageLabel = new FlxText(330,1,100, "Stage: ");
			stageLabel.setFormat(null,8,0xFF0000, "left");
			add(stageLabel);
			stageNumLabel = new FlxText(345,10,100, ""+Registry.stage);
			stageNumLabel.setFormat(null,8,0xFF0000, "left");
			add(stageNumLabel);
		}
		
		private function collision(p:FlxSprite,g:FlxSprite):void
		{
			if(Registry.shieldOn)
			{
				g.kill();
				Registry.shieldOn = false;
				FlxG.play(Registry.ShieldDown,1);
				Registry.shieldBurstDelay.abort();
				Registry.shieldCharging = true;
				shieldChargingDelay.reset(20000);
				emit2 = new FlxEmitter(g.x,g.y);
				if(g.height == 14 && Registry.stage == 1)
				{
					emit2.makeParticles(Registry.asteroidBits,27,0,true);
					FlxG.play(Registry.AsteroidExplosion,1);
				}
				else if(g.height == 14)
				{
					emit2.makeParticles(Registry.crystalBits,27,0,true);
					FlxG.play(Registry.CrystalExplosion,1);
				}
				else if(g.height == 24)
				{
					emit2.makeParticles(Registry.asteroidBits,47,0,true);
					FlxG.play(Registry.AsteroidExplosion,1);
				}
				else if(g.height == 7)
				{
					emit2.makeParticles(Registry.pirateDebris,27,0,true);
					FlxG.play(Registry.ShipExplosion,1);
				}
				else if(g.height == 8)
				{
					trace("debrisDebris played!");
					emit2.makeParticles(Registry.debrisDebris,27,0,true);
					FlxG.play(Registry.DebrisExplosion,1);
				}
				add(emit2);
				emit2.start(true,2);
			}
			else
			{
				p.kill();
				Registry.playerDead = true;
				FlxG.play(Registry.ShipExplosion,1);
				emit = new FlxEmitter(p.x,p.y);
				emit.makeParticles(Registry.shipDebris,27,0,true);
				add(emit);
				emit.start(true,2);
				shieldChargingDelay.abort();
				titleSwitchDelay.reset(2000); //<-
			}
		}
		
		private function bulletCollision(p:FlxSprite,g:FlxSprite):void
		{
			p.kill();
			g.kill();
			emit = new FlxEmitter(g.x,g.y);
			if(g.height == 14 && Registry.stage == 1)
			{
				emit.makeParticles(Registry.asteroidBits,27,0,true);
				FlxG.play(Registry.AsteroidExplosion,1);
			}
			else if(g.height == 14)
			{
				emit.makeParticles(Registry.crystalBits,27,0,true);
				FlxG.play(Registry.CrystalExplosion,1);
			}
			else if(g.height == 24)
			{
				emit.makeParticles(Registry.asteroidBits,47,0,true);
				FlxG.play(Registry.AsteroidExplosion,1);
			}
			else if(g.height == 7)
			{
				emit.makeParticles(Registry.pirateDebris,27,0,true);
				FlxG.play(Registry.ShipExplosion,1);
			}
			else if(g.height == 8)
			{
				emit.makeParticles(Registry.debrisDebris,27,0,true);
				FlxG.play(Registry.DebrisExplosion,1);
			}
			add(emit);
			emit.start(true,2);
		}
		
		override public function destroy():void
		{
			starfield = null;
		}
	}
}

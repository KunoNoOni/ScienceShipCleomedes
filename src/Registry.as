package
{
	import org.flixel.*;
	import org.flixel.plugin.photonstorm.FlxDelay;

	public class Registry
	{
		public static var stage:int;
		public static var distance:int;
		public static var distanceTravelled:int;
		public static var pirateX:int;
		public static var pirateY:int;
		public static var shieldOn:Boolean = false;
		public static var weaponFired:Boolean = false;
		public static var fixShields:Boolean = false;
		public static var fixWeapons:Boolean = false;
		public static var shieldCharging:Boolean = false;
		public static var weaponCharging:Boolean = false;
		public static var stageComplete:Boolean = false;
		public static var useThrust:Boolean = false;
		public static var thrustOn:Boolean = false;
		public static var noBullets:Boolean = false;
		public static var playerDead:Boolean = false;
		public static var shieldBurstDelay:FlxDelay = new FlxDelay(5000);

		[Embed(source = 'Sprites/player.png')] static public var player:Class;
		[Embed(source = 'Sprites/topUI.png')] static public var topUI:Class;
		[Embed(source = 'Sprites/smallAsteroid.png')] static public var smallAsteroid:Class;
		[Embed(source = 'Sprites/largeAsteroid.png')] static public var largeAsteroid:Class;
		[Embed(source = 'Sprites/pirates.png')] static public var pirates:Class;
		[Embed(source = 'Sprites/crystal.png')] static public var crystal:Class;
		[Embed(source = 'Sprites/debris.png')] static public var debris:Class;
		[Embed(source = 'Sprites/shipDebris.png')] static public var shipDebris:Class;
		[Embed(source = 'Sprites/asteroidBits.png')] static public var asteroidBits:Class;
		[Embed(source = 'Sprites/dialogBox.png')] static public var dialogBox:Class;
		[Embed(source = 'Sprites/bullet.png')] static public var bullet:Class;
		[Embed(source = 'Sprites/crystalBits.png')] static public var crystalBits:Class;
		[Embed(source = 'Sprites/debrisDebris.png')] static public var debrisDebris:Class;
		[Embed(source = 'Sprites/pirateDebris.png')] static public var pirateDebris:Class;
		[Embed(source = 'Sprites/earth.png')] static public var earth:Class;
		[Embed(source = 'Sprites/Title.png')] static public var title:Class;
		[Embed(source = 'Sprites/Instructions1.png')] static public var ins1:Class;
		[Embed(source = 'Sprites/Instructions2.png')] static public var ins2:Class;
		
		//Sounds
		[Embed(source = 'sounds/AsteroidExplosion.mp3')] static public var AsteroidExplosion:Class;
		[Embed(source = 'sounds/ChatType.mp3')] static public var ChatType:Class;
		[Embed(source = 'sounds/CrystalExplosion.mp3')] static public var CrystalExplosion:Class;
		[Embed(source = 'sounds/DebrisExplosion.mp3')] static public var DebrisExplosion:Class;
		[Embed(source = 'sounds/shieldcharging.mp3')] static public var SCharging:Class;
		[Embed(source = 'sounds/ShieldDown.mp3')] static public var ShieldDown:Class;
		[Embed(source = 'sounds/shieldready.mp3')] static public var ShieldReady:Class;
		[Embed(source = 'sounds/ShieldUp.mp3')] static public var ShieldUp:Class;
		[Embed(source = 'sounds/ShipExplosion.mp3')] static public var ShipExplosion:Class;
		[Embed(source = 'sounds/Thrust.mp3')] static public var Thrust:Class;
		[Embed(source = 'sounds/weaponcharging.mp3')] static public var WCharging:Class;
		[Embed(source = 'sounds/WeaponFire.mp3')] static public var WeaponFire:Class;
		[Embed(source = 'sounds/weaponready.mp3')] static public var WeaponReady:Class;
		
		//Music
		[Embed(source = 'sounds/OffensiveFlights.mp3')] static public var gameplay:Class;
		[Embed(source = 'sounds/TheBrownBranch.mp3')] static public var titleCredits:Class;
		[Embed(source = 'sounds/ALovelyApple.mp3')] static public var epilogue:Class;
		
		public function Registry()
		{
		}
	}
}
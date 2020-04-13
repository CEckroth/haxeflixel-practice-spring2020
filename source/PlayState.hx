package;

import flixel.text.FlxText;
import entities.projectiles.Fireball;
import entities.collectables.Coin;
import ui.HUD;
import flixel.FlxObject;
import flixel.util.FlxColor;
import flixel.FlxG;
import flixel.group.FlxGroup.FlxTypedGroup;
import entities.player.Hero;
import entities.terrain.Wall;
import flixel.FlxState;

class PlayState extends FlxState
{
	private static var WALL_COUNT(default, never) = 10;
	private static var WALL_START_X(default, never) = 150;
	private static var WALL_START_Y(default, never) = 200;

	private static var COIN_COUNT(default, never) = 5;
	private static var COIN_SPAWN_BORDER(default, never) = 50;

	private static var FIREBALL_COUNT(default, never) = 10;
	private static var FIREBALL_SPAWN_BORDER(default, never) = 50;

	var hud:HUD;
	var token:Int = 0;

	private var winMessage:FlxText;
	private var loseMessage:FlxText;

	private var hero:Hero;
	private var walls:FlxTypedGroup<Wall>;
	private var coins:FlxTypedGroup<Coin>;
	private var fireballs:FlxTypedGroup<Fireball>;

	override public function create():Void
	{
		hud = new HUD();
		add(hud);

		super.create();

		hero = new Hero();
		hero.x= 240;
		hero.y= 170;
		add(hero);

		initializeWalls();
		initializeFireballs();
		initializeCoins();
	}

	private function initializeWalls() {
		walls = new FlxTypedGroup<Wall>();

		for (i in 0...WALL_COUNT) {
			var x:Float = WALL_START_X + (i * Wall.WIDTH);
			var y:Float = WALL_START_Y;
			var wall:Wall = new Wall(x, y);
			walls.add(wall);
		}
		add(walls);
	}
	private function initializeCoins() {
		coins = new FlxTypedGroup<Coin>();

		for (i in 0...COIN_COUNT)
			{
				var x:Float = FlxG.random.int(COIN_SPAWN_BORDER,
					 FlxG.width - COIN_SPAWN_BORDER);
				var y:Float = FlxG.random.int(COIN_SPAWN_BORDER,
					 FlxG.height - COIN_SPAWN_BORDER);
				var coin = new Coin(x , y);
				coins.add(coin);
			}
		add(coins);
	}

	private function initializeFireballs() {
		fireballs = new FlxTypedGroup<Fireball>();

		for (i in 0...FIREBALL_COUNT) {
			var x:Float = FlxG.random.int(FIREBALL_SPAWN_BORDER, 
				FlxG.width - FIREBALL_SPAWN_BORDER);
			var y:Float = FlxG.random.int(FIREBALL_SPAWN_BORDER, 
				FlxG.height - FIREBALL_SPAWN_BORDER);
			var fireball = new Fireball(x, y);
			fireballs.add(fireball);
		}
		add(fireballs);
	}

	override public function update(elapsed:Float):Void
	{
		super.update(elapsed);

		// Uncomment to collide hero against all wall objects.
		FlxG.collide(hero, walls);

		// Uncomment to trigger custom logic when a player overlaps with a fireball.
		 FlxG.overlap(hero, fireballs, resolveHeroFireballOverlap);

		FlxG.overlap(hero, coins, reseolveHeroCoinOverlap);

		// Wrap various objects if gone offscreen.
		screenWrapObject(hero);
		for (fireball in fireballs) {
			screenWrapObject(fireball);
		}
		for (coin in coins) {
			screenWrapObject(coin);
		}

	}

	private function screenWrapObject(wrappingObject:FlxObject) {
		if (wrappingObject.x > FlxG.width) {
			wrappingObject.x = 0 - wrappingObject.width;
		} else if (wrappingObject.x + wrappingObject.width < 0) {
			wrappingObject.x = FlxG.width;
		}

		if (wrappingObject.y > FlxG.height) {
			wrappingObject.y = 0 - wrappingObject.height;
		} else if (wrappingObject.y + wrappingObject.height < 0) {
			wrappingObject.y = FlxG.height;
		}
	}

	/**
		Function called when an overlap between hero and fireball is detected.
	**/
	private function resolveHeroFireballOverlap(hero:Hero, fireball:Fireball) {
		trace("Hero and Fireball collided!");
		fireball.kill();
		hero.kill();

		loseMessage = new FlxText(200, 200, 0, "You Died!", 50);
		loseMessage.color.red;
		loseMessage.setBorderStyle(SHADOW, FlxColor.CYAN);
		add(loseMessage);
	}

	private function reseolveHeroCoinOverlap(hero:Hero, coin:Coin) {
		trace("You got a Coin!");
		coin.kill();
		token++;
		hud.updateHUD(token);

		if (token == COIN_COUNT)
			{
				trace ("You collected all the coins!");
				hero.kill();
				winMessage = new FlxText(200, 200, 0, "You Win!", 50);
				winMessage.color.yellow;
				winMessage.setBorderStyle(SHADOW, FlxColor.RED);
				add(winMessage);
			}
	}
}

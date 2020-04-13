package entities.collectables;

import flixel.util.FlxColor;
import flixel.FlxSprite;

class Coin extends FlxSprite {
    public function new(?X:Float = 0, ?Y:Float = 0) {
        super(X, Y);
        makeGraphic(10, 10, FlxColor.YELLOW);

        velocity.x = 50;
        velocity.y = 150;
    }
}
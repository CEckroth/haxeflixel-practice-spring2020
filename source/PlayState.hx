package;

import flixel.text.FlxText;
import flixel.util.FlxColor;
import flixel.FlxState;

class PlayState extends FlxState
{
	override public function create()
	{
		super.create();
		var myMsg = new FlxText(125, 200, 0);
		myMsg.text = "Greetings Humans.";
		myMsg.setFormat("assets/font.ttf", 50, FlxColor.RED, CENTER);
		myMsg.setBorderStyle(OUTLINE, FlxColor.BLUE, 1);
		add(myMsg);

		var player:Hero = new Hero();

		add(player);

	}

	override public function update(elapsed:Float)
	{
		super.update(elapsed);
		
	}
}

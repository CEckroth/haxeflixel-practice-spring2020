package ui;

import flixel.FlxG;
import flixel.FlxSprite;
import flixel.text.FlxText;
import flixel.util.FlxColor;
import flixel.group.FlxGroup.FlxTypedGroup;

using flixel.util.FlxSpriteUtil;



class HUD extends FlxTypedGroup<FlxSprite> 
{
    var tokenCount:FlxText;

    public function new()
    {
        super();
        tokenCount = new FlxText(16, 2, 0, "0 / 5", 8);
        tokenCount.setBorderStyle(SHADOW, FlxColor.WHITE);
        add(tokenCount);
        
    }

    public function updateHUD(token:Int)
    {
        tokenCount.text = token + " / 5";
    }
}
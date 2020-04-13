package;

import flixel.FlxG;
import flixel.ui.FlxButton;
import flixel.FlxState;

class MenuState extends FlxState
{
    var playButton:FlxButton;

    override public function create()
        {
            playButton = new FlxButton(0, 0, "Play", clickPlay);
            add(playButton);

            playButton.screenCenter();
            super.create();
        }


    function clickPlay()
        {
            FlxG.switchState(new PlayState());
            

        }
}
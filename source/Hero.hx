package;


import flixel.FlxSprite;
import flixel.FlxG;
import flixel.util.FlxColor;


class Hero extends FlxSprite
{
    public function new()
        {
            super();
    
            makeGraphic(20, 20);
            
        }



        override public function update(elapsed:Float):Void
            {
                super.update(elapsed);

                //updating position
                if (x<=615 && y==0)
                    {
                        x+=5;
                    }
                 if (x==620 && y<=455)
                    {
                       y+=5;
                    }
                if (x>=5 && y==460)
                     {
                       x-=5;
                    }
                if (x==0 && y>=5)
                    {
                        y-=5;
                    }

                //updating color
                
                //top left quadrent
                if (x<321 && y< 241)
                    {
                        color = 0xffffff00;
                    }
                //top right quadrent
                if (x>320 && y< 241)
                    {
                        color = 0xff00ff00;
                    }
                //bot right quadrent
                if (x>320 && y > 240)
                    {
                        color = 0xff00ffff;
                    }
                //bot left quadrent
                if (x<321 && y > 241)
                    {
                        color = 0xffff00ff;
                    }
                    
            }




}
package
{
	import org.flixel.*;

	public class Player extends FlxSprite
	{
		[Embed(source = "data/player.png")] protected var imgPlayer:Class;

		protected var jumpCount:int;
		protected var _jumpPower:int;
		
		public function Player(X:int,Y:int)
		{
			super(X,Y);
			loadGraphic(imgPlayer, true, true, 24);
			
			width = 8;
			height = 8;
			offset.x = 8;
			offset.y = 8;
			
			_jumpPower = 0;
			
			//basic player physics
			var runSpeed:uint = 120;
			drag.x = runSpeed*6;
			acceleration.y = 800;
			_jumpPower = 250;
			maxVelocity.x = runSpeed;
			maxVelocity.y = _jumpPower;
			
			addAnimation("idle", [0]);
			addAnimation("slashUp", [1]);
			addAnimation("slashDown", [2]);
			addAnimation("slashBack", [3]);
			addAnimation("slashForward", [4]);
		}
		
		override public function update():void
		{
			if (isTouching(FLOOR) && jumpCount != 0)
			{
				jumpCount = 0;
			}
			
			//MOVEMENT
			acceleration.x = 0;
			if(FlxG.keys.A)
			{
				facing = LEFT;
				acceleration.x -= drag.x;
			}
			else if(FlxG.keys.D)
			{
				facing = RIGHT;
				acceleration.x += drag.x;
			}
			if(FlxG.keys.justPressed("SPACE") && jumpCount<2)
			{
				velocity.y = -_jumpPower;
				jumpCount++;
			}
			
			//ATTACKING
			if (FlxG.keys.justPressed("UP"))
			{
				play("slashUp");
			}
			else if (FlxG.keys.justPressed("DOWN"))
			{
				play("slashDown");
			}
			else if (FlxG.keys.justPressed("LEFT"))
			{
				if (facing == LEFT)
				{
					play("slashForward");
				}
				else
				{
					play("slashBack");
				}
			}
			else if (FlxG.keys.justPressed("RIGHT"))
			{
				if (facing == RIGHT)
				{
					play("slashForward");
				}
				else
				{
					play("slashBack");
				}
			}
			else if(!(FlxG.keys.UP || FlxG.keys.DOWN || FlxG.keys.LEFT || FlxG.keys.RIGHT)) //REMOVE THIS LATER. WILL BE JUST AN 'else'
			{
				play("idle");
			}
		}
	}
}
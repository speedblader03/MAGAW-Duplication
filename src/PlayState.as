package  
{
	import org.flixel.*
	
	public class PlayState extends FlxState
	{
		[Embed(source = "data/block.png")] protected var imgBlock:Class;
		
		protected var _blocks:FlxGroup;
		protected var _player:Player
		
		override public function create():void
		{
			FlxG.bgColor = 0xffcccccc;
			
			_blocks = new FlxGroup();
			_player = new Player(50,50)
					
			add(_blocks);

			var w:FlxTileblock;
			w = new FlxTileblock(0, 0, 8, FlxG.height);
			w.loadTiles(imgBlock);
			_blocks.add(w);

			w = new FlxTileblock(FlxG.width-8, 0, 8, FlxG.height);
			w.loadTiles(imgBlock);
			_blocks.add(w);

			w = new FlxTileblock(8, 0, FlxG.width-16, 8);
			w.loadTiles(imgBlock);
			_blocks.add(w);

			w = new FlxTileblock(8, FlxG.height-8, FlxG.width-16, 8);
			w.loadTiles(imgBlock);
			_blocks.add(w);
			
			add(_player);
		}
		
		override public function update():void
		{			
			super.update();
			
			FlxG.collide(_blocks, _player);
		}
	}
}
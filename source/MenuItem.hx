package;

import flixel.FlxSprite;
import flixel.graphics.frames.FlxAtlasFrames;
import flixel.group.FlxSpriteGroup;
import flixel.math.FlxMath;

class MenuItem extends FlxSpriteGroup
{
	public var targetY:Float = 0;
	public var week:FlxSprite;

	public function new(x:Float, y:Float, weekNum:Int = 1)
	{
		super(x, y);

		var tex = FlxAtlasFrames.fromSparrow('assets/images/campaign_menu_UI_assets.png', 'assets/images/campaign_menu_UI_assets.xml');

		week = new FlxSprite();
		week.frames = tex;
		// TUTORIAL IS WEEK 0
		// week.animation.addByPrefix('week0', 'tutorial selected', 24);
		week.animation.addByPrefix('week0', "WEEK1 select", 24);
		week.animation.addByPrefix('week1', "week2 select", 24);
		week.animation.addByPrefix('week2', "Week 3 press", 24);
		week.animation.addByPrefix('week3', "Week 4 press", 24);
		week.animation.addByPrefix('week4', "week 5", 24);
		week.animation.addByPrefix('week5', "Week 6", 24);
		week.animation.addByPrefix('week6', "Week 3 press", 24);
		add(week);

		week.animation.play('week' + weekNum);
		week.animation.pause();
		week.updateHitbox();
	}

	override function update(elapsed:Float)
	{
		super.update(elapsed);
		y = FlxMath.lerp(y, (targetY * 120) + 480, 0.17);
	}
}

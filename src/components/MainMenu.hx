package components;
import components.Button;
import components.Component;
import motion.Actuate;
import motion.easing.Bezier;
import motion.easing.Expo;
import motion.easing.Quad;
import openfl.Assets;
import openfl.Lib;
import openfl.display.DisplayObject;
import openfl.display.MovieClip;
import openfl.display.SimpleButton;
import openfl.display.Sprite;
import openfl.events.MouseEvent;
import components.World;

/**
 * ...
 * @author Tom Wilson
 */
class MainMenu extends Component
{
	var menu:GameObject;
	var button:GameObject;
	var copyright:GameObject;
	var title:GameObject;

	public function new() 
	{
		super();
	}
	
	override function register() 
	{
		super.register();
		
		menu = GameObject.createWithDisplayObject(Assets.getMovieClip("assets:main_menu"), true);
		gameObject.addChild(menu);
		
		button = menu.getChildGoByName("startButton");
		copyright = menu.getChildGoByName("copyright");
		title = menu.getChildGoByName("title");
		
		var buttonComponent = new components.Button();
		buttonComponent.onClick = function(){
			buttonComponent.enabled = false;
			gameObject.mouseEnabled = false;
			gameObject.mouseEnabled = false;
			Actuate.tween(gameObject, 1, {alpha : 0}).onComplete(function(){
				destroy();
			});
			Main.self.world.start();
		};
		button.addComponent(buttonComponent);
		
		Actuate.tween(title, 1, { scaleX: 1.1, scaleY: 1.1 }).ease(Quad.easeInOut).repeat().reflect();
		title.rotation = -5;
		Actuate.tween(title, 0.5, { rotation: 5 }).ease(Quad.easeInOut).repeat().reflect();
		
		updateScreenPositions();
	}
	
	override public function update() 
	{
		super.update();
		
		updateScreenPositions();
	}
	
	function updateScreenPositions() 
	{
		button.x = App.SCREEN_WIDTH / 2;
		button.y = Math.min(App.SCREEN_HEIGHT * 0.85, App.SCREEN_HEIGHT - button.height / 2 - 10);
		
		copyright.x = App.SCREEN_WIDTH;
		copyright.y = App.SCREEN_HEIGHT;
		
		title.x = App.SCREEN_WIDTH/2;
		title.y = Math.max(App.SCREEN_HEIGHT * 0.133, title.height / 2 + 10);
	}
	
}
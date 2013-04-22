package ;

/**
 * Example to demonstrate Haxe
 * @author Silex Labs 2012
 */
class Sample2 {
	
	/** 
	 * name variable
	 */
	var myName = "Wxrld";
	
	/** 
	 * entry point of the app, executed at start
	 */
	static function main() {
		new Sample2();
	}
	
	/**
	 * class constructor
	 */
	public function new() {
		
		// create a container and add it to the stage
		var mc = new flash.display.MovieClip();
		flash.Lib.current.addChild(mc);

		// create a text fieled		
		var txt = new flash.text.TextField();
		mc.addChild(txt);
		
		// set the message in the text
		txt.htmlText = sayHello( myName );
		
		//add a callback for the text
		txt.addEventListener(flash.events.MouseEvent.CLICK, onClickCallback);
	}

	/** 
	 * callback for the click event
	 */
	function onClickCallback(event:flash.events.MouseEvent):Void 
	{
		var txt = event.target;
		
		//set a random hello message
		txt.htmlText = sayRandomHello();
	}
	
	/**
	 * build a random hello string
	 */
	function sayRandomHello() : String {
		
		var names = ["Haxe", "SilexLabs", myName];
		var randomName = names[Math.floor(Math.random() * 3)];
		
		return sayHello(randomName);
	}
	
	/** 
	 * method used to build the "Hello Wxrld!" string
	 */
	function sayHello(name : String) : String {

		// returns the concatenated string
		return "Hello " + name + "!";
	}
}
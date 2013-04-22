package ;

/**
 * Example to demonstrate Haxe
 * @author Silex Labs 2012
 */
class Sample1 {

	/** 
	 * name variable
	 */
	var myName = "Wxrld";

	/** 
	 * entry point of the app, executed at start
	 */
	static function main() {
		new Sample1();
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
	}

	/** 
	 * method used to build the "Hello Wxrld!" string
	 */
	static function sayHello(name : String) : String {

		// returns the concatenated string
		return "Hello " + name + "!";
	}
}
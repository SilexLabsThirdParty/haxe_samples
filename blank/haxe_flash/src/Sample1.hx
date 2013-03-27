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
		
	}

	/** 
	 * method used to build the "Hello Wxrld!" string
	 */
	static function sayHello(name : String) : String {

		// returns the concatenated string
		return "Hello " + name + "!";
	}
}
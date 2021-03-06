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
		
		// retrieve the container from HTML page
		var myDiv = js.Lib.document.getElementById("myDiv");

		// set the inner HTML
		myDiv.innerHTML = sayHello( myName );

	}
	
	/** 
	 * method used to build the "Hello Wxrld!" string
	 */
	function sayHello(name : String) : String {

		// returns the concatenated string
		return "Hello " + name + "!";

	}
}
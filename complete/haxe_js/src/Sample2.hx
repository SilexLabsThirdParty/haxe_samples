package ;

import js.Dom;

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
		
		// retrieve the container from HTML page
		var myDiv = js.Lib.document.getElementById("myDiv");

		// set the inner HTML
		myDiv.innerHTML = sayHello( myName );

		// adds a callback on the div
		myDiv.onclick = onClickCallback;
	}
	
	/** 
	 * callback for the click event
	 */
	function onClickCallback(event : js.Event) {

		// retrieve the div from the event object
		var myDiv = event.target;
		
		//set a random hello message
		myDiv.innerHTML = sayRandomHello();
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
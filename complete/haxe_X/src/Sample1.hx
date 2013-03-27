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
		
		#if js

			// retrieve the container from HTML page
			var myDiv = js.Lib.document.getElementById("myDiv");

			// set the inner HTML
			myDiv.innerHTML = sayHello( myName );

		#elseif flash

			// create a container and add it to the stage
			var mc = new flash.display.MovieClip();
			flash.Lib.current.addChild(mc);

			// create a text fieled		
			var txt = new flash.text.TextField();
			mc.addChild(txt);
			
			// set the message in the text
			txt.htmlText = sayHello( myName );

		#elseif php

			// create the HTML code
			var html = "<HTML>
				<HEAD>
					<TITLE>Haxe demo by Silex Labs</TITLE>
				</HEAD>
				<BODY>
				<P>::content::</P>
				</BODY>
			</HTML>";

			// insert the text
			html = StringTools.replace(html, "::content::", sayHello( myName ));

			// return the HTML to the browser
			php.Lib.print(html);

		#end
	}

	/** 
	 * method used to build the "Hello Wxrld!" string
	 */
	function sayHello(name : String) : String {

		// returns the concatenated string
		return "Hello " + name + "!";

	}
}
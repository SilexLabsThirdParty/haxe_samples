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
	}
	
	/** 
	 * method used to build the "Hello Wxrld!" string
	 */
	function sayHello(name : String) : String {

		// returns the concatenated string
		return "Hello " + name + "!";

	}
}
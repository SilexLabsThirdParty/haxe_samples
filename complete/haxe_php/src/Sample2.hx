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
		
		// read the HTML from file
		var html = php.io.File.getContent("test.html");

		// retrieve the text from GET
		var text;
		if (php.Web.getParams().exists('text'))
			text = sayHello(php.Web.getParams().get("text"));
		else
			text = sayHello(myName);

		// insert the text 
		html = StringTools.replace(html, "::content::", text);

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
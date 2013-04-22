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

		// insert the name 
		html = StringTools.replace(html, "::myName::", myName);

		// return the HTML to the browser
		php.Lib.print(html);
	}
}
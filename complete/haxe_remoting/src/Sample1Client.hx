package ;

/**
 * Example to demonstrate Haxe
 * @author Silex Labs 2012
 */
class Sample1Client {
	
	/** 
	 * name variable
	 */
	var myName = "Wxrld";

	/** 
	 * entry point of the app, executed at start
	 */
	static function main() {
		new Sample1Client();
	}
	
	/**
	 * class constructor
	 */
	public function new() {
		
		//create a remoting connection with the php script
		var cnx = haxe.remoting.HttpAsyncConnection.urlConnect("sample1/index.php");
		
		//call a method of the php script
		cnx.api.sayHello.call( [ myName ], onResult);
		
	}

	/**
	 * called when the php script returns a result
	 */
	function onResult(result : String) {

		#if js

		var myDiv = js.Lib.document.getElementById("myDiv");

		myDiv.innerHTML = result;
			
		#elseif flash

		var txt = new flash.text.TextField();
		flash.Lib.current.addChild(txt);

		txt.width = 500;
		txt.htmlText = result;
		
		#end
	}
}
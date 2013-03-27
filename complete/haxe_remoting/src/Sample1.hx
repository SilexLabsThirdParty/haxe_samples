package ;

/**
 * Example to demonstrate Haxe
 * @author Silex Labs 2012
 */
class Sample1 {
	
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
		
		#if php
		
		// create an empty context
		var ctx = new haxe.remoting.Context();
		
		// share the object "api" containing all the method of this class instance
		ctx.addObject("api", this);
		
		//handle the client request
		haxe.remoting.HttpConnection.handleRequest(ctx); 
		
		#else
		
			#if js

			var myDiv = js.Lib.document.getElementById("myDiv");

			//called once the php script returns a result
			var onResult = function(r) myDiv.innerHTML = r;
				
			#elseif flash

			var mc = new flash.display.MovieClip();
			flash.Lib.current.addChild(mc);
			var txt = new flash.text.TextField();
			txt.width = 500;
			mc.addChild(txt);
		
			//called once the php script returns a result
			var onResult = function(r) txt.htmlText = r;
			
			#end
		
		//create a remoting connection with the php script
		var cnx = haxe.remoting.HttpAsyncConnection.urlConnect("sample1/index.php");
		
		//call a method of the php script
		cnx.api.getFileContent.call([], onResult);
		
		#end
	}

	#if php
	
	/**
	 * return the content of a server file
	 */
	function getFileContent() : String {
		
		return php.io.File.getContent("test.html");
	}
	
	#end
}
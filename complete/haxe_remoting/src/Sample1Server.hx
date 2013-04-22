package ;

/**
 * Example to demonstrate Haxe
 * @author Silex Labs 2012
 */
class Sample1Server {
	
	/** 
	 * entry point of the app, executed at start
	 */
	static function main() {
		new Sample1Server();
	}

	/**
	 * class constructor
	 */
	public function new() {
		
		// create an empty context
		var ctx = new haxe.remoting.Context();
		
		// share the object "api" containing all the method of this class instance
		ctx.addObject("api", this);
		
		//handle the client request
		haxe.remoting.HttpConnection.handleRequest(ctx); 
	}

	/**
	 * return the content of a server file
	 */
	function sayHello(myName : String) : String {
		
		return "Hello "+myName+"!";
	}
}
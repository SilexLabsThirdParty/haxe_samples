<?php

class Sample1Server {
	public function __construct() { if(!php_Boot::$skip_constructor) {
		$ctx = new haxe_remoting_Context();
		$ctx->addObject("api", $this, null);
		haxe_remoting_HttpConnection::handleRequest($ctx);
	}}
	public function sayHello($myName) {
		return "Hello " . $myName . "!";
	}
	static function main() {
		new Sample1Server();
	}
	function __toString() { return 'Sample1Server'; }
}

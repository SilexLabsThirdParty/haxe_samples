<?php

class Sample1 {
	public function __construct() { if(!php_Boot::$skip_constructor) {
		$ctx = new haxe_remoting_Context();
		$ctx->addObject("api", $this, null);
		haxe_remoting_HttpConnection::handleRequest($ctx);
	}}
	public function getFileContent() {
		return sys_io_File::getContent("test.html");
	}
	static function main() {
		new Sample1();
	}
	function __toString() { return 'Sample1'; }
}

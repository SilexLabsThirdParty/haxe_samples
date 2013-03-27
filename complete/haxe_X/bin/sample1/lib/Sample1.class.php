<?php

class Sample1 {
	public function __construct() {
		if(!php_Boot::$skip_constructor) {
		$html = "<HTML>\x0D\x0A\x09\x09\x09\x09<HEAD>\x0D\x0A\x09\x09\x09\x09\x09<TITLE>Haxe demo by Silex Labs</TITLE>\x0D\x0A\x09\x09\x09\x09</HEAD>\x0D\x0A\x09\x09\x09\x09<BODY>\x0D\x0A\x09\x09\x09\x09<P>::content::</P>\x0D\x0A\x09\x09\x09\x09</BODY>\x0D\x0A\x09\x09\x09</HTML>";
		$html = str_replace("::content::", $this->sayHello($this->myName), $html);
		php_Lib::hprint($html);
	}}
	public function sayHello($name) {
		return "Hello " . $name . "!";
	}
	public $myName = "Wxrld";
	public function __call($m, $a) {
		if(isset($this->$m) && is_callable($this->$m))
			return call_user_func_array($this->$m, $a);
		else if(isset($this->»dynamics[$m]) && is_callable($this->»dynamics[$m]))
			return call_user_func_array($this->»dynamics[$m], $a);
		else if('toString' == $m)
			return $this->__toString();
		else
			throw new HException('Unable to call «'.$m.'»');
	}
	static function main() {
		new Sample1();
	}
	function __toString() { return 'Sample1'; }
}

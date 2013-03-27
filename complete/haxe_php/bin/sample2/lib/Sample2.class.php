<?php

class Sample2 {
	public function __construct() {
		if(!php_Boot::$skip_constructor) {
		$html = sys_io_File::getContent("test.html");
		$text = null;
		if(php_Web::getParams()->exists("text")) {
			$text = $this->sayHello(php_Web::getParams()->get("text"));
		} else {
			$text = $this->sayHello($this->myName);
		}
		$html = str_replace("::content::", $text, $html);
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
		new Sample2();
	}
	function __toString() { return 'Sample2'; }
}

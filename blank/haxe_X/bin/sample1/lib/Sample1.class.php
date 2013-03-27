<?php

class Sample1 {
	public function __construct() {
		;
	}
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

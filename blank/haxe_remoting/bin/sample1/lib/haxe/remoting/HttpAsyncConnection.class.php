<?php

class haxe_remoting_HttpAsyncConnection implements haxe_remoting_AsyncConnection{
	public function __construct($data, $path) {
		if(!php_Boot::$skip_constructor) {
		$this->__data = $data;
		$this->__path = $path;
	}}
	public function call($params, $onResult = null) {
		$h = new haxe_Http($this->__data->url);
		$s = new haxe_Serializer();
		$s->serialize($this->__path);
		$s->serialize($params);
		$h->setHeader("X-Haxe-Remoting", "1");
		$h->setParameter("__x", $s->toString());
		$error = (isset($this->__data->error) ? $this->__data->error: array($this->__data, "error"));
		$h->onData = array(new _hx_lambda(array(&$error, &$h, &$onResult, &$params, &$s), "haxe_remoting_HttpAsyncConnection_0"), 'execute');
		$h->onError = $error;
		$h->request(true);
	}
	public function setErrorHandler($h) {
		$this->__data->error = $h;
	}
	public function resolve($name) {
		$c = new haxe_remoting_HttpAsyncConnection($this->__data, $this->__path->copy());
		$c->__path->push($name);
		return $c;
	}
	public $__path;
	public $__data;
	public $»dynamics = array();
	public function __get($n) {
		if(isset($this->»dynamics[$n]))
			return $this->»dynamics[$n];
	}
	public function __set($n, $v) {
		$this->»dynamics[$n] = $v;
	}
	public function __call($n, $a) {
		if(isset($this->»dynamics[$n]) && is_callable($this->»dynamics[$n]))
			return call_user_func_array($this->»dynamics[$n], $a);
		if('toString' == $n)
			return $this->__toString();
		throw new HException("Unable to call «".$n."»");
	}
	static function urlConnect($url) {
		return new haxe_remoting_HttpAsyncConnection(_hx_anonymous(array("url" => $url, "error" => array(new _hx_lambda(array(&$url), "haxe_remoting_HttpAsyncConnection_1"), 'execute'))), new _hx_array(array()));
	}
	function __toString() { return 'haxe.remoting.HttpAsyncConnection'; }
}
function haxe_remoting_HttpAsyncConnection_0(&$error, &$h, &$onResult, &$params, &$s, $response) {
	{
		$ok = true;
		$ret = null;
		try {
			if(_hx_substr($response, 0, 3) !== "hxr") {
				throw new HException("Invalid response : '" . $response . "'");
			}
			$s1 = new haxe_Unserializer(_hx_substr($response, 3, null));
			$ret = $s1->unserialize();
		}catch(Exception $»e) {
			$_ex_ = ($»e instanceof HException) ? $»e->e : $»e;
			$err = $_ex_;
			{
				$ret = null;
				$ok = false;
				call_user_func_array($error, array($err));
			}
		}
		if($ok && $onResult !== null) {
			call_user_func_array($onResult, array($ret));
		}
	}
}
function haxe_remoting_HttpAsyncConnection_1(&$url, $e) {
	{
		throw new HException($e);
	}
}

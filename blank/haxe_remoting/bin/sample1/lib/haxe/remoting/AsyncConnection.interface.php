<?php

interface haxe_remoting_AsyncConnection {
	function setErrorHandler($error);
	function call($params, $result = null);
	function resolve($name);
}

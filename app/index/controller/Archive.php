<?php
namespace app\index\controller;

use think\Config;
use think\Env;
use think\Request;
use think\Controller;
use think\View;

class Archive extends Base
{
	public function __construct() {
        parent::__construct();
	}

	public function index() {
		return $this->fetch();
	}

	
}
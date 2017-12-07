<?php
namespace app\index\controller;

use think\Config;
use think\Env;
use think\Request;
use think\Controller;
use think\View;

class Category extends Base
{
	public function __construct() {
        parent::__construct();
	}

    public function index() {
    	$this->assign('categoryList', $this->categoryList);
        return $this->fetch();
    }


}
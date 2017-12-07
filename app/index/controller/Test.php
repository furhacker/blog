<?php
namespace app\index\controller;

use think\Config;
use think\Env;
use think\Request;
use think\Controller;
use think\View;

class Test extends Base
{
    public function index() {

    }

    public function hello($id) {
		// error_reporting(E_ALL ^ E_NOTICE);
		// echo $_SERVER["HTTP_REFERER"];

        if(isset($_SERVER['HTTP_REFERER'])) {
            echo $_SERVER['HTTP_REFERER'];
        }
        echo $id;

		// $this->success('新增成功', 'Study/index');
		// return $this->fetch();
    }
}
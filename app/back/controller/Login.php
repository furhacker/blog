<?php
namespace app\back\controller;

use think\Controller;

class Login extends Base
{
	function __construct() {
		parent::__construct();
	}

	public function index() {
		return $this->fetch();
	}

	public function check(){
	    $captcha = input('verify');
	    if(!captcha_check($captcha)){
	        // 验证码错误
	        echo 'error';
	    }else{
	        // 验证码正确
	        echo 'true';
	    }
	}

	public function captcha_src() {
		$captcha = new \think\captcha\Captcha();
		return $captcha->entry();
	}
}
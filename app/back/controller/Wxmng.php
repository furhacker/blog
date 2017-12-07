<?php
namespace app\back\controller;

class Wxmng extends Base
{
	public function __construct() {
		parent::__construct();
	}

    public function index() {
    	echo $this->redis->get('test');


        return $this->fetch();
    }

    
}
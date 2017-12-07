<?php
namespace app\index\controller;

class About extends Base
{
	public function __construct() {
        parent::__construct();
	}

	public function index() {
		return $this->fetch();
	}
}
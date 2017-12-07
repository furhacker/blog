<?php
namespace app\index\controller;

use think\Db;

class Debris extends Base
{
	public function __construct() {
        parent::__construct();
	}

	public function index() {
		$debrisList = Db::query("
            SELECT * FROM ".$this->coModel->blog_debris." ORDER BY gmt_create DESC
        ");
        $this->assign('debrisList', $debrisList);
		return $this->fetch();
	}
}
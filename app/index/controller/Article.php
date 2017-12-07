<?php
namespace app\index\controller;

use think\Db;
use app\common\model\CommonModel;

class Article extends Base
{
	public $coModel;
	public function __construct() {
        parent::__construct();
        $this->coModel = new CommonModel();
	}

	public function detail() {
		$id = input('get.id');
		$id = isset($id) ? $id : 25;
		$detail = Db::table($this->coModel->blog_article)->where('id='.$id)->find();
        $this->assign('detail', $detail);
		return $this->fetch();
	}
}
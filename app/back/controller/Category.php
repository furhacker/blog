<?php
namespace app\back\controller;

use think\Request;

class Category extends Base
{
	
	function __construct() {
		parent::__construct();
	}

	// 分类列表
	public function getCategoryList() {
		if (request()->isPost()) {
			$tagList = model('Category')->getCategoryList();
			$count   = count($tagList);

			$reData  = array();
            $reData['code']  = 0;
            $reData['msg']   = '';
            $reData['count'] = $count;
            $reData['data']  = $tagList;

            echo json_encode($reData);die;
		}
		return $this->fetch();
	}
}
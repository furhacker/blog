<?php
namespace app\back\controller;

use think\Controller;
use think\Request;

class Tag extends Base
{
	function __construct() {
		parent::__construct();
	}

	// 增
	public function addNewTag() {

	}

	// 删
	public function delTag() {

	}

	// 改
	public function editTag() {
		
	}

	// 查
	public function getTagList() {
		if (request()->isPost()) {
			$tagList = model('Tag')->getTagList();

			$reData  = array();
            $reData['code']  = 0;
            $reData['msg']   = '';
            $reData['count'] = $this->allTagCou;
            $reData['data']  = $tagList;

            echo json_encode($reData);die;
		}
		return $this->fetch();
	}

}
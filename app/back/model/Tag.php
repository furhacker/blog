<?php
namespace app\back\model;

use think\Model;
use think\Request;
use think\Db;

use app\common\model\CommonModel;

class Tag extends CommonModel
{
	protected $table = '';

	public function __construct() {
		parent::__construct();
		$this->table = $this->blog_tag;
	}

	// 增
	public function addNewArticle($data) {
		$Art = new Article;
		$Art->data = $data;
		$res = $Art->allowField(['title','desc','author','content'])->save();
		if ($res) {
			return 'true';
		} else {
			return 'false';
		}
	}

	// 删
	public function delArticle() {

	}

    // 改
    public function editArticle() {
    	
    }

	// 查询
	public function getTagList() {
		$tagList = db($this->table)->order('name asc')->select();
		return $tagList;
	}

	// 第一种(增)
	/*
		public function addNewAdminUser() {
			// 实例化model类
			$Admin = new Admin();
			// 向变量里赋值array表单值
			$Admin->data = input('post.');
			// 插入数据
			if ($Admin->save()) {
				return true;
			} else {
				return false;
			}
		}
	*/

	// 第二种(增)
	public function addNewAdminUser($data) {
		// 实例化model类
		$Admin = new Admin();
		// 向变量里赋值array表单值
		$Admin->data = $data;
		// 插入数据
		if ($Admin->save()) {
			return true;
		} else {
			return false;
		}
	}

	// 模型-获取器
	public function getStatusAttr($value) {
        $status = [-1=>'删除',0=>'禁用',1=>'正常',2=>'待审核'];
        return $status[$value];
    }
}
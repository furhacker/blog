<?php
namespace app\back\model;

use think\Model;
use think\Request;
use think\Db;

use app\common\model\CommonModel;

class Article extends CommonModel
{
	protected $table = '';

	public function __construct() {
		parent::__construct();
		$this->table = $this->blog_article;
	}

	// 增
	public function addNewArticle($data) {
		$Art = new Article;
		$Art->data = $data;
		$res = $Art->allowField(['title','desc','author','content','category_id'])->save();
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
    
    // 查 (所有 文章 列表)
    public function getArticleList($page, $limit) {
    	$articleList = db($this->table)->order('status desc')->limit(($page-1)*$limit, $limit)->select();
		return $articleList;
    }

    // 模型-获取器
	public function getStatusAttr($value) {
        $status = [-1=>'删除',0=>'禁用',1=>'正常',2=>'待审核'];
        return $status[$value];
    }
}
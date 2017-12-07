<?php
namespace app\back\controller;

use think\Controller;
use think\Request;

class Article extends Base
{
	function __construct() {
		parent::__construct();
	}

	// 增
	public function addNewArticle() {
		if ($this->request->isPost()) {
			// 接收数据
			$data = $this->request->param();

			// 验证数据
			$validate = \think\Loader::validate('Article');
			if (!$validate->scene('add')->check($data)) {
				return show(0, $validate->getError());
			}

			// 过滤 content
			

			// 获取 作者(登陆用户名)
			

			// 保存数据
			// $Article = new ArticleModel;
			$Article = model('Article');
			$res     = $Article->addNewArticle($data);
			// dump($res);die;
			
			if ($res) {
				return show(1, '添加成功');
			} else {
				return show(0, '添加失败');
			}
		}

		// 标签列表
		$tagList = model('Tag')->getTagList();
		$this->assign('tagList', $tagList);

		// 分类列表
		$categoryList = model('Category')->getCategoryList();
		$this->assign('categoryList', $categoryList);

		return $this->fetch();
	}

	// 删
	public function delArticle() {

	}

	// 改
	public function editArticle() {
		if ($this->request->isPost()) {
			
		}
		return $this->fetch();
	}

	// 
	public function updateById() {

	}

	// 查 文章列表
	public function getArticleList() {
		if ($this->request->isPost()) {
			$page  = input('post.page');
			$limit = input('post.limit');
			$articleList = model('Article')->getArticleList($page, $limit);

			// 1999-05-05 15:22:22 => 05-05 15:22
			foreach ($articleList as $key => $value) {
				$articleList[$key]['gmt_create'] = mb_substr($value['gmt_create'], 5, 11, 'utf-8');
			}

			$reData = array();
            $reData['code']  = 0;
            $reData['msg']   = '';
            // $reData['count'] = $this->pubArtCou;	// 已发布文章数量
            $reData['count'] = $this->allArtCou;	// 所有 文章数量
            $reData['data']  = $articleList;

        	echo json_encode($reData);die;
		}

		return $this->fetch();
	}

	// 代码高亮实例
	public function add() {
		return $this->fetch();
	}
}
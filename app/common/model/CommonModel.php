<?php
namespace app\common\model;

use think\Model;

class CommonModel extends Model
{
	public $blog_article;			// 文章
	public $blog_content;			// 文章详情
	public $blog_category;			// 分类
	public $blog_relation;			// 文章-标签 关系表
	public $blog_tag;				// 标签
	public $blog_debris;			// 闲言碎语

	public function __construct() {
		$this->blog_article  = 'blog_article';
		$this->blog_content  = 'blog_content';
		$this->blog_category = 'blog_category';
		$this->blog_relation = 'blog_relation';
		$this->blog_tag 	 = 'blog_tag';
		$this->blog_debris 	 = 'blog_debris';
	}
}
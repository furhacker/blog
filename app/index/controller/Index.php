<?php
namespace app\index\controller;

use think\Config;
use think\Env;
use think\Request;
use think\Controller;
use think\View;
use think\Db;

use app\common\model\CommonModel;

class Index extends Base
{   
    // public $coModel;
	public function __construct() {
        parent::__construct();
	}

    public function index() {
        $count    = $this->pubArtCou;
        $page     = input('post.page');
        $pageSize = Config::get('pageSize');
        $page     = isset($page) ? $page : 1;

        /**
         * 文章列表
         */
        $articleList = Db::query("
            SELECT 
            a.*, 
            c.id c_id, c.name category_name,
            re.tag 
            FROM ".$this->coModel->blog_article." a 
            LEFT JOIN ".$this->coModel->blog_category." c ON a.category_id=c.id 
            LEFT JOIN (
                SELECT r.a_id,group_concat(t.name) AS tag 
                FROM ".$this->coModel->blog_relation." AS r 
                LEFT JOIN blog_tag AS t 
                ON r.t_id=t.id 
                GROUP BY r.a_id
            ) re ON a.id=re.a_id
        ");

        foreach ($articleList as $key => $value) {
            // 标签 字符串 分割为 数组
            if ($value['tag'] != null) {
                $articleList[$key]['tag'] = explode(',', $value['tag']);
            }
            // 提取正文图片
            $articleList[$key]['img'] = extractContentImg($value['content']);
        }

        $this->assign('articleList', $articleList);

        /**
         * Recent Posts
         */
        
        /**
         * Categories
         */
        $this->assign('categoryList', $this->categoryList);
        
        /**
         * Tags
         */


        return $this->fetch();
    }



    /*public function archive() {
    	return $this->fetch();
    }

    public function category() {
    	return $this->fetch();
    }

    public function mo() {
    	return $this->fetch();
    }

    public function about() {
    	return $this->fetch();
    }*/


}

<?php
namespace app\common\controller;

use think\Request;
use think\Config;
use think\Env;
use think\Controller;
use think\Db;

use app\common\model\CommonModel;

class CommonBase extends Controller
{
	// Redis
	public $redis;
	private static $redisConfig;

	private static $AppID;
	private static $AppSecret;
	public $access_token;

	public $coModel;	// CommonModel

	public $pubArtCou;	// 已发布 文章数量
	public $allArtCou;	// 所有   文章数量
	public $allTagCou;	// 所有   标签数量categoryList
	public $categoryList;	// 分类列表 (数组)

	public function __construct() {
		parent::__construct();

		// 实例化 CommonModel
		$this->coModel = new CommonModel();

		# 实例化 Redis+连接+认证
		$this->redis = new \Redis();
		self::$redisConfig = Config::get('redis');
		$this->redis->connect('127.0.0.1', 6379, 1);
		// $this->redis->connect(self::$redisConfig['redis_host'], self::$redisConfig['redis_port']);
		$this->redis->auth('yetong');
		// $this->redis->auth(self::$redisConfig['redis_auth']);

		
		self::getPubArtCou();	// 获取 已发布 文章数量
		self::getAllArtCou();	// 获取 所有   文章数量
		self::allTagCou();		// 获取 所有   标签数量
		self::getCategoryList();		// 获取 所有   标签数量

		// 读取微信配置
        self::$AppID     = Config::get('wx_gzh.AppID');
		self::$AppSecret = Config::get('wx_gzh.AppSecret');

		// 获取微信 access_token
    	// self::getAccessToker();  // 上线开启
    	// dump($this->access_token);    	

		# 判断控制器(栏目名称)
		$request 	= Request::instance();
        $controller = strtolower($request->controller());
        $this->assign('controller', $controller);
        // dump(Config::get('database.password'));die;
        // dump(Env::get('status'));die;

	}

	// 获取已发布文章数量
	private function getPubArtCou() {
		// 从 redis 读取
    	$this->pubArtCou = $this->redis->get('pubArtCou');

    	// 判断是否过期
    	if (empty($this->pubArtCou)) {
			// 从数据库获取
    		$couArr = Db::query("SELECT COUNT(*) AS count FROM ".$this->coModel->blog_article." WHERE status=:status",['status'=>'1']);
			// access_token 存入 redis 缓存
			$this->redis->set('pubArtCou', $couArr[0]['count']);
			$this->pubArtCou = $couArr[0]['count'];
			//$this->redis->expire('access_token', 7000);	// 设置过期时间(提前200秒)
    	}

		// return $this->pubArtCou;
	}

	// 获取 所有 文章数量
	private function getAllArtCou() {
		// 从 redis 读取
    	$this->allArtCou = $this->redis->get('allArtCou');

    	// 判断是否过期
    	if (empty($this->allArtCou)) {
			// 从数据库获取
    		$couArr = Db::query("SELECT COUNT(*) AS count FROM ".$this->coModel->blog_article);
			// access_token 存入 redis 缓存
			$this->redis->set('allArtCou', $couArr[0]['count']);
			$this->allArtCou = $couArr[0]['count'];
			//$this->redis->expire('access_token', 7000);	// 设置过期时间(提前200秒)
    	}

		// return $this->allArtCou;
	}

	// 获取 所有 文章数量
	private function allTagCou() {
		// 从 redis 读取
    	$this->allTagCou = $this->redis->get('allTagCou');

    	// 判断是否过期
    	if (empty($this->allTagCou)) {
			// 从数据库获取
    		$couArr = Db::query("SELECT COUNT(*) AS count FROM ".$this->coModel->blog_tag);
			// access_token 存入 redis 缓存
			$this->redis->set('allTagCou', $couArr[0]['count']);
			$this->allTagCou = $couArr[0]['count'];
    	}
	}

	// 获取 分类 列表
	public function getCategoryList() {
		// 从 redis 读取
		$json_list = $this->redis->get('categoryList');

    	// 判断是否过期
    	if (empty($json_list)) {
			// 从数据库获取
    		$arr_list = Db::query("
    			SELECT c.name, a.category_id, COUNT(a.category_id) AS count 
            	FROM ".$this->coModel->blog_category." c 
            	LEFT JOIN ".$this->coModel->blog_article." a 
            	ON c.id = a.category_id 
            	GROUP BY c.name");

			// 存入 redis 缓存
			$this->categoryList = json_encode($arr_list);
			$this->redis->set('categoryList', $this->categoryList);

    	} else {
    		$this->categoryList = json_decode($json_list, true);
    	}
	}

	// 验证 微信服务器配置 Token
    public function checkSignature() {
    	define("TOKEN","wxyetong");
	    //从GET参数中读取三个字段的值
	    $signature = $_GET["signature"];
	    $timestamp = $_GET["timestamp"];
	    $nonce 	   = $_GET["nonce"];
	    //读取预定义的TOKEN
	    $token     = TOKEN;
	    //对数组进行排序
	    $tmpArr    = array($token, $timestamp, $nonce);
	    sort($tmpArr, SORT_STRING);
	    //对三个字段进行sha1运算
	    $tmpStr    = implode( $tmpArr );
	    $tmpStr    = sha1( $tmpStr );
	    //判断我方计算的结果是否和微信端计算的结果相符
	    //这样利用只有微信端和我方了解的token作对比,验证访问是否来自微信官方.
	    if( $tmpStr == $signature ){
	        // return true;
	        echo $_GET['echostr'];
	    }else{
	        // return false;
	        echo 'error';
	    }
	}

	/**
	 * [获取微信 access_token]
	 * @link https://api.weixin.qq.com/cgi-bin/token?grant_type=client_credential&appid=APPID&secret=APPSECRET
	 * @return access_token
	 */
	private function getAccessToker() {
		// 从 redis 读取
    	$this->access_token = $this->redis->get('access_token');

		// 判断是否过期
    	if (empty($this->access_token)) {
			$url = 'https://api.weixin.qq.com/cgi-bin/token?grant_type=client_credential&appid='.self::$AppID.'&secret='.self::$AppSecret;
			$access_token_json  = curl_get_https($url);	// 公共方法
			// dump($access_token_json);die;
			$access_token_arr   = json_decode($access_token_json, true);
			$this->access_token = $access_token_arr['access_token'];

			// access_token 存入 redis 缓存
			$this->redis->set('access_token', $this->access_token);
			$this->redis->expire('access_token', 7000);	// 设置过期时间(提前200秒)
    	}

		return $this->access_token;
	}

	// 文件上传
	public function upload(){
	    // 获取表单上传文件 例如上传了001.jpg
	    $file = request()->file('image');
	    
	    // 移动到框架应用根目录/public/uploads/ 目录下
	    if($file){
	        $info = $file->move(ROOT_PATH . 'public' . DS . 'uploads');
	        if($info){
	            // 成功上传后 获取上传信息
	            // 输出 jpg
	            echo $info->getExtension();
	            // 输出 20160820/42a79759f284b767dfcb2a0197904287.jpg
	            echo $info->getSaveName();
	            // 输出 42a79759f284b767dfcb2a0197904287.jpg
	            echo $info->getFilename(); 
	        }else{
	            // 上传失败获取错误信息
	            echo $file->getError();
	        }
	    }
	}
}
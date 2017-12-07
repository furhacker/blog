<?php
namespace app\index\controller;

use think\Config;
use think\Env;
use think\Request;
use think\Controller;
use think\View;
//use think\Captcha;

class Study extends Controller
{
    public function __construct() {
        parent::__construct();
        config('before', 'beforeAction');
    }

    // Config 配置
    public function index() {
        // $res = config();
        // $res = \think\Config::get();
        $res = Config::get();
        dump($res);

        Config::set('username', 'along1-');
        echo Config::get('username');

        Config::set('username2', 'along2', 'index');
        echo Config::get('username2', 'index');

        //$res = Config::has('username');
        $res = config('?user');
        dump($res);

        $captcha = new \Captcha();
        return $captcha->entry();

        return '前台';
    }

    // 环境变量 ENV 助手函数
    public function huanjingbianliang() {
        dump(ENV::get('status'));
        dump(ENV::get('email'));
        dump(ENV::get('email2', 'default'));
        dump(ENV::get('database.username'));

        dump(memory_get_usage(true));

        echo $this->convert(memory_get_usage(true));
    }

    function convert($size) {
        $unit = array('b','kb','mb','gb','tb','pb');
        return @round($size/pow(1024,($i=floor(log($size,1024)))),2).' '.$unit[$i];
    }

    // 路由
    public function info($id) {
        echo url('index/index/index', ['id'=>10]) . "<br/>";
        echo url('index/index/info', ['id'=>10]) . "<br/>";

        return "{$id}"; // http://blog.tp5.com/news/5
    }

    // 获取 请求对象
    public function qingqiu() {
        // $request = request();    // 助手函数
        $request = Request::instance();
        dump($request);

        return 'qingqiu';
    }

    public function qingqiu2(Request $request) { // 注入对象
        dump($request);
    }

    public function hehe() {
        $request = Request::instance();
        dump($request->domain());
    }

    // http://blog.tp5.com/index/index/qingqiu3/type/3.html?id=2
    public function qingqiu3(Request $request) { // 注入对象

        # 获取浏览器地址栏的值
        dump($request->domain());   // 获取域名 http://blog.tp5.com
        dump($request->pathinfo()); // 获取pathinfo index/index/qingqiu3/type/3.html
        dump($request->path());     // 获取pathinfo index/index/qingqiu3/type/3

        dump($request->url());      // /index/index/qingqiu3/type/3.html?id=2
        dump($request->baseUrl());  // /index/index/qingqiu3/type/3.html

        # 请求类型
        dump($request->method());   // 请求方法
        dump($request->isGet());    // 是否是 Get 请求
        dump($request->isPost());   // 是否是 Post 请求
        dump($request->isAjax());   // 是否是 Ajax 请求

        # 请求参数
        dump($request->get());
        // array(1) {
        //   ["id"] => string(1) "2"
        // }
        dump($request->param());    // get和post都包含
        // array(2) {
        //   ["id"] => string(1) "2"
        //   ["type"] => string(1) "3"
        // }
        dump($request->param('type'));
        dump($request->post());

        # session, cookie
        // session('name', 'yetong');
        dump($request->session());
        // cookie('email', 'asldfs@sldf.com');
        dump($request->cookie());
        dump($request->cookie('email'));
        dump($request->cookie('email', 'hehe@hehe.com'));

        session('ss', '     456    ');
        dump($request->session('ss', '', 'trim'));  // 默认值为空, 启用过滤

        # 模块,控制器,方法
        dump($request->module());
        dump($request->controller());
        dump($request->action());
    }

    // input 助手函数
    // http://blog.tp5.com/index/index/inputhanshu/type/3.html?id=2
    public function inputhanshu(Request $request) {
        # 可获取的类型
        # get
        # post
        # param
        # session
        # put
        # file
        # path

        // get post put
        // patch delete param
        // request session
        // cookie server
        // env path file
        dump($request->param());
        $res = input('id');

        $res = input('get.id');
        $res = input('get.id', 100);

        $res = input('post.id');
        $res = input('post.id', 200);
        $res = input('post.id', 200, 'intval'); // 过滤为整数
        dump($res);

        session('name', 'yetong');
        // session('email', 'yetong@123.com');
        dump(input('session.emailxx', 'hehe@hehe.com'));

        dump('patch.sid');
    }


    // 响应对象
    // http://blog.tp5.com/index/index/xiangying?type=jsonp
    public function xiangying($type='json') {
        if (!in_array($type, ['json', 'jsonp', 'xml'])) {
            $type = 'json';
        }

        Config::set('default_return_type', $type);

        $res = [
            'code' => 200,
            'result' => [
                'list' => [1,3,2,4],
            ]
        ];

        // return dump($res);
        // return 123;

        // Config::set('default_return_type', 'json');
        // Config::set('default_return_type', 'xml');
        return $res;
    }


    # 视图
    public function shitu() {

        // return view();   // index/shitu.html
        // return view('xxx');  // index/xxx.html
        // return view('xxx/abcdhtml');    // xxx文件夹/abchtml.html文件
        // return view('./abcdhtml');  // 入口文件同级目录

        // return view('index', [
        //     'name' => 'hehe',
        //     'user' => 'imooc',
        // ],[
        //     'STATIC' => '当前是static的替换内容'
        // ]);

        $this->assign('assign', 'assign传递的值');

        // return $this->fetch();
        return $this->fetch('index', [
            'name' => 'hehe',
            'user' => 'imooc',
        ],[
            'STATIC' => '当前是static的替换内容'
        ]);

    }

    public function play() {
        $this->assign('key1', 'value');

        $this->view->key2 = 'value2';

        View::share('key3', 'value3');

        return $this->fetch('play', [
            'email' => '4545@56.com',
            'name' => 'hehe',
        ]);

        // return $this->display('这是一个字符串');
    }

    # 系统变量原生标签
    # http://blog.tp5.com/index/index/xtbianliang
    public function xtbianliang() {
        // dump($_SERVER);
        // cookie('name', 'tongye');
        dump(ENV::get('status'));
        return $this->fetch();
    }

    # 变量输出
    public function bianliang() {
        $this->assign('name' ,'yetong');
        $this->assign('email', '17771958@qq.com');
        $this->assign('time', time());
        $this->assign('a', 10);
        $this->assign('b', 20);
        return $this->fetch();
    }

    # 变量循环输出
    public function xunhuan() {
        $list = [
            'user1' => [
                'name' => 'yetong1',
                'email' => 'yetong1@12.com',
            ],
            'user2' => [
                'name' => 'yetong2',
                'email' => 'yetong2@12.com',
            ],
            'user3' => [
                'name' => 'yetong3',
                'email' => 'yetong3@12.com',
            ],
        ];

        $this->assign('list', $list);

        return $this->fetch();
    }

    # 比较标签
    public function bijiao() {
        $this->assign('a', 10);
        $this->assign('b', 10);
        return $this->fetch();
    }

    # 条件判断标签
    public function tiaojian() {
        $this->assign('a', 10);
        $this->assign('b', 10);
        return $this->fetch();
    }


}

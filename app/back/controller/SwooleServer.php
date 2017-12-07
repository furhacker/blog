<?php
namespace app\back\controller;

class Swooleserver extends Base
{
	public function __construct() {
		parent::__construct();
	}


	public function index() {
		// 构建Server对象
		$serv = new swoole_server('0.0.0.0', 9501, SWOOLE_BASE, SWOOLE_SOCK_TCP);
dump($serv);
		// 设置运行时参数
		$serv->set(array(
		    'worker_num' => 4,
		    'daemonize'  => true,
		    'backlog'  	 => 128,
		));

		// 注册事件回调函数
		$serv->on('Connect', 'my_onConnect');
		$serv->on('Receive', 'my_onReceive');
		$serv->on('Close',   'my_onClose');

		// 启动服务器
		$serv->start();
	}


}
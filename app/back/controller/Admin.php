<?php
namespace app\back\controller;

use think\Controller;
use think\Model;
use think\Request;
// use think\Db;
// use think\Config;
// use think\Env;

class Admin extends Base
{
	function __construct() {
		parent::__construct();
	}

	// 管理员列表
	public function getAdminUserList() {
		if ($this->request->isPost()) {
			$adminUserList = model('Admin')->getAdminUserList();
			$count = count($adminUserList);
			
			$reData = array();
            $reData['code']  = 0;
            $reData['msg']   = '';
            $reData['count'] = $count;
            $reData['data']  = $adminUserList;

            echo json_encode($reData);die;
		} else {
			return $this->fetch();
		}
	}

	// 添加管理员
	// public function add(Request $request) {
	public function addNewAdminUser() {
		// if ($request->isPost()) {
		if (request()->isPost()) {

			// $coon = Db::connect('mysql://root:mysql@127.0.0.1:3306/3306#utf8');
			// dump($coon);die;
			// 接收数据
			$data = [
				'username' 	 => input('username'),
				'password'   => md5(input('password')),
				'repassword' => md5(input('repassword')),
				'email'    	 => input('email'),
				'sex'      	 => input('sex'),
			];
			// $data = $request->param();	// 过滤后: "sdfd    &lt;sdf&gt;/sd"(左右空格不过滤)
			// $data = input('post.');

			// 验证数据
			$validate = \think\Loader::validate('Admin');
			if (!$validate->scene('add')->check($data)) {
				return show(0, $validate->getError());
			}

			// 实例化Admin, 插入数据
			// try {
			//     $Admin = new AdminModel;
			// } catch (Exception $e) {
			//     echo 'init error :', $e->getMessage();
			//     exit;
			// }

			$Admin = model('Admin');
			// $Admin = new AdminModel;
			$res   = $Admin->addNewAdminUser($data);
			if ($res) {
				return show(1, '添加成功');
			} else {
				return show(0, '添加失败');
			}

			// if (db('admin')->insert($data)) {
			// 	return show(1, '添加成功');
			// } else {
			// 	return show(0, '添加失败');
			// }
		}

		return $this->fetch();
	}

}
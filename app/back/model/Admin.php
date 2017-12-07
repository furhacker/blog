<?php
namespace app\back\model;

use think\Model;
use think\Request;

class Admin extends Model
{
	protected $table = 'admin_user';

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

    // 改
    public function editAdminUser() {
    	
    }
    
    // 查
    public function getAdminUserList() {
    	$adminUserList = db('admin_user')->select();
		return $adminUserList;
    }
}
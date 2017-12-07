<?php
namespace app\back\validate;

use think\Validate;

class Admin extends Validate
{
    protected $rule = [
        'username'   => 'require|max:25',
        'password'   => 'require|max:32',
        'repassword' => 'require|confirm:password',
	    'email'      => 'email',
    ];

    protected $message = [
        'username.require' => '缺少用户名',
        'username.max'     => '名称最多不能超过25个字符',
        'password.max'     => '密码最多不能超过32个字符',
        // 'age.number'   => '年龄必须是数字',
        // 'age.between'  => '年龄只能在1-120之间',
        // 'repassword'       => '邮箱格式错误', 
        'email'            => '邮箱格式错误', 
    ];

    protected $scene = [
        'add'  => ['username'=>'require', 'password'],
        'edit' => ['username'=>'require', 'password'],
    ];

}
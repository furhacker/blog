<?php
namespace app\back\validate;

use think\Validate;

class Article extends Validate
{
    protected $rule = [
        'title'  => 'require|max:25',
        'desc'   => 'require|max:32',

    ];

    protected $message = [
        'title.require'  => '缺少标题',
        'title.max'      => '标题最多不能超过25个字符',
        'desc.require'   => '缺少描述',
        'desc.max'       => '描述最多不能超过32个字符',
    ];

    protected $scene = [
        'add'  => ['title'=>'require', 'desc'=>'require'],
        'edit' => ['username'=>'require', 'password'],
    ];

}
<?php
// +----------------------------------------------------------------------
// | ThinkPHP [ WE CAN DO IT JUST THINK ]
// +----------------------------------------------------------------------
// | Copyright (c) 2006~2016 http://thinkphp.cn All rights reserved.
// +----------------------------------------------------------------------
// | Licensed ( http://www.apache.org/licenses/LICENSE-2.0 )
// +----------------------------------------------------------------------
// | Author: liu21st <liu21st@gmail.com>
// +----------------------------------------------------------------------
# 第一种方式
# Route::rule('路由表达式','路由地址','请求类型','路由参数(数组)','变量规则(数组)');
use think\Route;
//Route::rule('hello', 'index/Test/hello');
//Route::rule('hello', 'index/Test/hello','GET');
//Route::rule('hello', 'index/Test/hello','GET',['https'=>true]);
//Route::rule('hello', 'index/Test/hello','GET|POST',['https'=>true]);
//Route::get('hello', 'index/Test/hello');
//Route::post('hello', 'index/Test/hello');
//Route::any('hello', 'index/Test/hello');
// Route::any('hello/:id','index/Test/hello');
// Route::any('back/index','back/index/index');

# 第二种方式
/*return [
    '__pattern__' => [
        'name' => '\w+',
    ],
    '[hello]'     => [
        ':id'   => ['index/hello', ['method' => 'get'], ['id' => '\d+']],
        ':name' => ['index/hello', ['method' => 'post']],
    ],

];*/

Route::get('banner/:id', 'api/v1.Banner/getBanner');
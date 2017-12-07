<?php
namespace app\api\controller\v1;

use app\api\validate\IDMustBePostiveInt;
use app\api\validate\TestValidate;
use think\Validate;

class Banner
{
	/**
	 * 获取指定id的banner信息
	 * @url  /banner/:id
	 * @http GET
	 * @id banner的id号
	 */
	public function getBanner($id) {
		$data = [
			'name'  => 'hehe1',
			'email' => 'heh123.com',
		];

	/*  
		// 独立验证
		$validate = new Validate([
			'name'  => 'require|max:5',
			'email' => 'email',
		]);
	*/

		// 验证器验证
		$validate = new TestValidate();
		// $res = $validate->check($data);	// 单条验证
		$res = $validate->batch()->check($data);	// 批量验证, 返回数组结果

		if (!$res) {
			// echo $validate->getError();	// 单条验证
			dump($validate->getError());	// 批量验证
		} else {
			return 'true';
		}
		//(new IDMustBePostiveInt())->goCheck();
	}
}
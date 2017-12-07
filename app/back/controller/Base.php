<?php
namespace app\back\controller;

use think\Controller;
use think\Request;
use think\Config;
use app\common\controller\CommonBase;

class Base extends CommonBase
{
	public function __construct() {
		parent::__construct();  
	}

    /**
     * [自定义菜单]
     * @access public
     * @link   string  https://api.weixin.qq.com/cgi-bin/menu/create?access_token=ACCESS_TOKEN
     * @return json
     */
    public function editMenu() {
    	$url = 'https://api.weixin.qq.com/cgi-bin/menu/create?access_token='.$this->access_token;
    	// echo $url;die;
    	$data = '
    		{
			    "button": [
			        {
			            "name": "扫码", 
			            "sub_button": [
			                {
			                    "type": "scancode_waitmsg", 
			                    "name": "扫码带提示", 
			                    "key": "rselfmenu_0_0", 
			                    "sub_button": [ ]
			                }, 
			                {
			                    "type": "scancode_push", 
			                    "name": "扫码推事件", 
			                    "key": "rselfmenu_0_1", 
			                    "sub_button": [ ]
			                }
			            ]
			        }, 
			        {
			            "name": "发图", 
			            "sub_button": [
			                {
			                    "type": "pic_sysphoto", 
			                    "name": "系统拍照发图", 
			                    "key": "rselfmenu_1_0", 
			                   "sub_button": [ ]
			                 }, 
			                {
			                    "type": "pic_photo_or_album", 
			                    "name": "拍照或者相册发图", 
			                    "key": "rselfmenu_1_1", 
			                    "sub_button": [ ]
			                }, 
			                {
			                    "type": "pic_weixin", 
			                    "name": "微信相册发图", 
			                    "key": "rselfmenu_1_2", 
			                    "sub_button": [ ]
			                }
			            ]
			        }, 
			        {
			            "name": "发送位置", 
			            "type": "location_select", 
			            "key": "rselfmenu_2_0"
			        },
			        {
			           "type": "media_id", 
			           "name": "图片", 
			           "media_id": "MEDIA_ID1"
			        }, 
			        {
			           "type": "view_limited", 
			           "name": "图文消息", 
			           "media_id": "MEDIA_ID2"
			        }
			    ]
			}';
		$result = curl_post_https($url, $data);
		//dump($result);
    }

    public function ttt() {
    	return $this->upload();
    }
}
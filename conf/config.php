<?php
use think\Env;

return [
    // 获取环境变量中的场景配置
    // 'app_status'         => \think\Env::get('app_status', 'dev'),
    'app_status'         => \think\Env::get('app_status'),
    'app_debug'          => true,

    // 'auto_bind_module'   => true,       // 开启入口文件自动绑定模块
    'url_route_on'       => true,           // 是否开启路由
    // 'url_route_must'     => false,       // 强制使用路由

    // 默认模块名
    // 'default_module'     => 'index',
    // 禁止访问模块
    // 'deny_module_list'   => ['common'],
    // 默认控制器名
    // 'default_controller' => 'Index',

    'pageSize' => 10, // 博客首页 pageSize

    //验证码
    'captcha'  => [
        // 验证码字符集合
        'codeSet'  => '2345678abcdefhijkmnpqrstuvwxyzABCDEFGHJKLMNPQRTUVWXY',
        // 验证码字体大小(px)，根据所需进行设置验证码字体大小
        'fontSize' => 30,
        // 是否画混淆曲线
        'useCurve' => true,
        // 验证码图片高度，根据所需进行设置高度
        'imageH'   => '',
        // 验证码图片宽度，根据所需进行设置宽度
        'imageW'   => '',
        // 验证码位数，根据所需设置验证码位数
        'length'   => 4,
        // 验证成功后是否重置
        'reset'    => true
    ],

    'session' => [
        'id'             => '',
        'var_session_id' => '',         // SESSION_ID的提交变量,解决flash上传跨域        
        'prefix'         => 'think',    // SESSION 前缀
        'type'           => '',         // 驱动方式 支持redis memcache memcached
        'auto_start'     => true,       // 是否自动开启 SESSION
    ],
    
    'view_replace_str'   => [
        '__FCSS__'       => '/static/front/css',
        '__FJS__'        => '/static/front/js',
        '__FIMG__'       => '/static/front/img',

        '__BCSS__'       => '/static/back/css',
        '__BJS__'        => '/static/back/js',
        '__BIMG__'       => '/static/back/img',

        '__UPLOAD__'     => '/static/upload',
        '__PLUGIN__'     => '/plugin',
    ],

    // 微信公众号配置
    'wx_gzh'            => [
        'AppID'         => 'wx0e4fa88ad49544d8',
        'AppSecret'     => '0935e44b0d27dc32d9f6adc8ab849a03',
    ],
    // QQ第三方登陆
    'qq_login'          => [
        'AppID'         => 'wx0e4fa88ad49544d8',
        'AppSecret'     => '0935e44b0d27dc32d9f6adc8ab849a03',
    ],







    // 支付宝配置参数 (是从接口包中alipay.config.php 文件中复制过来，进行配置)
    'alipay_config' => [
        // 这里是你在成功申请支付宝接口后获取到的PID
        'partner'       => '2088621966916154',
        // 这里是你在成功申请支付宝接口后获取到的Key
        'key'           => 'hxwdy9542khwauam2r7nx2c17b7kemdn',
        'sign_type'     => strtoupper('MD5'),
        'input_charset' => 'utf-8',
        // cacert.pem存放的位置 (固定值不用改)
        'cacert'        =>  VENDOR_PATH.'Alipay/cacert.pem',  
        'transport'     => 'http',
    ],
    
    'alipay' => [
        //这里是卖家的支付宝账号，也就是你申请接口时注册的支付宝账号
        'seller_email'  =>'gpf@hebeiyingdi.com',

        //这里是异步通知页面url，提交到项目的Pay控制器的notifyurl方法；
        'notify_url'    =>'http://www.luotuoker.com/Pay/notifyurl', 
        
        //这里是页面跳转通知url，提交到项目的Pay控制器的returnurl方法；
        'return_url'    =>'http://www.luotuoker.com/Pay/returnurl',

        //支付成功跳转到的页面，我这里跳转到项目的User控制器，myorder方法并传参payed（已支付列表）
        'successpage'   =>'User/myorder?ordtype=payed',

        //支付失败跳转到的页面，我这里跳转到项目的User控制器，myorder方法并传参unpay（未支付列表）
        'errorpage'     =>'User/myorder?ordtype=unpay', 
    ],
    /*****************支付宝*****************************/

    /*****************微信支付*****************************/
    'WEIXINPAY_CONFIG'  => [
        'APPID'         => 'wx9de922609f5a13f3', // 微信支付APPID
        'MCHID'         => '1469027102',         // 微信支付MCHID 商户收款账号
        'KEY'           => '8934e8d154r3e9f508ef794cf8b0519d', // 微信支付KEY
        'APPSECRET'     => '879464521c1a3c9b3cd304cbcffa6cf5', // 公众帐号secert (公众号支付专用)
        'NOTIFY_URL'    => 'http://www.luotuoker.com/pay/notify', // 接收支付状态的连接
    ],
    /*****************微信支付*****************************/

    /*****************微信登录*****************************/
    'weixinlogin'       => [
        'AppID'         => 'wx1971373585f393a0',
        'AppSecret'     => 'be1274037a7bf2a9a43510fb1c271fcb',
        'callback'      => 'http://www.luotuoker.com/user/wxLoginBack' //回调地址
    ],
    /*****************微信登录*****************************/

    
];
<?php
// 应用公共文件
header("Content-type:text/html;charset=utf-8");

// 提取正文图片
function extractContentImg($data) {
    preg_match_all("/<img([^>]*)\s*src=('|\")([^'\"]+)('|\")/", $data, $matches);
    $imgArr = array_unique($matches[0]);//去除数组中重复的值
    if ($imgArr != null) {
        return $imgArr[0];
    } else {
        return '';
    }
}

// curl get 方式获取数据
function curl_get_https($url) {
    $curl = curl_init(); // 启动一个CURL会话
    curl_setopt($curl, CURLOPT_URL, $url);
    curl_setopt($curl, CURLOPT_HEADER, 0);
    curl_setopt($curl, CURLOPT_RETURNTRANSFER, 1);
    date_default_timezone_set('PRC'); // 使用Cookie时，必须先设置时区
	curl_setopt($curl, CURLOPT_SSL_VERIFYPEER, 0); // 对认证证书来源的检查从证书中检查SSL加密算法是否存在
	curl_setopt($curl, CURLOPT_SSL_VERIFYHOST, 2);
    $tmpInfo = curl_exec($curl);     //返回api的json对象
    //关闭URL请求
    curl_close($curl);
    return $tmpInfo;    //返回json对象
}

// curl post 方式获取数据
function curl_post_https($url, $data) { // 模拟提交数据函数
    $curl = curl_init(); // 启动一个CURL会话
    curl_setopt($curl, CURLOPT_URL, $url); // 要访问的地址
    curl_setopt($curl, CURLOPT_SSL_VERIFYPEER, 0); // 对认证证书来源的检查从证书中检查SSL加密算法是否存在
	curl_setopt($curl, CURLOPT_SSL_VERIFYHOST, 2);// 从证书中检查SSL加密算法是否存在
    curl_setopt($curl, CURLOPT_USERAGENT, $_SERVER['HTTP_USER_AGENT']); // 模拟用户使用的浏览器
    curl_setopt($curl, CURLOPT_FOLLOWLOCATION, 1); // 使用自动跳转
    curl_setopt($curl, CURLOPT_AUTOREFERER, 1); // 自动设置Referer
    curl_setopt($curl, CURLOPT_POST, 1); // 发送一个常规的Post请求
    curl_setopt($curl, CURLOPT_POSTFIELDS, $data); // Post提交的数据包
    curl_setopt($curl, CURLOPT_TIMEOUT, 30); // 设置超时限制防止死循环
    curl_setopt($curl, CURLOPT_HEADER, 0); // 显示返回的Header区域内容
    curl_setopt($curl, CURLOPT_RETURNTRANSFER, 1); // 获取的信息以文件流的形式返回
    $tmpInfo = curl_exec($curl); // 执行操作
    if (curl_errno($curl)) {
        echo 'Errno'.curl_error($curl);//捕抓异常
    }
    curl_close($curl); // 关闭CURL会话
    return $tmpInfo;   // 返回数据，json格式
}

// 数据处理返回信息
function show($status, $message, $data=array()) {
    $reuslt = array(
        'status'  => $status,
        'message' => $message,
        'data'    => $data,
    );
    exit(json_encode($reuslt));
}



































// 接口
const JSON = "json";
function appReturn($code, $message='', $data=array(), $type=JSON) {
    if(!is_numeric($code)) return '';

    $type = isset($_GET['format']) ? $_GET['format'] : JSON;

    $result = array(
        'code'    => $code,
        'message' => $message,
        'data'    => $data,
    );

    if($type == 'json') {
        json($code, $message, $data);
        exit;

    } elseif($type == 'array') {
        var_dump($result);

    } elseif($type == 'xml') {
        xmlEncode($code, $message, $data);
        exit;

    } else {
        // do SomeThing
    }
}

/**
* 按json方式输出通信数据
* @param integer $code 状态码
* @param string $message 提示信息
* @param array $data 数据
* return string
*/
function json($code, $message = '', $data = array()) {
    if(!is_numeric($code)) return '';

    $result = array(
        'code'    => $code,
        'message' => $message,
        'data'    => $data
    );

    echo json_encode($result);
    exit;
}

/**
* 按xml方式输出通信数据
* @param integer $code 状态码
* @param string $message 提示信息
* @param array $data 数据
* return string
*/
function xmlEncode($code, $message, $data = array()) {
    if(!is_numeric($code)) return '';

    $result = array(
        'code' => $code,
        'message' => $message,
        'data' => $data,
    );

    header("Content-Type:text/xml");
    $xml  = "<?xml version='1.0' encoding='UTF-8'?>\n";
    $xml .= "<root>\n";

    $xml .= xmlToEncode($result);

    $xml .= "</root>";
    echo $xml;
}

function xmlToEncode($data) {
    $xml = $attr = '';
    foreach($data as $key => $value) {
        if(is_numeric($key)) {
            $attr = "id='{$key}'";
            $key  = "item";
        }
        $xml .= "<{$key}{$attr}>";
        $xml .= is_array($value) ? xmlToEncode($value) : $value;
        $xml .= "</{$key}>\n";
    }
    return $xml;
}
<?php
header("Access-Control-Allow-Origin:*");
header("Content-Type:text/html; charset=utf-8");
define("ACTION_LOGIN", 'login');
define("ACTION_REGIST", 'reg');
define("ACTION_LOGOUT", 'logout');

$method = null;


$result = array();
if (isset($_GET['method'])) {
    $method = $_GET['method'];
}
if ($method == ACTION_LOGIN) {
    $result['code'] = 0;
    $result['msg'] = "登陆成功";
    $result['data'] = array("id" => 1000, "name" => "会员01","userName"=>"ado");
} else if ($method == ACTION_REGIST) {
    $result['code'] = 0;
    $result['msg'] = "注册成功";
    $result['data'] = array("id" => 1000, "name" => "会员01","userName"=>"ado");
} else {
    $result['code'] = -1;
    $result['msg'] = "非法请求";
}
echo json_encode($result);
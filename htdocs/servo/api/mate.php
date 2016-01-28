<?php
header("Access-Control-Allow-Origin:*");
define("SCODE_IMG", "si");
if (isset($_GET['method'])) {
    $method = $_GET['method'];
}
session_start();
if ($method == "g") {//get
    include("../service/controller/mate/MateController.php");
    MateController::getCode(SCODE_IMG);
    $_SESSION['lt']=time();
    return;
}
header("Content-Type:text/html; charset=utf-8");
if ($method == "m") {
    //match
    $result = array();
    if(!isset( $_SESSION['lt'])){
        if( time()- $_SESSION['lt']>20){
            $result['code'] = -3;
            $result['msg'] = "无效的请求";
        }else{
            $result['code'] = -2;
            $result['msg'] = "验证已经失效，请重新获取";
        }
    }else{
        if (isset($_SESSION[SCODE_IMG])) {
            if ($_SESSION[SCODE_IMG] == $_GET['v']) {
                $result['code'] = 0;
                $result['msg'] = "OK";
            } else {
                $result['code'] = 1;
                $result['msg'] = "No Match";
            }
        } else {
            $result['code'] = -1;
            $result['msg'] = "非法请求";
        }
    }
    unset($_SESSION['lt']);
    unset($_SESSION[SCODE_IMG]);
    echo json_encode($result);
}




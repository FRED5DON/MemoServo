<?php
header("Access-Control-Allow-Origin:*");
include("../service/com/headers.php");
define("SCODE_IMG", "si");
if (isset($_GET['method'])) {
    $method = $_GET['method'];
}
session_start();
if ($method == "g") {//get
    include("../service/controller/mate/MateController.php");
    MateController::getCode(SCODE_IMG);
    $_SESSION['lt'] = time();
    return;
}
header("Content-Type:text/html; charset=utf-8");
if ($method == "m") {
    include("../service/com/resp.php");
    //match
    $result = null;
    if (!isset($_SESSION['lt'])) {
        $result = Resp::makeMsg(-1, "非法请求");
    } else {
        if (time() - $_SESSION['lt'] > 600) {
            unset($_SESSION['lt']);
            unset($_SESSION[SCODE_IMG]);
            $result = Resp::makeMsg(-2, "验证已经失效，请重新获取");
        } else {
            if (isset($_SESSION[SCODE_IMG])) {
                if ($_SESSION[SCODE_IMG] == $_GET['v']) {
                    $result = Resp::makeMsg(0, "OK");
                } else {
                    $result = Resp::makeMsg(1, "不匹配，请重新获取");
                }
                unset($_SESSION['lt']);
                unset($_SESSION[SCODE_IMG]);
            } else {
                $result = Resp::makeMsg(-1, "非法请求");
            }
        }
    }
    echo json_encode($result);
} else {
    include("../service/com/common_cfg.php");
    header("HTTP/1.1 403 " . $_HTTP_CODE["403"]);
}




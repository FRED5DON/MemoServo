<?php
class Resp{

    public static function makeMsg($code=0,$msg=""){
        $respMsg=array();
        $respMsg['code']=$code;
        $respMsg['msg']=$msg;
        return $respMsg;
    }

    public static function makeDataMsg($code=0,$msg="",$data){
        $respMsg=self::makeMsg($code,$msg);
        if($data){
            $respMsg['data']=$data;
        }
        return $respMsg;
    }
}
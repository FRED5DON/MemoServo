<?php
include("../../db.php");

class BaseController
{
    private $dbCon;

    public function __construct()
    {
        $this->dbCon=DbCon::getDbcon();
    }

    public function getDbCon(){
        if(!$this->dbCon){
            $this->dbCon=DbCon::getDbcon();
        }
        return $this->dbCon;
    }
}
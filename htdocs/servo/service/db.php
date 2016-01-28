<?php
class DbCon{

	public static function getDbcon()
	{
		$localhost="qdm122976243.my3w.com:3306";
		$admin="qdm122976243";
		$db="qdm122976243_db";
		$pwd="netsjk1989";
		// $localhost="localhost:3306";
		// $admin="root";
		// $pwd="";
		$con = mysql_connect($localhost,$admin,$pwd);
		if (!$con)
		{
			die('Could not connect: ' . mysql_error());
			return "";
		}else{
			mysql_select_db($db, $con);
			return $con;
		}

	}
}

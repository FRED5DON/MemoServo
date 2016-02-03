<?php
$cod=sha1("fred".md5((ceil(time()/1000)^0X782)));
$_token=base64_encode($cod);
header("token:$_token");
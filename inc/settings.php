<?php 

# a very simple settings file for various things that you may need to tweak.

$siteroot = dirname($_SERVER['PHP_SELF']);

#get this folder without the actual '/s' folder included
$sitefolder = $siteroot;

###### DATABASE CONNECTION
#
# BEFORE you do anything else below, please read either read readme.md or read the 'Create a database' section of the db/db-howto.md document and then come back here.

# Your database connection should look like the line below. 
#$db = new PHD('username', 'password', dirname(__DIR__, 1).'/db/database'); # this line will connect to a database named 'database' in the 'db/' folder of the ProtoStack directory.
# OR
#$db = new PHD('username', 'password', '/your/path/db/database'); # if you want to manually add your full path. It's easier to do it the other way.

# Put your connection code here.
#$db = new PHD('admin', 'password', dirname(__DIR__, 1).'/db/database');

#################################################################################
# BELOW HERE MUST NOT BE CHANGED UNLESS SOMETHING ISN'T WORKING!!!!!!!!                             #
#################################################################################

# find the root url of the site
$siteurl = (isset($_SERVER['HTTPS']) ? 'https' : 'http') . '://' . $_SERVER['HTTP_HOST'] . $siteroot;

# find the path of the site - the code here is used by the routing code in index.php
function get_path($siteurl){
	$url = rtrim((isset($_SERVER['HTTPS']) ? 'https' : 'http') . "://$_SERVER[HTTP_HOST]$_SERVER[REQUEST_URI]", '/');
	$url = trim(str_replace($siteurl, "", $url), '/');
	$url = trim(strtok($url, '?'), '/');  #/ to remove GET data
	$url = explode('/', $url);
	$url = array_filter($url);
	return $url;
}

# put the path into a variable so that we can break it down into numeric form - eg $path[0] is root, $path[1] is the first folder and so on.
# See index file for this bit to make sense.
$path = get_path($siteurl);





?>

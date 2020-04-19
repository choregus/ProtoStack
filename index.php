<?php
ini_set('display_errors', 1);
ini_set('display_startup_errors', 1);
error_reporting(E_ALL);

####################################
##
## This file (index.php) is essentially a 'routing' file.
## When you type in a url in the browser, this file points you towards the correct template and engine files for that url. 
##
## Please correctly choose the $siteroot (in inc/settings.php file) before you start to edit this file.
##
## the structure of ProtoStack is as follows
##
##          installation_directory/ - the name of the directory that you uploaded ProtoStack to
##              .htaccess - ensures that ProtoStack resolves urls. Do not edit unless necessary
##              index.php - this file. routes a requested url to the correct engine and template file.
##              engine/
##                     home.php - this file contains code and variables that you show in the corresponding template file (home.tpl)
##                     example.php - code for a page that shows some of what you can do with UIkit
##                     another.php - code for a blank page for you to see how the routing works in this file.                              
##                     db-example.php - shows some examples of database operations.                              
##              templates/
##                        home.tpl - the template that 'echos' variables created in home.php
##                        header.tpl - the <head> tag and navigation for the site
##                        footer.tpl - stuff you want at the bottom of each page
##                        example.tpl - a page that shows some of what you can do with UIkit
##                        another.tpl - some examples of how the template engine works.
##                        db-example.tpl - shows some examples of database operations.
##
##                        whatever files you add - must end with .tpl
##                        * note that files that end with '-.php' are dynamically generated in this folder. Do not delete them.
##
##              inc/ - useful files including style.css, phd.class.php, and template.class.php
##              db/ - the flat file database engine, 'PHD'. 
##
####################################

# include all the include files required (inc/includes.php contains instructions to include any other files needed)
require('inc/includes.php');
     
#if this is the homepage
if (count($path) == 0) {
	
	$pageTemplate = 'home'; # name of template, minus the .tpl extension
	
	#these lines put the header on to the top of the template file, so that we only have to edit one version of the page header (header.tpl)
	$header = file_get_contents('templates/header.tpl');
  # same with footer  
	$footer = file_get_contents('templates/footer.tpl');
	$fileContents = file_get_contents('templates/'.$pageTemplate.'.tpl');
	file_put_contents('templates/'.$pageTemplate.'-.tpl', $header . $fileContents . $footer);
		
  #put the home (in this case) template as the template in use now. 
	$tpl = new Template('templates/'.$pageTemplate.'-.tpl');	
	
	#include the engine page that that runs php code for this template.
	include('engine/'.$pageTemplate.'.php');

} 

#########

# if not viewing the homepage, what is the name of the directory/file that is used?
else { 
	if ($path[0] == 'example') {
		

		$pageTemplate = 'example';
			
	#these lines put the header on to the top of the template file, so that we only have to edit one version of the page header (header.tpl)
	$header = file_get_contents('templates/header.tpl');
  # same with footer  
	$footer = file_get_contents('templates/footer.tpl');
	$fileContents = file_get_contents('templates/'.$pageTemplate.'.tpl');
	file_put_contents('templates/'.$pageTemplate.'-.tpl', $header . $fileContents . $footer);
		
  #put the home (in this case) template as the template in use now. 
	$tpl = new Template('templates/'.$pageTemplate.'-.tpl');	
	
	#include the engine page that that runs php code for this template.
	include('engine/'.$pageTemplate.'.php');
			
	} 
  
  #########
  # Or is it another directory/file?
  
  else if ($path[0] == 'another') {
			
		$pageTemplate = 'another';
		
	#these lines put the header on to the top of the template file, so that we only have to edit one version of the page header (header.tpl)
	$header = file_get_contents('templates/header.tpl');
  # same with footer  
	$footer = file_get_contents('templates/footer.tpl');
	$fileContents = file_get_contents('templates/'.$pageTemplate.'.tpl');
	file_put_contents('templates/'.$pageTemplate.'-.tpl', $header . $fileContents . $footer);
		
  #put the home (in this case) template as the template in use now. 
	$tpl = new Template('templates/'.$pageTemplate.'-.tpl');	
	
	#include the engine page that that runs php code for this template.
	include('engine/'.$pageTemplate.'.php');
		
} 
  
  #########
  # A page showing examples of how the database works?
  
  else if ($path[0] == 'db-example') {
			
		$pageTemplate = 'db-example';
		
	#these lines put the header on to the top of the template file, so that we only have to edit one version of the page header (header.tpl)
	$header = file_get_contents('templates/header.tpl');
  # same with footer  
	$footer = file_get_contents('templates/footer.tpl');
	$fileContents = file_get_contents('templates/'.$pageTemplate.'.tpl');
	file_put_contents('templates/'.$pageTemplate.'-.tpl', $header . $fileContents . $footer);
		
  #put the home (in this case) template as the template in use now. 
	$tpl = new Template('templates/'.$pageTemplate.'-.tpl');	
	
	#include the engine page that that runs php code for this template.
	include('engine/'.$pageTemplate.'.php');
		
}   
	
 else {
		# if user looks for something that we haven't created, show a 404 error!
		
		header("HTTP/1.0 404 Not Found");
echo "<h1>404 Not Found</h1>";
echo "The page that you have requested could not be found.";
exit();
		
	}
}

###############################################################################################
#this is used for canonical url tags in header markup
$current_url = "https://$_SERVER[HTTP_HOST]$_SERVER[REQUEST_URI]";
$tpl->assign('url', $current_url); 

## Display the template (load the visible webpage).
$tpl->display();

 ?>

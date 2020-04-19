<?php 
# This PHP code is required and must stay at the top of this file.
# this line finds the root url of the site - e.g. mysite.com
$siteurl = (isset($_SERVER['HTTPS']) ? 'https' : 'http') . '://' . $_SERVER['HTTP_HOST'];
# this line finds the current path of the site - e.g. /xxx/yyy
$url = $_SERVER['REQUEST_URI'];
# Because I'm bad at coding, we also need the following few line here in the head as well as in inc/settings.php
# enter the root of where you install protostack
# eg if its in yoursite.com/protostack, then enter /protostack - with NO trailing slash
$siteroot = dirname($_SERVER['PHP_SELF']); # - this line makes sure the header file knows which folder it is in.

?><!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1.0, user-scalable=no">
  <title>{title}</title>
  <meta name="description" content="{description}">
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/uikit@3.2.6/dist/css/uikit.min.css" />
  <link rel="stylesheet" href="<?php echo $siteurl.$siteroot;  ?>/inc/style.css" type="text/css">
  <link rel="canonical" href="{url}">
  <link href="https://fonts.googleapis.com/css?family=Merriweather|Merriweather+Sans&display=swap" rel="stylesheet">
  <script src="https://cdn.jsdelivr.net/npm/uikit@3.2.6/dist/js/uikit.min.js"></script>
</head>
<body>
  <?php 
  
  # this code allows us to put in the menu items for the navigation bar without having to enter it twice (one for main page and one for mobile version).
  # always better to use full urls (e.g. https://mysite.com/whatever).
  $menu_items = '<li><a href="'.$siteurl.$siteroot.'/">Home</a></li>
                <li><a href="'.$siteurl.$siteroot.'/example">Example</a></li>
                <li><a href="'.$siteurl.$siteroot.'/another">Another</a></li>
                <li><a href="'.$siteurl.$siteroot.'/db-example">Database Examples</a></li>';
  ?>
  <div class="uk-container">

    <div class="uk-navbar-container uk-navbar">

      <div class="uk-navbar-left">
        <a href="<?php echo $siteurl.$siteroot;  ?>/" class="uk-navbar-item uk-logo">
		        <img src="<?php echo $siteurl.$siteroot;  ?>/inc/logo.png" alt="stuff here." style="max-width:100%;">
	        </a>
      </div>
      <div class="uk-navbar-right">
        <ul class="uk-navbar-nav uk-visible@s">
          <?php echo $menu_items; ?>
        </ul>
        <a href="#" class="uk-navbar-toggle uk-hidden@s" uk-navbar-toggle-icon uk-toggle="target: #sidenav"></a>
      </div>
    </div>
    <div id="sidenav" uk-offcanvas="flip: true" class="uk-offcanvas">
      <div class="uk-offcanvas-bar">
        <ul class="uk-nav">
          <?php echo $menu_items; ?>
        </ul>
      </div>
    </div>

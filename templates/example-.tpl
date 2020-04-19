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
<h1>{h1}</h1>
<p>This page shows off a few of the things that can be done very easily with UIkit to make your ProtoStack look very smart, but also quite functional. Take a look at the <a href="https://getuikit.com/docs/introduction">introduction to UIkit</a> to find out what you can do.</p>

<table class="uk-table uk-table-striped">
  <thead>
    <tr>
      <th>#</th>
      <th>Widgets Sold</th>
      <th>Revenue (£)</th>
      <th>Profit (£)</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <td>1</td>
      <td>5</td>
      <td>10</td>
      <td>2</td>
    </tr>
    <tr>
      <td>2</td>
      <td>10</td>
      <td>20</td>
      <td>4</td>
    </tr>
    <tr>
      <td>3</td>
      <td>500</td>
      <td>1000</td>
      <td>200</td>
    </tr>
  </tbody>
</table>

<h2>Doing things!</h2>
			<p>Enter how many pounds you want!<br/>
        <span class="addon">£ </span><input type="text" class="uk-input uk-form-width-small"> Forms are easy</p>

<div class="uk-child-width-1-1@s uk-grid-collapse" uk-grid>
        <div class="uk-tile uk-tile-primary">
            <h2>Example</h2>
	<p>Many things are easy to do in terms of design</p>
	<a class="uk-button uk-button-primary" href="http://disney.com">Go Disney!</a>
        </div>
</div>
<br />
<div class="uk-alert-primary" uk-alert>
	<strong>Alert headline!</strong>
	Message text
</div>
<hr />
<div class="uk-child-width-expand@s uk-grid-divider" uk-grid>
  <div class="uk-grid-item-match"><h3>Cheesey</h3>Columns and buttons are easy<br /><a class="uk-button uk-button-secondary uk-first-column" href="https://cheese.com">Cheesey</a></div>
    <div><h3>Apples 'n Pears</h3>Links can be disguised as buttons, too.<br /><a class="uk-button uk-button-danger uk-first-column" href="https://apple.com">Apples</a></div>
</div><hr/>

   <p>&copy; <?php echo date("Y"); ?> ProtoStack</p> 
</div>  
</body>
</html>
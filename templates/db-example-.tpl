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

<p>ProtoStack comes with its very own flat file database engine built in (we use PHD - see base of this page). This page will show you some examples of how to work with data and include it in your new projects.</p>

<p>You can see full instructions of how to create and connect to your database tables in <a href="db/howto.md" target="_blank">db/howto.md</a>. The page you are reading doesn't deal with connecting to the database, but instead shows some basic operations, such as creating tables, inserting data, and displaying table data via the template engine.</p>

<p>
  Firstly, let's create a new table.
</p>

<pre>
# in engine/db-example.php

    $db->table('team', array(
    'name' => 'string',
    'age' => 'int',
    'email' => 'string'
     ))->create();
</pre>

<p>
  Now, let's add two rows of data.
</p>
<pre>
# in engine/db-example.php

# Add an item to the table
        $db->table('team')->put(array(
         'username' => 'Bob',
         'password' => 'mary123',
         'email' => 'bobross@reddit.com'
        ));

# Add another item to the table
        $db->table('team')->put(array(
         'username' => 'Steve',
         'password' => 'ilovecheese',
         'email' => 'steve@reddit.com'
        ));
</pre>

<p>
  Now, 'get' the data from the 'team' table, and put it into a PHP array called $team.
</p>
<pre>
# in engine/db-example.php

$team = $db->table('team')->get();
</pre>

<p>
  The $team PHP variable now contains the two rows of data pulled from the database using the 'get' command above. This means that we can now use it in PHP code, or simply use the template engine 'LOOP' command to manipulate the data. See below.
</p>

<p>
  Now, let's use the template engine to show the data
</p>
<pre>
# in templates/db-example.tpl

 &lt;table&gt;
  &lt;tr&gt;
  &lt;th&gt;Username&lt;/th&gt;&lt;th&gt;Password&lt;/th&gt;&lt;th&gt;Email&lt;/th&gt;
  &lt;/tr&gt;
  &lbrace;LOOP:team&rbrace;
  &lt;tr&gt;
  &lt;td&gt;&lbrace;username}&lt;/td&gt;&lt;td&gt;&lbrace;password}&lt;/td&gt;&lt;td&gt;&lbrace;email}&lt;/td&gt;
  &lt;/tr&gt;
  &lbrace;ENDLOOP}
&lt;/table&gt;
</pre>

<h3>The loop code above produces the table below</h3>
<table class="uk-table uk-table-striped">
  <tr>
  <th>Username</th><th>Password</th><th>Email</th>
  </tr>
  {LOOP:team}
  <tr>
  <td>{username}</td><td>{password}</td><td>{email}</td>
  </tr>
  {ENDLOOP}
</table>
  
 <p>You can read more about PHD <a href="https://github.com/derp-all-day/PHD">here</a>.</p>
   
  

<hr/>

   <p>&copy; <?php echo date("Y"); ?> ProtoStack</p> 
</div>  
</body>
</html>
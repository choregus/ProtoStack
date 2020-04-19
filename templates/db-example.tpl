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
   
  


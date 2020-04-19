<?php
# Code needs to be executed here and then assigned to the template.

# Fill up template with values
# this is how you pass variables from this page to the template file.
#  - e.g you show $variable as {variable} in the associated template file. 
$tpl->assign('title', 'Database Examples');
$tpl->assign('h1', 'Database Examples for ProtoStack');
$tpl->assign('description', 'How to work with ProtoStack\'s included database engine.');

# Code to create the 'team' table

# this code deletes a table called team if it exists. This is so we can start fresh each time db-example loads, and is not a normal thing to do.
if($db->table('team')->exists()) {
  $db->table('team')->delete();
} 
  # Create the table
  $db->table('team', array(
    'username' => 'string',
    'password' => 'string',
    'email' => 'string'
     ))->create();
  
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

# Get the data from the table
$team = $db->table('team')->get();

# Put the $team PHP variable into a variable that the template engine will use.
$tpl->assign('team', $team);


?>

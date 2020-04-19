# PHD Flat File Database for PHP - How to use

This quick guide has been written by James Welch so that using the PHD flat file system is as easy as possible within your ProtoStack project.

## Create a database
Firstly, you will need to create the database name with user and password access. This should be done in the create-db.php file (located in the db directory). You can delete 'create-db.php' once the database is created.

- Open create-db.php
- Uncomment and edit the line that starts with '(new PHD)->setupDatabaseRoot' so that the databse name (which is turned into a directory within db/), user, and password are what you would like
- Run the file in your browser
  - e.g. mysite.com/db/create-db.php
- If you see no error message, then you have been successful.
- Check the db directory to see if a database has been created (by the addition of a new directory with your database name). If it has, then all is well.
- You can now delete create-db.php if you wish (recommended for security reasons).

You are now able to connect to the data and create tables within it.

## Connect to your database

If you are using ProtoStack (rather than using PHD on its own), then the following line is already included in engine files. If you remove it, then you wont be connecting to the PHD class unless you manually connect. 
        
        include_once 'inc/includes.php';

This file 'includes' files such as inc/phd.class.php, which 'runs' the PHD engine. The inc/includes.php file also includes the inc/settings.php file which is how you connect to a database.

To connect to your database, open the inc/settings.php file and edit the following line to match the details you gave when creating the database:

    $db = new PHD('youruser', 'yourpassword', '/your/directory/structure/db/database');

## Create a new table in your database 

    $db->table('users', array(
    'name' => 'string',
    'age' => 'int',
    'email' => 'string'
     ))->create();
     
This code will create a new table named 'users' with three fields, 'name, 'age', 'email'. Notice how the age field has 'int' as the field type. Field types are 'string', 'int', 'bool', 'timestamp', and 'realtime'. More information can be found at the URL at the base of this document.This

## Get data from a table

    $users = $db->table('users')->get();
    
You can then use '$table' like any PHP array.    

    foreach($users as $key => $row) {
          # $key is the id of the row (e.g. 12)
        echo $key."> ".$row['username']."<br/>";
          # $row contains the array of each row's data (e.g. $row['password'])
    }

This code will show a list of usernames in the 'users' table like so:

  1s> James
  2s> John
  3s> Steve
  4s> Tim
  
Notice that the default 'id' of each row contains an 's' character. You can remove this if you like for display purposes by adding the following line before you 'echo' the results.

        $key = (int) str_replace('s', '', $key);

## Finding data within a table

This code will find the first/only record where the username is equal to 'James'.

      $find = $db->table('users')->find('username', 'James')->get();

This code will find up to 5 usernames that are equal to 'James'. Notice the ',5' within the command.

      $find = $db->table('users')->find('username', 'James', 5)->get();
      
Finding partial matches is not as simple as SQL, because it uses regex to search. If you know regex commands then you will be fine. Here's an example command to find all the users in a table that begin with 'Jam'. Notice how we use 999 to capture all users. You may change this number if you ever expect to find more than 999 of something.

      $find = $db->table('users')->regex('username', '/Jam.*/',999)->get();
      
To find a term in the middle of a string, use the following:

      $find = $db->table('users')->regex('username', '/.*Jam.*/',999)->get();

To just get the id field of a row, based on search criteria, use the following:

      $getid = $db->table('users')->find('username', 'James')->get('id');

To find a random row from the table, use this command.

      $random = $db->table('users')->rand()->get();
      
## Order data when getting/finding

To sort data into an order that is useful for you, use the following commands:

        $output = $db->table('users')->order('username', 'asc')->get();
        
You can also chain an order command to the end of a find command like below. This command would find all of the users that are using 'password' as their password and then order it by username. The ',999' used in the command means to match up to 999 instances of the criteria.        
        
        $output = $db->table('users')->find('password', 'password',999)->order('username', 'asc')->get();
        
To partial match when searching and ordering, use a command like the following.To

        $output = $db->table('users')->regex('username', '/Jam.*/',999)->order('username', 'asc')->get();
        
Note that unlike SQL, ordering something in reverse is not done as 'desc', but as 'dec'.

### The difference between finding full and partial matches

If you look closely, when using the find command, this is for full matches to a search - e.g. looking for people called 'James'. 

        ->find('username', 'James',999)

If, instead, you needed to find people called 'James' and 'Jamie', then you would use the regex command like this: 

        ->regex('username', '/Jam.*/',999)

## Insert data into a table

To insert a new row into a table, use the following code.

        $id = $db->table('users')->put(array(
         'username' => 'John',
         'password' => 'chickengravy',
         'email' => 'john@chickens.net'
        ));

Note: You do not have to insert data for each field with this command. If data is not inserted, it will simply be shown as null.

## Updating a row in a table

Change with find command

      $db->table('users')->find('username','James', )->change('username', 'Alan');

Change by using the id number of a row

      $db->table('users')->id('7s')->change('username', 'Alan');


## Deleting data from a table

To delete records from a table, use the following commands. Please note that you must be careful whenever using delete.

         $db->table('users')->find('username','John')->delete();
         $db->table('users')->delete();
         $row = $db->table('users')->id('8s')->delete();

## Various operations

To show the schema for a table, use the following commands:

        $schema = $db->table('users')->schema();
        print_r($schema);

Dump the contents of a table and print it so that you can use it to create another table, or for whatever reason you need

        echo '<pre>'.$db->table('users')->dump();
        
If you want to check if a table exists before you run any code, use the following:

        if($db->table('users')->exists()) {
        #do something;
        }

To get the next id then use this command - it could prove useful in some scenarios such as inserting an ID field.

        $id = $db->table('users')->getNextID();

## Getting the ID of a row when retrieving multiple rows.

To get the id of a single row is easy. You use the following command - which should always be done on a field that has a unique contents - eg the name of a product, product code, or full name of a person.

        $id = $db->table('users')->find('username', 'James')->get('id');

To get the id of row in a PHP loop can be done in the following way:

        foreach($findorder as $key => $row) {
          $key = (int) str_replace('s', '', $key); # remove the 's' character from the id of the row.
            echo  $key."> ".$row['username']." | ".$row['password']."<br/>";
        }


---------------------------------------------
PHD is written by Andrew Blalock and can be found at https://github.com/derp-all-day/PHD with further instructions at http://phd-dox.rf.gd/
<?php  

include_once '../inc/includes.php';

# Create your database here as a one time event. It is advisable to delete this file or comment out the following code once you have used it and created your database folder and structure.


#(new PHD)->setupDatabaseRoot('/path/to/where/you/want/to/store/the/data/database', 'chooseausername', 'chooseapassword');

# for example:

# this would create a database in the db directory, named 'database', with a user of root and a password of '7dStshia61'.
(new PHD)->setupDatabaseRoot(dirname(__DIR__, 1).'/db/database', 'admin', 'password');


# REMEMBER to remove the hash (#) in the line directly above the line you are reading before you run the file in your browser, so that it executes.

# To run this file in the browser, go to yoursite.com/db/create-db.php

# Now check to see if the folder structure has been created. It should look something like this:

/*

db/
   database/
           root/
                .htaccess
           .htaccess
           .owner
                 
*/

# If you see a structure like the above, you are all set. If you don't then it's probably something to do with file permissions. CHMOD 777 everything in the db folder as a test - but then revert back some permissions.

# DELETE (or comment out the new PHD line) this file once you are happy that the database has been correctly created.

?>

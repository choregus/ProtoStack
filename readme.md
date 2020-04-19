# What is ProtoStack?
By James Welch, 2020

ProtoStack is a much slimmed-down version of something akin to Laravel. It allows you to 'prototype' a new web project in double-quick time without having to re-invent the wheel each time. ProtoStack was created because I found Laravel (and similar frameworks) way too complex, cumbersome, and difficult to set up. ProtoStack suits coders that prefer a much leaner way to start on a project, or amatuer coders (like me!).

There are only a few (but powerful) elements included in the 'framework' of ProtoStack, and they are:-

- A template engine
  - this keeps PHP code away from any web page designs, so that each web page template within your site is extremely easy to design and work with.
  - a simple setup of a template file (.tpl in templates directory) and an 'engine' file (.php in engine directory) work together to create great, dynamic pages (including php arrays and variables) - very easy to code with.
- A flat file database engine
  - using the PHD flat file database engine means that ProtoStack is truly dynamic and data driven from the second that you upload the files to a directory of your choice.
  - create data driven websites and apps in minutes, literally.
- A front-end framework
  - using UIkit, ProtoStack allows you to develop fast and powerful web interfaces for sites and apps.
  
# How to Setup ProtoStack

  - Upload all of the files within the ProtoStack directory to a directory on your server that is accessible by the web (e.g. www.yoursite.com/protostack).
  - Open inc/settings.php and change the $siteroot variable to the directory on your site that you have installed ProtoStack to.
    - Also do the exact same thing in the templates/header.tpl file
  - Open index.php in the root directory of ProtoStack to view how ProtoStack 'routes' url requests to the appropriate engine/template files
    - Some example files ('example' and 'another') have been included for you to edit. 
  - That's it...unless you want a fully functioning database, too. See below, if so.
  
  MAKE SURE that the .htaccess file has been copied to the root of ProtoStack.
  
  If you are having issues at this point, it is probably related to permissions of files/folders.

## If you want to use the in-built database engine to work with data
These steps can also be found in db/howto.md
  
You will need to create a database name with user and password access for security reasons. This is done in the create-db.php file (located in the db directory).

- Open db/create-db.php
- Uncomment and edit the line that starts with '(new PHD)->setupDatabaseRoot' so that the databse name (which is turned into a directory within db/), user, and password are what you would like
- Database name can be what you like
  - eg 'soccerdb', or 'members', or 'mydatabase' - the standard is simply, 'database'.
- Run the create-db.php file in your browser
  - e.g. mysite.com/db/create-db.php
- If you see no error message, then database creation is successful.
- Check the db directory (using ftp) to see if a database has been created (by the addition of a new directory with your database name). If it has, then all is well.
- You can now delete/rename create-db.php if you wish (recommended for security reasons).

You are now able to connect to the database and create tables within it.

### Connect to your database

To connect to your database, open the inc/settings.php file and edit the following line to match the details you gave when creating the database:

    $db = new PHD('youruser', 'yourpassword', '/your/directory/structure/db/database');

You can find how to create tables, query data and so on in db/howto.md. You should now be all set!

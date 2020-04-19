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
   - Open index.php in the root directory of ProtoStack to view how ProtoStack 'routes' url requests to the appropriate engine/template files
    - Some example files ('example' and 'another') have been included for you to edit. 
  - That's it...unless you want a fully functioning database, too. See below, if so.
  
  ** MAKE SURE that the .htaccess file has been copied to the root of ProtoStack.
  
  If you are having issues at this point, it is probably related to permissions of files/folders.

## If you want to use the in-built database engine to work with data
These steps can be found in db/howto.md

## Coming Soon...

- Forms and password security for areas of the site.

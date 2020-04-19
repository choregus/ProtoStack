<?php 

# This file is a place to put any include files that you wish to use globally. 
# It makes everything cleaner by keeping them here.

# This way, the only line that is needed at the top of the index.php file is:
# include_once 'inc/includes.php';

include_once 'phd.class.php'; # you never (really) need to edit this file.
include_once 'settings.php'; # various site settings (mainly for the url, path, and database connection).
include_once 'template.class.php'; # the template engine.
include_once 'various.php'; # a file for various pieces of code and functions that don't belong anywhere else.

# add any more include files here




?>
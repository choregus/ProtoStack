<?php
# PHP code should be executed here and then assigned to the template. See the examples below.



# this if/else statement chooses whether to view /another as a page, or to view sub pages of the /another folder.

# if we are loading the actual page, rather than dynamic sub-pages
if (empty($path[1])) { 
#$path[1] simply means the first part of the URL after yoursite.com/another
# So if it is empty then load whatever the content is for the /another page.
  
# Fill up the associated template with values
# this is how you pass text/variables from this file to the template file.
$tpl->assign('title', 'Another example page');
$tpl->assign('h1', 'Another Example Page');
$tpl->assign('description', 'Change this etc.');

# This code shows how you assign a PHP variable to a template variable.
  # By putting '{this_is_home}' in the another.tpl file, the contents of $this_is_home will be shown.
$this_is_home = "<p><a href='another/cheese'>This is a dynamic page called cheese.</a></p>";
  $tpl->assign('this_is_home', $this_is_home);

      
           }
      
# if '/another' is not the page that is being visited, then do something else.
# e.g. if the URL chosen is something like yoursite.com/another/hellomom
     else {
  
  # get the name of this part of the url - yoursite.com/another/(hellomom) <- this part
  $this_pagename = $path[1];

  # You can now use the $this_pagename variable if you like
$tpl->assign('title', 'This is a dynamic page called '.$this_pagename);
$tpl->assign('h1', 'This is a dynamic page located at '.$path[0]."/".$this_pagename);
$tpl->assign('description', 'This is a dynamic page called '.$this_pagename);
  
# Try visiting yoursite.com/another/hellomom and 
# yoursite.com/another/hellopop
  
       # this is some example code to allow us to manipulate the another.tpl template file to accomodate both the /another page, and dynamically-generated pages underneath this directory
       
       # simply put something into the variable - anything will do.
       $this_is_not_home = 1;
       # assign it to the template framework. 
       $tpl->assign('this_is_not_home', $this_is_not_home);
       
       # You will notice that the above variable (this_is_not_home) within the another.tpl template is coded within an 'if' statement, so that this output will not appear on /another itself. Here is the code:
       
       # {IF:this_is_not_home}This text is only displayed on sub pages of /another.{ENDIF}
 
# Template placeholders, like the above example, that can be used are:
       
# {somethinghere} for Variables
# {IF:Condition}, {ELSE} and {ENDIF} for IF statements
# {LOOP:Loopvariable} and {ENDLOOP} for loops

# see more at https://github.com/chefe/TinyPHPHelperClasses
       
}


# Create a simple array to be used within the another.tpl template
$peoples = array();
$peoples[0] = array('name' => 'James', 'surname' => 'Welch');
$peoples[1] = array('name' => 'Ross', 'surname' => 'Green');
# Assign it to the template engine variable of the same name.
$tpl->assign('people', $peoples);



   
?>

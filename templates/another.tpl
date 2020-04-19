<h1>{h1}</h1>
<p>A page that shows how to use the template engine in more detail.</p>
  {IF:this_is_home}
<p>You can add dynamic pages 'under' /another. Click on the following link to test:</p>
{this_is_home}
  {ENDIF}
{IF:this_is_not_home}This text is only displayed on sub pages of /another.{ENDIF}

<hr/>
<p>Looping through the variable created in the engine/another.php file</p>
<ul>
  {LOOP:people}
    <li>{name} {surname}</li>
  {ENDLOOP}
</ul>
    
    
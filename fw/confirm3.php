<?php
if (isset($_POST['button']))
    {
         shell_exec('sudo ./nextion/flash_next.sh');
		 header("Location:finish.php");
 
    }
?>


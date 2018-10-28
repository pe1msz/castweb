<?php
if (isset($_POST['button']))
    {
         shell_exec('sudo ./cast/flash_cast.sh');
		 header("Location:finish.php");

    }
?>


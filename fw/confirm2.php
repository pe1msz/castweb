<?php
if (isset($_POST['button']))
    {
         shell_exec('sudo ./dvmega/flash_mega.sh');
		 header("Location:finish.php");

    }
?>


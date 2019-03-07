<?php if (isset($_POST['submit']))
    {
	        shell_exec('cd /var/www/dashboard/admin'); 
		shell_exec('sudo ./cast_update.sh');
		 header("Location:/admin/fw/finish.php");
    }
?>

<html>
<head>
<script type="text/javascript">
window.history.forward(-1);
</script>

</head>
<body>

</body>

</html>



<?php

session_start();
if(isset($_SESSION['username']))
{
    unset($_SESSION['username']);
    session_destroy(); 
   header("location:login.php");
}
else
{
    header("location:login.php");
}

?>
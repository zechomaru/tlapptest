<?php   

// Recibimos por POST los datos procedentes del formulario   
 
$email = $_POST["email"];   

// Abrimos la conexion a la base de datos   
include("conect.php");   

$conn = "INSERT INTO $newsletter (email) VALUES (" . $_POST["mail"] . ")";
if (mysql_query($conn)) {
	echo("1");
}else{
	echo("0");
}


// Cerramos la conexion a la base de datos   
mysql_close($conn); 

// Confirmamos que el registro ha sido insertado con exito   
 
?>   

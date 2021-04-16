<!-- <?php
require_once("connection.php");

$fullName = $_POST["fullname"];
$email = $_POST["email"];
$pass = $_POST["pass"];
$confirmPassword = $_POST["Confirm_pass"];

//first of all check if account already exits or not.

$query = "SELECT * FROM Register_Details WHERE email LIKE $email";
$res = mysqli_query($conn,$query);
$data = mysqli_fetch_array($res);

if ($data[1] >= $email) {
    // account exists
    echo json_encode("Account already exits");
}
else {
    //create account

    $query = "INSERT INTO Register_Details (fullname, email, pass, confirm_password, gender) VALUES ('$fullName', 
    '$email', '$pass', '$confirmPassword', null)"; 
    $res = mysqli_query($conn,$query);

    if ($res) {
        echo json_encode("true");
    }
    else {
        echo json_encode("false");
    }
}

?> -->

<?php
require_once("connection.php");

 
// Storing the received JSON in $json.
$json = file_get_contents('php://input');
 
// Decode the received JSON and store into $obj
$obj = json_decode($json,true);
 

 
// Getting name from $obj.
$fullname = $obj['fullname'];
 
// Getting email from $obj.
$email = $obj['email'];
 
// Getting phone number from $obj.
$pass = $obj['pass'];

$confirm_pass = $obj['confirm_pass'];




 
// Creating SQL query and insert the record into MySQL database table.
$Sql_Query = "insert into Register_Details (fullname,email,pass,confirm_pass) values ('$fullname','$email','$pass','$confirm_pass')";
$res = mysqli_query($conn,$Sql_Query);
 
 if($res){

 
	 // On query success it will print below message.
	$MSG = 'Data Successfully Submitted.' ;
	 
	// Converting the message into JSON format.
	$json = json_encode($MSG);
	 
	// Echo the message.
	 echo $json ;
 
 }
 else{
 
	echo 'Try Again';
 
 }
 
 
 mysqli_close($conn);
?>

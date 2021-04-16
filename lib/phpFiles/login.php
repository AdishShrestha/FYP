<?php
require_once("connection.php");

 
// Storing the received JSON in $json.
$json = file_get_contents('php://input');
 
// Decode the received JSON and store into $obj
$obj = json_decode($json,true);

// Getting email from $obj.
$email = $obj['email'];

//Getting password from $obj
$pass = $obj['pass'];

$email = mysqli_real_escape_string($conn, $email);
       //escape inverted comma query conflict from string

       $sql = "SELECT * FROM Register_Details WHERE email = '$email'";
       //building SQL query
       $res = mysqli_query($conn, $sql);
       $numrows = mysqli_num_rows($res);
       //check if there is any row
       if($numrows > 0){
           //is there is any data with that username
           $fetch = mysqli_fetch_object($res);

           if($pass == $fetch->pass){
            $msg = "correct password";
    
            $json = json_encode($msg);
        
            echo $json;
         }
         else{
            $msg = "incorrect password";
    
            $json = json_encode($msg);
        
            echo $json;
         }

        }
        else{
            $msg = "send all parameters";
    
            $json = json_encode($msg);
        
            echo $json;
        }

// $sql = "SELECT email FROM Register_Details WHERE email == $email";

// $result = mysqli_query($conn,$sql);
// //$count = mysqli_num_rows($result);

// if ($result) {
//     //if ($count == 1){
//         $msg = "account already created.";
    
//         $json = json_encode($msg);
    
//         echo $json;
//     }

//     else{
//         $msg = "account not created.";
    
//         $json = json_encode($msg);
    
//         echo $json;
//     }
//}

?>

//newwwww

<!-- <?php 


  $return["error"] = false;
  $return["message"] = "";
  $return["success"] = false;

  require_once("connection.php");

  if(isset($_POST["email"]) && isset($_POST["pass"])){
       //checking if there is POST data

       $email = $_POST["email"];
       $pass = $_POST["pass"];

       $email = mysqli_real_escape_string($conn, $email);
       //escape inverted comma query conflict from string

       $sql = "SELECT * FROM register_Details WHERE email = '$email'";
       //building SQL query
       $res = mysqli_query($conn, $sql);
       $numrows = mysqli_num_rows($res);
       //check if there is any row
       if($numrows > 0){
           //is there is any data with that username
           $obj = mysqli_fetch_object($res);
           //get row as object
           if(md5($pass) == $obj->pass){
               $return["success"] = true;
            //    $return["uid"] = $obj->user_id;
            //    $return["fullname"] = $obj->fullname;
            //    $return["address"] = $obj->address;
           }else{
               $return["error"] = true;
               $return["message"] = "Your Password is Incorrect.";
           }
       }else{
           $return["error"] = true;
           $return["message"] = 'No username found.';
       }
  }else{
      $return["error"] = true;
      $return["message"] = 'Send all parameters.';
  }

  mysqli_close($conn);

  header('Content-Type: application/json');
  // tell browser that its a json data
  echo json_encode($return);
  //converting array to JSON string
?> -->
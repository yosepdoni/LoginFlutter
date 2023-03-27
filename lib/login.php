<?php
include 'config.php';

$username = $_POST['username'];
$password = $_POST['password'];

$queryResult=$conn->query("SELECT * FROM user WHERE username='".$username."' AND password='".$password."'");
$result=array();

while($fetchData=$queryResult->fetch_assoc()){
    $result[]=$fetchData;
}

if($result){
    echo json_encode($result);
}else{
    echo json_encode('');
}
?>
<?php
session_start();
require_once('connexion_formulaire_ecole.php');
if(isset($_SESSION['user']) === false){
  header('location: index.php');
  exit;
}
if(isset($_GET['deco'])){
  unset($_SESSION['user']);
  header('location: index.php');  
  exit;
}
$id=$_GET['id'] ?? null;

if ($id === null) {
  header('location: edit.php');
  exit;
}

$req=$pdo->prepare("delete from users where id= :id");

$result = $req->execute(['id' => $id]);
$count =$req->rowCount();

if ($result === true) {
  if ($count > 0){
    header('location: edit.php');
    exit;
  
}else {
echo "Un problème est survenu, impossible de supprimer un contact qui n'existe pas";  // code...



}
}
 ?>

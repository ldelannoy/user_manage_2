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
?>
<h3>Listing élèves</h3>

    <style>
      table{
          width: 100%;
          border: 2px solid #CCC;
          
        }
      th {
        background: #0101DF;
        color: white;
        
      }
      .text-right{
        text-align: right;
        padding-right: 20px;
      }
      td,th {
        white-space: nowrap;
      }

    </style>
  <form method="POST" action=""> 
  <input type="text" name="recherche" placeholder="Recherche">
  <input type="submit" value="Rechercher">
  </form>  

  <form method="POST" action=""> 
  <input type="text" name="recherche_2" placeholder="Recherche avancée">
  <input type="submit" value="Rechercher">
  </form>  

  <div style="padding: 10px; text-align: left;" >
    <a href="page_securisee.php">Retour au formulaire</a> -
    <a href="edit.php">Listing élèves</a> -
    <a href="print.php">Impression</a>
  </div>
    <div>  
      <table>
      <tr>
        <th>ID</th>  
        <th>Prénom  </th>
        <th>Nom  </th>
        <th>Sexe  </th>
        <th>Date de naissance </th>
        <th>Nationalité </th>
        <th>Pays de naissance </th>
        <th>Ville de naissance</th>
        <th>Tel</th>
        <th>Gsm</th>
        <th>Email</th>
        <th>Rue</th>
        <th>Numéro</th>
        <th>Bte</th>
        <th>Code Postale</th>
        <th>Ville</th>
        <th>Classe</th>
        <th>Sous-Classe</th>
        <th>Option</th>
        <th>Langue 1</th>
        <th>Langue 2</th>
        <th>Langue 3</th>
        <th>Requête</th>
      </tr>
    
  

<?php
  $users=[];
  if(isset($_POST['recherche'])) {
    $request=$pdo->prepare("SELECT * FROM users as u LEFT JOIN address as a ON u.id = a.id_user LEFT JOIN 
    cursus as c ON u.id = c.id_user WHERE u.first_name like :recherche OR u.last_name like :recherche 
    or gender like :recherche OR birthday like :recherche OR nationality like :recherche 
    OR birth_country like :recherche or birth_city like :recherche or phone like :recherche 
    or mobile like :recherche or email like :recherche or street like :recherche 
    or number like :recherche or box like :recherche or postcode like :recherche 
    or city like :recherche or class like :recherche or subclass like :recherche 
    or option like :recherche or language_1 like :recherche or language_2 like :recherche 
    or language_3 like :recherche");
   $request->execute(['recherche' => '%'. $_POST['recherche'] . '%']);
       
        $resultat = $request->fetchAll() /*or die(print_r($request->errorInfo(), TRUE))*/;
  }elseif(isset($_POST['recherche_2'])){

    $request=$pdo->prepare("SELECT * FROM users as u LEFT JOIN address as a ON u.id = a.id_user LEFT JOIN 
    cursus as c ON u.id = c.id_user WHERE u.first_name = :recherche_2 OR u.last_name = :recherche_2 
    or gender = :recherche_2 OR birthday = :recherche_2 OR nationality = :recherche_2 
    OR birth_country = :recherche_2 or birth_city = :recherche_2 or phone = :recherche_2 
    or mobile = :recherche_2 or email = :recherche_2 or street = :recherche_2 
    or number = :recherche_2 or box = :recherche_2 or postcode = :recherche_2 
    or city = :recherche_2 or class = :recherche_2 or subclass = :recherche_2 
    or option = :recherche_2 or language_1 = :recherche_2 or language_2 = :recherche_2 
    or language_3 = :recherche_2");
    if (($_POST['recherche_2']) ===""){
      echo '<strong style="color: red;font-size: 20px;">Attention les résultats indiqués ne sont pas corrects car renvoient tous les élèves avec un champs vides</strong>';
    }
   $request->execute(['recherche_2' =>  $_POST['recherche_2']]);
       
        $resultat = $request->fetchAll() /*or die(print_r($request->errorInfo(), TRUE))*/;
    
      
  }else{
  $users =$pdo->query('SELECT *, a.id as id_address, u.id as id_user FROM users as u LEFT JOIN address as a 
  on u.id=a.id_user LEFT JOIN cursus as c ON u.id = c.id_user  group by u.id',PDO::FETCH_ASSOC);// code...
  
  $resultat=$users->fetchall();
  
  }
  
  foreach ($resultat as $r) {
    $r['birthday'] = preg_replace("#([0-9].*)-([0-9].*)-([0-9].*)#" ,"\\3-\\2-\\1",$r['birthday']);
    
    echo"<tr style='background: #D8D8D8'>
      <td>{$r['id_user']}</td>
      <td>{$r['first_name']}</td>
      <td>{$r['last_name']}</td>
      <td>{$r['gender']}</td>
      <td>{$r['birthday']}</td>
      <td>{$r['nationality']}</td>
      <td>{$r['birth_country']}</td>
      <td>{$r['birth_city']}</td>
      <td>{$r['phone']}</td>
      <td>{$r['mobile']}</td>
      <td>{$r['email']}</td>
      <td>{$r['street']}</td>
      <td>{$r['number']}</td>
      <td>{$r['box']}</td>
      <td>{$r['postcode']}</td>
      <td>{$r['city']}</td>
      <td>{$r['class']}</td>
      <td>{$r['subclass']}</td>
      <td>{$r['option']}</td>
      <td>{$r['language_1']}</td>
      <td>{$r['language_2']}</td>
      <td>{$r['language_3']}</td>
      <td>
      <a href='supprim.php?id=".$r['id_user']."'>Supprimer</a>|<a href='page_securisee.php?id=".$r['id_user']."'>Editer</a>
      </td>
      </tr>";
  }


  
?>
      </table>
</div>




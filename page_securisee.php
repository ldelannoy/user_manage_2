<?php
session_start();

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

<h1>Bienvenue <?=$_SESSION['user']['first_name'].' '.$_SESSION['user']['last_name'] ?> sur la page de l'identité de l'élève</h1>
<?php
require_once('connexion_formulaire_ecole.php');
require_once('function.php');
$id = $_GET['id'] ?? null;
$user=[];
  if($id){

      $request=$pdo->prepare('SELECT *, a.id as id_address FROM users as u LEFT JOIN address as a 
      on u.id=a.id_user LEFT JOIN cursus as c ON u.id = c.id_user where u.id=:id');
      

      $result=$request->execute(
        ['id' => $id]
      );
      if($result){
        $user = $request->fetch(PDO::FETCH_ASSOC);
        //echo '<pre>';
        //print_r($user);
        //exit;
      }
  }


if(isset($_POST['btnEnvoyer'], $_POST['first_name'], $_POST['last_name'], $_POST['gender'], $_POST['birthday'],$_POST['nationality'],$_POST['birth_country'],$_POST['birth_city'],$_POST['phone'],$_POST['mobile'], $_POST['email'])){


unset($_POST['btnEnvoyer']);

/*echo '<pre>';
print_r($_POST);
exit; */
$address=$_POST['address'];
$cursus=$_POST['cursus'];

$data =  ['first_name' => $_POST['first_name'],
'last_name' => $_POST['last_name'],
'gender' => $_POST['gender'],
'birthday' => $_POST['birthday'],
'nationality' => $_POST['nationality'],
'birth_country' => $_POST['birth_country'],
'birth_city' => $_POST['birth_city'],
'phone' => $_POST['phone'],
'mobile' => $_POST['mobile'],
'email' => $_POST['email']
];  

//var_dump($_GET['id']);
//exit;

# start contact
if($id){
    $request =$pdo->prepare('update users set first_name= :first_name,last_name= :last_name,gender= :gender,birthday= :birthday,nationality= :nationality,birth_country= :birth_country,birth_city= :birth_city,phone= :phone,mobile= :mobile,email= :email where id= :id');// code...
    $data['id']= $id;   
   

}else{

$request =$pdo->prepare('insert into users (first_name,last_name,gender,birthday,nationality,birth_country,birth_city,phone,mobile,email) values (:first_name,:last_name,:gender,:birthday,:nationality,:birth_country,:birth_city,:phone,:mobile,:email)');// code...
    

}

$result = $request->execute($data);
# end contact


# start address
if($result===true){

    if(count($user)===0){
        $idUser = $pdo->lastInsertId();
        $address['id_user']=$idUser;
        $request2 =$pdo->prepare('insert into address (street,number,box,postcode,city,id_user) values (:street, :number, :box, :postcode, :city, :id_user)');// code...

    }else{
        $address['id_address']=$user['id_address'];
        $request2 =$pdo->prepare('update  address set street= :street,number= :number,box= :box,postcode= :postcode,city= :city where id= :id_address');// code...

    }
    $result2 = $request2->execute($address);
    
}

# end address


#start cursus
if($result===true && $result2===true){

    if(count($user)===0){
        $cursus['id_user']=$idUser;
        $request3 =$pdo->prepare('insert into cursus (class,subclass,option,language_1,language_2,language_3,id_user) values (:class, :subclass, :option, :language_1, :language_2, :language_3, :id_user)');// code...

    }else{
        $cursus['id_user']=$id;
        $request3 =$pdo->prepare('update cursus set class= :class, subclass = :subclass, option= :option, language_1 = :language_1, language_2 = :language_2,language_3 = :language_3 where id_user = :id_user');// code...
       
        

    }
    
    $result3 = $request3->execute($cursus) or die(print_r($request3->errorInfo(), TRUE));
    //echo '<pre>';
    //var_dump($request3->errorInfo());
    //exit;
}

#end cursus

if($result === true && $result2===true && $result3===true){
    header('location: edit.php');
}
}   
/*echo '<pre>';
print_r($_POST);
exit;*/


 /*$request =$pdo->query('select id,pays_fr from pays',PDO::FETCH_ASSOC);// code...

$result = $request->fetchall();*/




// on alimente la variable countries si le resultat ne nous renvoie pas false
// c'est que la requête s'est bien passée donc on retourne le resultat sinon un
// tableau vide

$countries=getPays($pdo);
//pour la nationalité

/*$request =$pdo->query('select id,abbreviation_2 from pays',PDO::FETCH_ASSOC);// code...

$result = $request->fetchall();




// on alimente la variable countries si le resultat ne nous renvoie pas false
// c'est que la requête s'est bien passée donc on retourne le resultat sinon un
// tableau vide
$nation = $result !== false ? $result : [];*/

$nation = getNationality($pdo);  
$gender = [
    ['genre'=>'M','libelle'=>'M'],
    ['genre'=>'F','libelle'=>'F']
];             
?>
<h2><b>Veuillez remplir le formulaire et valider les données</b></h2>
<div>
<form action="" method="POST" style=" margin: 1; padding: 10px">
    <fieldset>
        <legend>Elève</legend>
    <div style="margin-bottom: 10px;">    
        <label for="first_name" >Prénom :  </label>
        <input type="text" id="first_name" name="first_name" required="required" value="<?= $user['first_name'] ?? '' ?>">
    </div>
    <div style="margin-bottom: 10px;">    
        <label for="last_name" >Nom :  </label>
        <input type="text" id="last_name" name="last_name" required="required" value="<?= $user['last_name'] ?? '' ?>">
    </div>
        <div style="margin-bottom: 10px;">    
        <label for="gender" >Sexe :  </label>
    <select name="gender" required>
        <option value="">faites un choix</option>
        <?php foreach($gender as $g) : ?>

        <option value="<?= $g['genre']; ?> " <?= isset($user['gender']) && $user['gender'] === $g['genre'] ? 'selected' : '' ?>> 
            <?= $g['libelle']; ?>
    
    </option>
        <?php endforeach ?>
           
    </select>
    <!--<div style="margin-bottom: 10px;">    
        <label for="gender" >Sexe :  </label> 
        <input type="text" size="5px" id="gender" name="gender" required="required" value="<?= $user['gender'] ?? '' ?>">-->
    </div>
    <div style="margin-bottom: 10px;">    
        <label for="birthday" >Birthday :  </label>
        <input type="date" id="birthday" max="<?= date('Y-m-d')?>" name="birthday" required="required" value="<?= $user['birthday'] ?? '' ?>">
    </div>
    <div style="margin-bottom: 10px;">    
        <label for="nationality" >Nationalité :  </label>

        <select name="nationality" required>
        <option value="">faites un choix</option>    
        <!--
        en bouclant sur option on crée autant de ligne qu'il ya de pays dans notre
        liste deroulante
        value => sera la valeur envoyée dans le post
        >XXXX</option> => XXXX le nom visible dans la liste deroulante de chaque pays
        -->
        <?php foreach($nation as $natio): ?>
            
            <option value="<?= $natio['abbreviation_2'] ?>"  <?= isset($user['nationality']) && $user['nationality'] === $natio['abbreviation_2'] ? 'selected' : '' ?>>
            
            
            <?= $natio['abbreviation_2'] ?>
          </option>
        <?php endforeach ?>
     </select>
    </div>
    <div style="margin-bottom: 10px;">  
      
        <label for="birth_country" >Pays de naissance :  </label>
        
     <select name="birth_country" required>
        <option value="">faites un choix</option> 
        <!--
        en bouclant sur option on crée autant de ligne qu'il ya de pays dans notre
        liste deroulante
        value => sera la valeur envoyée dans le post
        >XXXX</option> => XXXX le nom visible dans la liste deroulante de chaque pays
        -->
        <?php foreach($countries as $country): ?>
            <option value="<?= $country['pays_fr'] ?>"  <?= isset($user['birth_country']) && $user['birth_country'] === $country['pays_fr'] ? 'selected' : '' ?>>
            <?= $country['pays_fr'] ?>
          </option>
        <?php endforeach ?>
     </select>
  
    </div>
    <div style="margin-bottom: 10px;">    
        <label for="birth_city" >Ville de naissance :  </label>
        <input type="text" id="birth_city" name="birth_city" required="required" value="<?= $user['birth_city'] ?? '' ?>">
    </div>
    <div style="margin-bottom: 10px;">
        <label for="phone" >Tel :  </label>
        <input type="text" id="phone" name="phone" required="required" value="<?= $user['phone'] ?? '' ?>">
    </div>
    <div style="margin-bottom: 10px;">    
        <label for="mobile" >GSM :  </label>
        <input type="text" id="mobile" name="mobile" required="required" value="<?= $user['mobile'] ?? '' ?>">
    </div>
    <div style="margin-bottom: 10px;">    
        <label for="email" >Email :  </label>
        <input type="email" id="email" name="email" required="required" value="<?= $user['email'] ?? '' ?>">
    </div>
    
    </fieldset>
    
    <fieldset>
        <legend>Adresse</legend>
    <div style="margin-bottom: 10px;">    
        <label for="street" >Rue :  </label>
        <input type="text" id="street" name="address[street]" required="required" value="<?= $user['street'] ?? '' ?>">
    </div>
    <div style="margin-bottom: 10px;">    
        <label for="number" >N° :  </label>
        <input type="int" id="number" name="address[number]" required="required" value="<?= $user['number'] ?? '' ?>">
    </div>
    <div style="margin-bottom: 10px;">    
        <label for="box" >Bte :  </label>
        <input type="text" id="box" name="address[box]" value="<?= $user['box'] ?? '' ?>">
    </div>
    <div style="margin-bottom: 10px;">    
        <label for="postcode" >CP :  </label>
        <input type="text" id="postcode" name="address[postcode]" required="required" value="<?= $user['postcode'] ?? '' ?>">
    </div>
    <div style="margin-bottom: 10px;">    
        <label for="city" >Ville :  </label>
        <input type="text" id="city" name="address[city]" required="required" value="<?= $user['city'] ?? '' ?>">
    </div>

    
    </fieldset>

    <fieldset>
        <legend>Cours</legend>
    <div style="margin-bottom: 10px;">    
        <label for="class" >Classe :  </label>
        <input type="text" id="class" name="cursus[class]" required="required" value="<?= $user['class'] ?? '' ?>">
    </div>
    <div style="margin-bottom: 10px;">    
        <label for="subclass" >sous-classe :  </label>
        <input type="text" id="subclass" name="cursus[subclass]" value="<?= $user['subclass'] ?? '' ?>">
    </div>
    <div style="margin-bottom: 10px;">    
        <label for="option" >option :  </label>
        <input type="text" id="option" name="cursus[option]" value="<?= $user['option'] ?? '' ?>">
    </div>
    <div style="margin-bottom: 10px;">    
        <label for="language_1" >Langue 1 :  </label>
        <input type="text" id="language_1" name="cursus[language_1]" value="<?= $user['language_1'] ?? '' ?>">
    </div>
    <div style="margin-bottom: 10px;">    
        <label for="language_2" >langue 2 :  </label>
        <input type="text" id="language_2" name="cursus[language_2]" value="<?= $user['language_2'] ?? '' ?>">
    </div>
    <div style="margin-bottom: 10px;">    
        <label for="language_3" >Langue 3 :  </label>
        <input type="text" id="language_3" name="cursus[language_3]" value="<?= $user['language_3'] ?? '' ?>">
    </div>
        
    </fieldset>

    <div style="text-align: right;margin: 1; padding: 10px">
        <input type="submit" name="btnEnvoyer" value="Valider">
    </div>
 
</form>
</div>
<div style="padding: 10px">
<a href="?deco=true">Déconnexion</a>
<a href="edit.php">Listing élèves</a>
</div>




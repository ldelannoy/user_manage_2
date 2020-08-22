<?php

use Spipu\Html2Pdf\Html2Pdf;

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
ob_start()
?>
<!--<page>-->
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
  
  <div style="padding: 10px; text-align: left;" >
    <a href="page_securisee.php">Retour au formulaire</a>
    <a href="edit.php">Listing élèves</a>
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
        
      </tr>
    
  

<?php
  $users=[];
  
  $users =$pdo->query('SELECT *, a.id as id_address, u.id as id_user FROM users as u LEFT JOIN address as a 
  on u.id=a.id_user LEFT JOIN cursus as c ON u.id = c.id_user  group by u.id',PDO::FETCH_ASSOC);// code...
  
  $resultat=$users->fetchall();
  
  
  
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
      
      </tr>";
  }


  
?>
      </table>
<!--</page>-->
</div>

<?php
/*$content = ob_get_clean();

require_once('html2pdf/src/Html2Pdf.php');

  $pdf = new Html2Pdf('L','A4','fr','true','UTF-8');
  $pdf->writeHTML($content);
  $pdf->Output('liste.pdf');*/
?>


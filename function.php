<?php
function getPays($connexionBDD){
    
    $request =$connexionBDD->query('select id,pays_fr from pays',PDO::FETCH_ASSOC);// code...

    $result = $request->fetchall();
    return $result !== false ? $result : [];
    
}

function getNationality($connexionBDD2){
    $request =$connexionBDD2->query('select id,abbreviation_2 from pays',PDO::FETCH_ASSOC);// code...

    $result = $request->fetchall();
    return $result !== false ? $result : [];


}
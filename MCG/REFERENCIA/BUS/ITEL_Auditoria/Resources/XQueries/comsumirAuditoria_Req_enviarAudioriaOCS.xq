xquery version "1.0" encoding "Cp1252";
(:: pragma  type="xs:anyType" ::)

declare namespace xf = "http://tempuri.org/ITEL_Auditoria/Resources/XQueries/comsumirAuditoria_Req_enviarAudioriaOCS/";

declare function xf:calcularSaldo($valorRecarga as xs:string)
 {
     data(xs:decimal($valorRecarga) - 627)
};

declare function xf:trama401($tramaIN as xs:string)
   as xs:string  {
   let $params := fn:tokenize($tramaIN, '!')
   let $paramsTrama := fn:tokenize($params[5], ';')
   return
    concat($params[1],"!",$params[2],"!","400","!",$params[4],"!",$paramsTrama[2],";",$paramsTrama[3],";",$paramsTrama[4],";",$paramsTrama[5],";",$paramsTrama[6],";",$paramsTrama[7],"!*")
    
   (: <usuario>!<clave>!401!3131234567!3134567890;RecargaMayorista;9103;80001212503;5000;0;20!* :)
   (: <usuario>!<clave>!400!3131234567!RecargaMayorista;9103;80001212503;5000;1[;10]!* :)
   
};  

declare function xf:trama402($tramaIN as xs:string)
   as xs:string  {
   let $params := fn:tokenize($tramaIN, '!')
   let $paramsTrama := fn:tokenize($params[5], ';')
   return
    concat($params[1],"!",$params[2],"!","400","!",$params[4],"!",$paramsTrama[2],";",$paramsTrama[3],";",$paramsTrama[4],";",xf:calcularSaldo($paramsTrama[5]),";","0",";","7","!*")
    
   (: <usuario>!<clave>!402!3131234567!3134567890;PasatiempoPrePre;9103;80001212503;5000!* :)
   (: <usuario>!<clave>!400!3131234567!RecargaMayorista;9103;80001212503;5000;1[;10]!* :)
   
};

declare function xf:comsumirAuditoria_Req_enviarAudioriaOCS($tramaIN as xs:string, $metodoIN as xs:string)
    as element(*) {  
        let $params := fn:tokenize($tramaIN, ';')  
        return    
        <TRAMA_IN>{
         if ($metodoIN = '401') then 
            xf:trama401($tramaIN)
            else if ($metodoIN = '402') then
                   xf:trama402($tramaIN)
                 else 
                  $tramaIN
        }</TRAMA_IN>
};

declare variable $tramaIN  as xs:string external;
declare variable $metodoIN as xs:string external;

xf:comsumirAuditoria_Req_enviarAudioriaOCS($tramaIN, $metodoIN)
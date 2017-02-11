xquery version "1.0" encoding "Cp1252";

(:: pragma bea:global-element-parameter parameter="$wS_Result" element="ns4:WS_Result" location="../Schemas/PS_ITEL_EJECUTARREGLASNEGOCIO.xsd" ::)

declare namespace xf = "http://tempuri.org/ITEL/Core/Resources/XQueries/adaptarParametrosSalidaTrama212OCS/";
declare namespace ns0 = "http://webapps.online.ericsson.com";
declare namespace ns2 = "http://www.comcel.com.co/OCS/OperacionCorbaOCS";
declare namespace ns1 = "http://www.comcel.com.co/IN/OperacionCorba";
declare namespace ns4 = "http://www.comcel.com.co/EjecutarReglasNegocio/";
declare namespace ns3 = "http://www.comcel.com.co/OCS/OperacionOCS_AIR";


declare function xf:expiryDateFormatter($expiryDate as xs:string) as xs:string{	
    if ($expiryDate = "99991231T12:00:00+0000") then     
     concat(fn-bea:dateTime-to-string-with-format("yyyy-MM-dd", fn-bea:dateTime-from-string-with-format("yyyyMMdd'T'HH:mm:ss+SSSS", "19700101T23:59:59+0000")), " 23:59:59")
    else     
	 concat(fn-bea:dateTime-to-string-with-format("yyyy-MM-dd", fn-bea:dateTime-from-string-with-format("yyyyMMdd'T'HH:mm:ss+SSSS", $expiryDate)), " 23:59:59")
};

declare function xf:starDateFormatter($starDate as xs:string) as xs:string{	
    if ($starDate = "00000101T12:00:00+0000") then     
     concat(fn-bea:dateTime-to-string-with-format("yyyy-MM-dd", fn-bea:dateTime-from-string-with-format("yyyyMMdd'T'HH:mm:ss+SSSS", "19700101T23:59:59+0000")), " 23:59:59")
    else     
	 concat(fn-bea:dateTime-to-string-with-format("yyyy-MM-dd", fn-bea:dateTime-from-string-with-format("yyyyMMdd'T'HH:mm:ss+SSSS", $starDate)), " 23:59:59")
};

declare function xf:expiryDateFormatterDat($expiryDate as xs:string) as xs:string{	
    if ($expiryDate = "99991231T12:00:00+0000") then     
     concat(fn-bea:dateTime-to-string-with-format("yyyy-MM-dd", fn-bea:dateTime-from-string-with-format("yyyyMMdd'T'HH:mm:ss-SSSS", "19700101T23:59:59+0000")), " 23:59:59")
    else     
	 concat(fn-bea:dateTime-to-string-with-format("yyyy-MM-dd", fn-bea:dateTime-from-string-with-format("yyyyMMdd'T'HH:mm:ss-SSSS", $expiryDate)), " 23:59:59")
};



declare function xf:nombrePaquete($cuentasDA as xs:string, $dedicatedAccounts as element(*), $ofertas as element(*)) as xs:string{	
    let $cuentasSplit := fn:tokenize($cuentasDA, "\|")
    let $cuenta       := concat(for $nombre in $cuentasSplit 
                                    let $offerDA  := fn:tokenize($nombre,";")[3] (:offer cuentas DA:)
                                    let $cuentaDA := fn:tokenize($nombre,";")[2] (:cuentas DA:)                                        
	                                let $dedicatedAccountsName := $dedicatedAccounts/Name (:DA Air:)
	                                  return
	                                   if ($dedicatedAccountsName = $cuentaDA ) then 	                                     
	                                      $offerDA
	                                   else('')                                           
                                  ,'')
                                  
     let $offer := if (($cuenta!='')) then    
                      $cuenta                           
                      else (concat(for $nombre1 in $cuentasSplit 
                                    let $offerDA1  := fn:tokenize($nombre1,";")[3] (:offer cuentas DA:)                                    
                                    let $cuentaDA1 := fn:tokenize($nombre1,";")[2] (:cuentas DA:)       
                                    let $cuentaNo := if ($offerDA1='') then ($cuentaDA1) else ($offerDA1)    (:Si el campo offer es vacio en la DB:)                            
	                                let $dedicatedAccountsName1 := $dedicatedAccounts/Name
	                                  return
	                                   if ($dedicatedAccountsName1 = $cuentaDA1 ) then 	                                    
	                                     $cuentaNo
	                                   else() )  )                 
	                                   
	let $retorna := if (($offer!='')) then $offer else $dedicatedAccounts/Name      
    return   $retorna
};

declare function xf:tipoPaquete($cuentasDA as xs:string, $dedicatedAccounts as element(*)) as xs:string{	
    let $cuentasSplit := fn:tokenize($cuentasDA, "\|")
    let $cuenta       := concat(for $nombre in $cuentasSplit 
                                    let $offerDA  := fn:tokenize($nombre,";")[3] (:offer cuentas DA:)
                                    let $cuentaDA := fn:tokenize($nombre,";")[2] (:cuentas DA:) 
                                    let $tipoDA := fn:tokenize($nombre,";")[1] (:Tipo DB DA:)                                       
	                                let $dedicatedAccountsName := $dedicatedAccounts/Name (:DA Air:)
	                                  return
	                                   if ($dedicatedAccountsName = $cuentaDA ) then 	                                     
	                                      xf:clasificacionPaquete($tipoDA)
	                                   else('')                                           
                                  ,'')                
	                                   
	let $retorna := $cuenta   
    return   $retorna
};

declare function xf:clasificacionPaquete($tipoDA as xs:string) as xs:string{	
	if ($tipoDA = "DATOS") then
		"DATOS"
	else if ($tipoDA = "OFFPEAK") then	 
		"MIN"		
	else if ($tipoDA = "MINUTES4" or $tipoDA = "MINUTES3" or $tipoDA = "MINUTES2") then	 
		"LDI"	
	else if ($tipoDA = "BONUS" or $tipoDA = "MONETARY2") then	 
		"BONOS"
	else if ($tipoDA = "FREESMS" ) then	 
		"SMS"	
	else if ($tipoDA = "CONTROL" ) then	
		"CONTROL"
	else
       ""	 
};

declare function xf:nombrePaqueteDatos($cuentasDA as xs:string, $dedicatedAccounts as element(*)) as xs:string{	
    let $cuentasSplit := fn:tokenize($cuentasDA, "\|")
    let $cuenta       := concat(for $nombre in $cuentasSplit 
                                    let $offerDA  := fn:tokenize($nombre,";")[3] (:offer cuentas DA:)
                                    let $cuentaDA := fn:tokenize($nombre,";")[2] (:cuentas DA:)                                        
	                                let $dedicatedAccountsName := $dedicatedAccounts/offerID (:DA Air:)
	                                  return
	                                   if ($dedicatedAccountsName = $cuentaDA ) then 	                                     
	                                      $offerDA
	                                   else('')                                           
                                  ,'')          
	                                   
	let $retorna := if (($cuenta!='')) then $cuenta else $dedicatedAccounts/offerID      
    return   $retorna
};


declare function xf:consumo($consumosAir as element(*), $dedicatedAccounts as element(*)) as xs:string{	
    let $dedicatedAccountsName := $dedicatedAccounts/Name (:DA Air:)
    let $consumo := concat(for $detalle in $consumosAir/usageCounterUsageThresholdInformation
                         let $usageCounterID   := $detalle/usageCounterID
                         let $usageCounterValue:= $detalle/usageCounterValue
                         return 
                           if ($dedicatedAccountsName=$usageCounterID) then
                             $usageCounterValue
                           else ('')
                           ,'')
     return if ($consumo='') then ("0")else($consumo)  
};

declare function xf:consumoDatos($consumosAir as element(*), $dedicatedAccounts as element(*)) as xs:string{	
    let $dedicatedAccountsName := $dedicatedAccounts/offerID (:DA Air:)
    let $consumo := concat(for $detalle in $consumosAir/usageCounterUsageThresholdInformation
                         let $usageCounterID   := $detalle/usageCounterID
                         let $usageCounterValue:= $detalle/usageCounterValue
                         return 
                           if ($dedicatedAccountsName=$usageCounterID) then
                            round-half-to-even( $usageCounterValue div 1048576, 1)
                           else ('')
                           ,'')
     let $retorna := if ($consumo='') then ("0.0 MB")else(concat($consumo," MB"))
     return $retorna 
};

declare function xf:capacidadDatos($productosSM as element(*), $dedicatedAccounts as element(*)) as xs:string{	 

     let $offerID := $dedicatedAccounts/offerID (:DA Air:)  
     let $productos := for $producto in $productosSM/products where data($producto/extendedAttributes[name='offerID']/value) = $offerID                 
				                 return $producto
				                 
	 let $productoID := 	fn:min($productos/id)        
	 let $capacidad  := for $producto in $productos where  $producto/id = $productoID return      
	                         round-half-to-even(data($producto/extendedAttributes[name='serviceUsage1']/value) div 1048576,0)   
				                 
	 return if(exists($capacidad)) then concat($capacidad," MB") else ""	 

};

declare function xf:codigoSM($productosSM as element(*), $dedicatedAccounts as element(*)) as xs:string{	
    let $offerID := $dedicatedAccounts/offerID (:DA Air:)  
    let $productos := for $producto in $productosSM/products where data($producto/extendedAttributes[name='offerID']/value) = $offerID                 
				                 return xs:integer($producto/id)
				                 				                      
	let $productoID := 	fn:min($productos)   
    return fn:string($productoID)
};

declare function xf:adaptarParametrosSalidaTrama212OCS($cuentasDA as xs:string, 
    $wS_Result as element(ns4:WS_Result))
    as xs:string {
    
    let $cuentas := fn:tokenize($cuentasDA, "\|")
    
    let $cuentasAir:=  $wS_Result//MENSAJE/SUSCRIPTOR_OCS/BALANCES/DedicatedAccounts
    let $ofertas   :=  $wS_Result//MENSAJE/SUSCRIPTOR_OCS/DATOS_SUSCRIPCION
    let $consumosAir:= $wS_Result//MENSAJE/PARAMETROS_REGLAS//CONSULTAR_UCyUT/usageCounterUsageThresholdInformation
    let $cuentaDedicatedAccounts    := fn:string-join(for $dato in $cuentasAir/Detail 
                        for $c in $cuentas                        
                        let $id := fn:tokenize($c,";")[2] (:cuentas DA:) 
                        return
                        if ($id=$dato/Name) then 
                        (
                          fn:concat(xf:tipoPaquete($cuentasDA, $dato),";",data($dato/Name),";",xf:nombrePaquete($cuentasDA, $dato, $ofertas),";",data($dato/Balance),";",xf:consumo($consumosAir,$dato),";",xf:expiryDateFormatter($dato/ExpiryDate),";",xf:starDateFormatter($dato/StartDate))
                        )else(
                        )	                     
	                      ,";")       
    
    let $cuentasAirDatos:=  $wS_Result//MENSAJE/SUSCRIPTOR_OCS/BALANCES/OfferInformationList   
    let $productosSM:= $wS_Result//MENSAJE/PARAMETROS_REGLAS//*:SubscriptionManagerResponse/resultado/productList
    let $cuentaOfferInformationList    := fn:string-join(for $dato in $cuentasAirDatos/Detail
	                    for $c in $cuentas                        
                        let $id := fn:tokenize($c,";")[2] (:cuentas DA:) 
                        return
                        if ($id=$dato/offerID) then 
                        (
                          fn:concat("DATOS",";",xf:codigoSM($productosSM, $dato),";",xf:nombrePaqueteDatos($cuentasDA, $dato),";",xf:capacidadDatos($productosSM, $dato),";",xf:consumoDatos($consumosAir,$dato),";",xf:expiryDateFormatterDat($dato/expiryDate),";",xf:expiryDateFormatterDat($dato/startDate))
                        )else(
                        )	      
	                       
	                      ,";")     
        
        return 
           if ($cuentaDedicatedAccounts="" and $cuentaOfferInformationList="") then	      
                 ""
                 else
                   if ($cuentaDedicatedAccounts!="" and $cuentaOfferInformationList!="") then 
                       fn:concat($cuentaDedicatedAccounts,";",$cuentaOfferInformationList)
                     else 
                       if ($cuentaDedicatedAccounts="" and $cuentaOfferInformationList!="")then
                         $cuentaOfferInformationList
                        else           
                          if ($cuentaDedicatedAccounts!="" and $cuentaOfferInformationList="")then
                            $cuentaDedicatedAccounts
                          else      
                           ""
};

declare variable $cuentasDA as xs:string external; (:Itel_Cuentas_OCS:) 

declare variable $wS_Result as element(ns4:WS_Result) external;

xf:adaptarParametrosSalidaTrama212OCS($cuentasDA,   $wS_Result)
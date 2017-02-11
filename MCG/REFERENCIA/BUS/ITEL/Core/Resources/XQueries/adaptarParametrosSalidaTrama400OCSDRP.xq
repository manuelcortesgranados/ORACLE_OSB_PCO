declare namespace xf = "http://tempuri.org/ITEL/Core/Resources/XQueries/adaptarParametrosSalidaTrama400OCSDRP/";
declare namespace functx = "http://www.functx.com"; 

declare function xf:expiryDateFormatter($expiryDate as xs:string) as xs:string{	
	concat(fn-bea:dateTime-to-string-with-format("yyyy-MM-dd", fn-bea:dateTime-from-string-with-format("yyyyMMdd'T'HH:mm:ss+SSSS", $expiryDate)), " 23:59:59")
};

declare function xf:expiryDateFormatter2($expiryDate as xs:string) as xs:string{	
	concat( substring($expiryDate, 1, 10), " 23:59:59")
};


declare function xf:calculaExpiryDate($dias as xs:string) as xs:string{	

  if ($dias = "") then( 
    let $fechaActual     := current-date()	
	let $duracion        := xdt:dayTimeDuration(concat("P", 0, "D"))
	let $fechaExpiracion := $fechaActual + $duracion
	return xf:expiryDateFormatter2(xs:string($fechaExpiracion))
	) 
  else (
    let $fechaActual     := current-date()	
	let $duracion        := xdt:dayTimeDuration(concat("P", $dias, "D"))
	let $fechaExpiracion := $fechaActual + $duracion
	return xf:expiryDateFormatter2(xs:string($fechaExpiracion))
 )
};

declare function xf:adaptarParametrosSalidaTrama400OCSDRP($monto as xs:string,
    $montoBonos as xs:string,
    $diasVigencia as xs:string,
    $contrato as xs:string)
    as xs:string {
        let $onPeakAccountID          := data("0")
        let $onPeakAccountExpiryDate  := data("")
        
        return        	
        	concat(if ($monto = "") then "0" else $monto, ";"
	        	, if ($montoBonos = "") then "0" else $montoBonos, ";"
	        	, if ($diasVigencia = "") then "0" else $diasVigencia
	        	, ";"
	        	(: OnPeakAccountID :)
	        	, if ($monto = "") then "0" else $monto
	        	, ";"
	        	, xf:calculaExpiryDate($diasVigencia)
	        	, ";",        	
	           (:OFFPEAK ACCOUNT:)
			   "0",
			   ";",
			   "1970-01-01 23:59:59",
			   ";",
			   (:FREESMS ACCOUNT:)
			   "0",
			   ";",
			   "1970-01-01 23:59:59",
			   ";",
			   (:BONUS ACCOUNT:)
			    if ($montoBonos = "") then "0" else $montoBonos,
			   ";",
			    xf:calculaExpiryDate($diasVigencia),
			   ";",
			   (:MINUTES2 ACCOUNT:)
			   "0",
			   ";",
			   "1970-01-01 23:59:59",
			   ";",
			   (:MINUTES3 ACCOUNT:)
			   "0",
			   ";",
			   "1970-01-01 23:59:59",
			   ";",
			   (:MINUTES4 ACCOUNT:)
			   "0",
			   ";",
			   "1970-01-01 23:59:59",
			   ";",
			   (:MONETARY2 ACCOUNT:)
			   "0",
			   ";",
			   "1970-01-01 23:59:59",
			   ";",
			   (: MonetaryAccountID3 :)        		   
			   "0",
			   ";",
			   "1970-01-01 23:59:59",
			   ";", 
			      $contrato
        	)
};

declare variable $monto as xs:string external;
declare variable $montoBonos as xs:string external;
declare variable $diasVigencia as xs:string external;
declare variable $contrato as xs:string external;

xf:adaptarParametrosSalidaTrama400OCSDRP($monto,
    $montoBonos,
    $diasVigencia,
    $contrato)
(:: pragma bea:global-element-parameter parameter="$reglasNegocioResponse" element="ns2:WS_Result" location="../Schemas/PS_ITEL_EJECUTARREGLASNEGOCIO.xsd" ::)
declare namespace xf = "http://tempuri.org/ITEL/Core/Resources/XQueries/adaptarParametrosSalidaTrama400/";
declare namespace ns2 = "http://www.comcel.com.co/EjecutarReglasNegocio/";


declare function xf:expiryDateFormatter($expiryDate as xs:string) as xs:string{	
	concat( substring($expiryDate, 1, 10), " 23:59:59")
};

declare function xf:expirationDate($fechaString as xs:string, $diasVigencia as xs:decimal)
    as xs:string {
    	let $fechaActual := current-date()
    	let $fechaOnPeak := xs:date(substring($fechaString, 1, 10))
    	let $duracion := xdt:dayTimeDuration(concat("P", $diasVigencia, "D"))
    	let $fechaExpiracionTemp := $fechaActual + $duracion
    	let $fechaExpiracion := if(fn:days-from-duration($fechaExpiracionTemp - $fechaOnPeak) > 0 ) then $fechaExpiracionTemp else $fechaOnPeak
    	return xf:expiryDateFormatter(xs:string($fechaExpiracion))
};

declare function xf:adaptarParametrosSalidaTrama400($reglasNegocioResponse as element(ns2:WS_Result))
    as xs:string {
    	let $suscriptorDestino := $reglasNegocioResponse/MENSAJE/SUSCRIPTOR_DESTINO,
    		$parametrosReglas :=  $reglasNegocioResponse/MENSAJE/PARAMETROS_REGLAS,
    		$montoRecarga := if (data($parametrosReglas/PARAMETRO[NOMBRE="MONTOONPEAK"]/VALOR) = "") then 0 else xs:integer(data($parametrosReglas/PARAMETRO[NOMBRE="MONTOONPEAK"]/VALOR)),
    		$montoBonos := if (data($parametrosReglas/PARAMETRO[NOMBRE="MONTOBONOS"]/VALOR) = "") then 0 else xs:integer(data($parametrosReglas/PARAMETRO[NOMBRE="MONTOBONOS"]/VALOR)),
    		$vigencia := if (data($parametrosReglas/PARAMETRO[NOMBRE="VIGENCIAONPEAK"]/VALOR) = "") then 0 else data($parametrosReglas/PARAMETRO[NOMBRE="VIGENCIAONPEAK"]/VALOR)
    	return
        concat($montoRecarga
        	, ";"
        	, $montoBonos
        	, ";"
        	, $vigencia
        	, ";"
        	(: OnPeakAccountID :)
        	, xs:integer(data($suscriptorDestino/*:OnPeakAccountID/*:Balance) + $montoRecarga)
        	, ";"
        	, xf:expirationDate(data($suscriptorDestino/*:OnPeakAccountID/*:ExpiryDate), $vigencia)
        	, ";"
        	
        	(: OffPeakAccountID :)
        	, xs:integer(data($suscriptorDestino/*:OffPeakAccountID/*:Balance) + data($parametrosReglas/PARAMETRO[NOMBRE='MONTOMIN']/VALOR) ) 
        	, ";"
        	, xf:expirationDate(data($suscriptorDestino/*:OffPeakAccountID/*:ExpiryDate), if(data($parametrosReglas/PARAMETRO[NOMBRE='VIGENCIAMIN']/VALOR) = "" ) then 0 else data($parametrosReglas/PARAMETRO[NOMBRE='VIGENCIAMIN']/VALOR)   ) 
        	, ";"
        	
        	(: FreeSMSAccountID :)
        	, data($suscriptorDestino/*:FreeSMSAccountID/*:Balance) 
        	, ";"
        	,data($suscriptorDestino/*:FreeSMSAccountID/*:ExpiryDate) 
        	, ";"
        	
        	(: BonusAccountID :)
        	, xs:integer(data($suscriptorDestino/*:BonusAccountID/*:Balance) + $montoBonos)
        	, ";"
        	, xf:expirationDate(data($suscriptorDestino/*:BonusAccountID/*:ExpiryDate), if(data($parametrosReglas/PARAMETRO[NOMBRE='VIGENCIABONOS']/VALOR) = "" ) then 0 else data($parametrosReglas/PARAMETRO[NOMBRE='VIGENCIABONOS']/VALOR))
        	, ";"
        	
        	(: MinutesAccountID2 :)
        	, data($suscriptorDestino/*:MinutesAccountID2/*:Balance) 
        	, ";"
        	,data($suscriptorDestino/*:MinutesAccountID2/*:ExpiryDate) 
        	, ";"
        	
        	(: MinutesAccountID3 :)
        	, data($suscriptorDestino/*:MinutesAccountID3/*:Balance) 
        	, ";"
        	,data($suscriptorDestino/*:MinutesAccountID3/*:ExpiryDate) 
        	, ";"
        	
        	(: MinutesAccountID4 :)
        	, data($suscriptorDestino/*:MinutesAccountID4/*:Balance) 
        	, ";"
        	,data($suscriptorDestino/*:MinutesAccountID4/*:ExpiryDate) 
        	, ";"
        	
        	(: MonetaryAccountID2 :)
        	, data($suscriptorDestino/*:MonetaryAccountID2/*:Balance) 
        	, ";"
        	,data($suscriptorDestino/*:MonetaryAccountID2/*:ExpiryDate) 
        	, ";"
        	
        	(: MonetaryAccountID3 :)
        	, data($suscriptorDestino/*:MonetaryAccountID3/*:Balance) 
        	, ";"
        	,data($suscriptorDestino/*:MonetaryAccountID3/*:ExpiryDate) 
        	, ";"
        	
        	,data($suscriptorDestino/*:Contract) 
        	)
        	
        	
        	
};

declare variable $reglasNegocioResponse as element(ns2:WS_Result) external;

xf:adaptarParametrosSalidaTrama400($reglasNegocioResponse)
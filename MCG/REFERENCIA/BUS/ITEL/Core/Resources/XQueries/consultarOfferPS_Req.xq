(:: pragma bea:global-element-return element="ns0:Input_Parameters" location="../../../OCS/AIR/Resources/Schemas/PS_ITEL_CONSULTAR_OFFER.xsd" ::)

declare namespace ns0 = "http://www.comcel.com.co/ConsultarOfferOCS/";
declare namespace xf = "http://tempuri.org/ITEL/Core/Resources/XQueries/consultarOfferPS_Req/";

declare function formatFechaISO8601($fechaActual as xs:string) as xs:string {
	let $fechaTemp   :=	replace( substring($fechaActual, 1, 19), "-", ""),
    	$fechaFormateada := concat($fechaTemp, "-0500") 		
	return $fechaFormateada
};

declare function xf:consultarOfferPS_Req($min as xs:string)
    as element(ns0:Input_Parameters) {
        <ns0:Input_Parameters>
             <TIPO_NODO>{ "EXT" }</TIPO_NODO>
            <HOST_ORIGEN>{ "ITEL" }</HOST_ORIGEN>
            <ID_TRANSACCION>{ "12345" }</ID_TRANSACCION>
            <FECHA_TRANSACCION>{ formatFechaISO8601(string(fn:current-dateTime())) }</FECHA_TRANSACCION>            
            <MIN>{ concat("57" ,$min) }</MIN>
        </ns0:Input_Parameters>
};

declare variable $min as xs:string external;

xf:consultarOfferPS_Req($min)
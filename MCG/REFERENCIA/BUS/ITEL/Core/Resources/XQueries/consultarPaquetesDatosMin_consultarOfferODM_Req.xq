(:: pragma bea:global-element-parameter parameter="$input_Parameters1" element="ns0:Input_Parameters" location="../Schemas/PS_ITEL_CONSULTAR_DATOS_MIN_PS.xsd" ::)
(:: pragma bea:global-element-return element="ns1:Input_Parameters" location="../../../OCS/AIR/Resources/Schemas/PS_ITEL_CONSULTAR_OFFER_ODM.xsd" ::)

declare namespace ns1 = "http://www.comcel.com.co/ConsultarOfferOCS/";
declare namespace ns0 = "http://www.comcel.com.co/consultarPaquetesDatosMin/";
declare namespace xf = "http://tempuri.org/ITEL/Core/Resources/XQueries/consultarPaquetesDatosMin_consultarOfferODM_Req/";

declare function xf:consultarPaquetesDatosMin_consultarOfferODM_Req($input_Parameters1 as element(ns0:Input_Parameters))
    as element(ns1:Input_Parameters) {
        <ns1:Input_Parameters>
            <TIPO_NODO>{ data("EXT") }</TIPO_NODO>
            <HOST_ORIGEN>{ data("ITEL") }</HOST_ORIGEN>
            <ID_TRANSACCION>{ data("1234") }</ID_TRANSACCION>
            <FECHA_TRANSACCION>{ formatFechaISO8601(string(fn:current-dateTime())) }</FECHA_TRANSACCION>
            <MIN>{ data($input_Parameters1/MIN) }</MIN>
            <OFFERID_FIRST>{ data($input_Parameters1/ESTADO) }</OFFERID_FIRST>
        </ns1:Input_Parameters>
};
declare function formatFechaISO8601($fechaActual as xs:string) as xs:string {
	let $fechaTemp   :=	replace( substring($fechaActual, 1, 19), "-", ""),
    	$fechaFormateada := concat($fechaTemp, "-0500") 		
	return $fechaFormateada
};
declare variable $input_Parameters1 as element(ns0:Input_Parameters) external;

xf:consultarPaquetesDatosMin_consultarOfferODM_Req($input_Parameters1)

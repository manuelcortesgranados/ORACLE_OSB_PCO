xquery version "1.0" encoding "Cp1252";
(:: pragma bea:global-element-parameter parameter="$metodoFAF" element="ns0:WS_Result" location="../Schemas/PS_ITEL_CONSULTARTIPOFAF.xsd" ::)
(:: pragma bea:global-element-parameter parameter="$fafList" element="ns2:WS_Result" location="../../../OCS/AIR/Resources/Schemas/PS_ITEL_CONSULTAR_FAFLIST.xsd" ::)

declare namespace xf = "http://tempuri.org/ITEL/Core/Resources/XQueries/obtenerFAFID/";
declare namespace ns2 = "http://www.comcel.com.co/ConsultarFaFListOCS/";
declare namespace ns1 = "http://webapps.online.ericsson.com";
declare namespace ns0 = "http://www.comcel.com.co/ConsultarTipoFAF/";

declare function xf:obtenerFAFID($metodoFAF as element(ns0:WS_Result),
    $fafList as element(ns2:WS_Result))
    as xs:string {
    	let $listFafID := data($fafList/MENSAJE/CONSULTAR_FAFLIST/fafInformationList/Detail/fafIndicator)
    	let $resultado := for $fafID in $metodoFAF/MENSAJE/FAFIDS/FAFID 
	        				  where $listFafID = $fafID
	    					  return $fafID
	    	return if(exists($resultado)) then string($resultado) else ""		  
};

declare variable $metodoFAF as element(ns0:WS_Result) external;
declare variable $fafList as element(ns2:WS_Result) external;

xf:obtenerFAFID($metodoFAF,
    $fafList)
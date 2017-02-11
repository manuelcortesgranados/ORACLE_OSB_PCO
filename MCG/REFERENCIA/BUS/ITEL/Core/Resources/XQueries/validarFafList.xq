xquery version "1.0" encoding "Cp1252";
(:: pragma bea:global-element-parameter parameter="$wS_Result1" element="ns1:WS_Result" location="../../../OCS/AIR/Resources/Schemas/PS_ITEL_CONSULTAR_FAFLIST.xsd" ::)

declare namespace xf = "http://tempuri.org/ITEL/Core/Resources/XQueries/validarFafList/";
declare namespace ns1 = "http://www.comcel.com.co/ConsultarFaFListOCS/";
declare namespace ns0 = "http://www.comcel.com.co/OCS/OperacionOCS_AIR";

declare function xf:validarFafList($wS_Result1 as element(ns1:WS_Result),
    $elegidos as xs:string,
    $fafID as xs:string)
    as xs:string {
        let $fafList := fn:string-join($wS_Result1/MENSAJE/CONSULTAR_FAFLIST/fafInformationList/Detail[fafIndicator=$fafID]/DetailNumber/fafNumber, ";")
        let $elegidosRegistro     := fn:tokenize($elegidos, ';')
        let $elegidosOriginales     := fn:tokenize($fafList, ';')
        let $valida := fn:string-join((for $numero in $elegidosRegistro
								        return 
								         fn:string-join(for $numeroOriginal in $elegidosOriginales
								           return 
								            if ($numero = $numeroOriginal) then $numeroOriginal else (),"" )) ,"")
			         
		let $error := if ($valida = "") then "1" else "912"
		return 	         
         xs:string(data($error))
};

declare variable $wS_Result1 as element(ns1:WS_Result) external;
declare variable $elegidos as xs:string external;
declare variable $fafID as xs:string external;

xf:validarFafList($wS_Result1,
    $elegidos,
    $fafID)
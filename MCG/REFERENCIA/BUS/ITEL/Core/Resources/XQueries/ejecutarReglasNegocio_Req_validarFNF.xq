xquery version "1.0" encoding "Cp1252";
(:: pragma bea:global-element-parameter parameter="$wS_Result1" element="ns0:WS_Result" location="../../../OCS/AIR/Resources/Schemas/PS_ITEL_CONSULTAR_FAFLIST.xsd" ::)

declare namespace xf = "http://tempuri.org/ITEL/Core/Resources/XQueries/ejecutarReglasNegocio_Req_validarFNF/";
declare namespace ns0 = "http://www.comcel.com.co/ConsultarFaFListOCS/";
declare namespace ns1 = "http://www.comcel.com.co/OCS/OperacionOCS_AIR";

declare function xf:ejecutarReglasNegocio_Req_validarFNF($wS_Result1 as element(ns0:WS_Result), $amigosList as xs:string)
    as xs:string {
     	let $FNFNumbers := for $FNFList in $wS_Result1/MENSAJE/CONSULTAR_FAFLIST/fafInformationList/Detail
    		where fn:contains($FNFList/fafIndicator, "600")
    			return for $FnFNumber in $FNFList/DetailNumber/fafNumber
    				 return $FnFNumber		
    	let $cantidadOld := count($FNFNumbers)
		let $amigostok := tokenize($amigosList,';')	
		let $cantidadNew := count($amigostok)
		let $contieneViejos := for $FnFNumber in $FNFNumbers
    		return if(fn:contains($amigosList,data($FnFNumber))) then 'true' else 'false'
    	let $contieneNuevos := for $amigosTokList in $amigostok
    		return if(fn:contains(string-join($FNFNumbers,','),data($amigosTokList))) then 'true' else 'false'
    	return
		if ($cantidadOld<=$cantidadNew) then
			if(fn:contains(string-join($contieneViejos,''),'false')) then 'true' else 'false'
		else 
			if(fn:contains(string-join($contieneNuevos,''),'false')) then 'true' else 'false'
			
    };

declare variable $wS_Result1 as element(ns0:WS_Result) external;
declare variable $amigosList as xs:string external;

xf:ejecutarReglasNegocio_Req_validarFNF($wS_Result1, $amigosList)

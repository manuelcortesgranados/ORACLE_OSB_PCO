(:: pragma bea:global-element-parameter parameter="$outputParameters" element="ns0:OutputParameters" location="../Schemas/BD_ITEL_CONSULTARRANGOSMIN.xsd" ::)
(:: pragma bea:global-element-return element="ns1:WS_Result" location="../Schemas/PS_ITEL_CONSULTARRANGOMIN.xsd" ::)

declare namespace ns1 = "http://www.comcel.com.co/ConsultarRangoMin/";
declare namespace ns0 = "http://xmlns.oracle.com/pcbpel/adapter/db/SOA_TEST/PKG_SOA_ITEL/PRC_CONSULTAR_RANGOS_MIN/";
declare namespace xf = "http://tempuri.org/ITEL/Core/Resources/XQueries/filtrarRangoMin/";

declare function xf:filtrarRangoMin($min as xs:decimal,
    $outputParameters as element(ns0:OutputParameters),
    $descripcion as xs:string)
    as element(ns1:WS_Result) {
        <ns1:WS_Result>
        	<CODIGO>OK</CODIGO>
                {
                	let $P_RANGOSMIN_RowSet := $outputParameters/ns0:P_RANGOSMIN/ns0:P_RANGOSMIN_RowSet[$min >= ./ns0:P_RMCMININICIAL and $min <= ./ns0:P_RMCMINFINAL]
                    return
                    	if (empty($P_RANGOSMIN_RowSet)) then
                    	    <MENSAJE>
	                            <RMCCODIGOIN />
	                            <RMCMININICAL />
	                            <RMCMINFINAL />
	                            <RMCESTADO>-1</RMCESTADO>
	                        </MENSAJE>
	                    else
                    	    <MENSAJE>
	                            <RMCCODIGOIN>{ data($P_RANGOSMIN_RowSet/ns0:P_RMCCODIGOIN) }</RMCCODIGOIN>
	                            <RMCMININICAL>{ data($P_RANGOSMIN_RowSet/ns0:P_RMCMININICIAL) }</RMCMININICAL>
	                            <RMCMINFINAL>{ data($P_RANGOSMIN_RowSet/ns0:P_RMCMINFINAL) }</RMCMINFINAL>
	                            <RMCESTADO>{ data($P_RANGOSMIN_RowSet/ns0:P_RMCESTADO) }</RMCESTADO>
	                        </MENSAJE>
                }
            <DESCRIPCION>{ concat(count($outputParameters/ns0:P_RANGOSMIN/ns0:P_RANGOSMIN_RowSet), "-", $descripcion) }</DESCRIPCION>
        </ns1:WS_Result>
};

declare variable $min as xs:decimal external;
declare variable $outputParameters as element(ns0:OutputParameters) external;
declare variable $descripcion as xs:string external;

xf:filtrarRangoMin($min,
    $outputParameters,
    $descripcion)
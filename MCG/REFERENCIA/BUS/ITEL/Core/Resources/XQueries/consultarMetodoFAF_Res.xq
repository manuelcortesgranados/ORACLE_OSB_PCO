(:: pragma bea:global-element-parameter parameter="$outputParameters1" element="ns1:OutputParameters" location="../Schemas/BD_ITEL_CONSULTAR_TIPOFAF.xsd" ::)
(:: pragma bea:global-element-return element="ns0:WS_Result" location="../Schemas/PS_ITEL_CONSULTARTIPOFAF.xsd" ::)

declare namespace ns1 = "http://xmlns.oracle.com/pcbpel/adapter/db/ITELSOA/PKG_SOA_ITEL/PRC_CONSULTAR_TIPOFAF/";
declare namespace ns0 = "http://www.comcel.com.co/ConsultarMetodoFAF/";
declare namespace xf = "http://tempuri.org/ITEL/Core/Resources/XQueries/consultarTipoFAF_Res/";

declare function xf:consultarMetodoFAF_Res($outputParameters1 as element(ns1:OutputParameters),
    $descripcion as xs:string)
    as element(ns0:WS_Result) {
        <ns0:WS_Result>
        	<CODIGO>OK</CODIGO>
            <MENSAJE>
            	<FAFIDS>{                      
	                    for $FAFID_Row in $outputParameters1/*:P_FAFID/*:FAFID_Row
	                    	return
	                            <FAFID>{ data($FAFID_Row/ns1:FAFID) }</FAFID>     
	             }</FAFIDS>                
            </MENSAJE>
            <DESCRIPCION>{ $descripcion }</DESCRIPCION>
        </ns0:WS_Result>
};

declare variable $outputParameters1 as element(ns1:OutputParameters) external;
declare variable $descripcion as xs:string external;

xf:consultarMetodoFAF_Res($outputParameters1,
    $descripcion)
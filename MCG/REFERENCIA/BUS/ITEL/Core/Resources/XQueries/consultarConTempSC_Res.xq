(:: pragma bea:global-element-parameter parameter="$outputParameters1" element="ns0:OutputParameters" location="../Schemas/BD_ITEL_CONSULTAR_CONTEMP_SC.xsd" ::)
(:: pragma bea:global-element-return element="ns1:WS_Result" location="../Schemas/PS_ITEL_CONSULTARCONTEMPSC.xsd" ::)

declare namespace ns1 = "http://www.comcel.com.co/ConsultarConTempSC/";
declare namespace ns0 = "http://xmlns.oracle.com/pcbpel/adapter/db/ITELSOA/PKG_SOA_ITEL/PRC_CONSULTAR_CONTEMP_SC/";
declare namespace xf = "http://tempuri.org/ITEL/Core/Resources/XQueries/consultarConTempSC_Res/";

declare function xf:consultarConTempSC_Res($outputParameters1 as element(ns0:OutputParameters), $descripcion as xs:string)
    as element(ns1:WS_Result) {
        <ns1:WS_Result>
        	<CODIGO>OK</CODIGO>
            <MENSAJE>
                <CONTRACT_TEMPLATE>{ data($outputParameters1/ns0:P_CONTEMPLATE) }</CONTRACT_TEMPLATE>
                <SERVICE_CLASS>{ data($outputParameters1/ns0:P_SERVCLASS) }</SERVICE_CLASS>
                <ESPOSTPAGO>{ data($outputParameters1/ns0:P_ESPOSTPAGO) }</ESPOSTPAGO>               
                <FAFIDS>{                      
	                    for $P_FAFIDS_Row in $outputParameters1/*:P_FAFID/*:P_FAFIDS_Row
	                    	return
	                            <FAFID>{ data($P_FAFIDS_Row/ns0:FAFID) }</FAFID>     
	             }</FAFIDS>
	             <FAFIDGROUP>{ data($outputParameters1/ns0:P_FAFIDGROUP) }</FAFIDGROUP>             
            </MENSAJE>
            <DESCRIPCION>{ $descripcion }</DESCRIPCION>
        </ns1:WS_Result>
};

declare variable $outputParameters1 as element(ns0:OutputParameters) external;
declare variable $descripcion as xs:string external;

xf:consultarConTempSC_Res($outputParameters1, $descripcion)
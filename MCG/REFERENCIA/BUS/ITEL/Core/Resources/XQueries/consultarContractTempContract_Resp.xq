(:: pragma bea:global-element-parameter parameter="$outputParameters1" element="ns1:OutputParameters" location="../Schemas/BD_ITEL_CONSULTAR_CONTEMP_CONTRACT.xsd" ::)
(:: pragma bea:global-element-return element="ns0:WS_Result" location="../Schemas/PS_ITEL_CONSULTARCONTRACTTEMP_CONTRACT.xsd" ::)

declare namespace ns1 = "http://xmlns.oracle.com/pcbpel/adapter/db/ITELSOA/PKG_SOA_ITEL/PRC_CONSULTAR_CONTEMP_CONTRACT/";
declare namespace ns0 = "http://www.comcel.com.co/ConsultarContractTemp_Contract/";
declare namespace xf = "http://tempuri.org/ITEL/Core/Resources/XQueries/consultarContractTempContract_Resp/";

declare function xf:consultarContractTempContract_Resp($outputParameters1 as element(ns1:OutputParameters), $descripcion as xs:string)
    as element(ns0:WS_Result) {
        <ns0:WS_Result>
        	<CODIGO>OK</CODIGO>
            <MENSAJE>
                <CONTRACT_TEMPLATE>{ data($outputParameters1/ns1:P_CONTEMPLATE) }</CONTRACT_TEMPLATE>
                <FAFIDGROUP>{ data($outputParameters1/ns1:P_FAFIDGROUPOUT) }</FAFIDGROUP>
                <CONTRACT>{ data($outputParameters1/ns1:P_CONTRACTOUT) }</CONTRACT>
                <FAFIDS>{                      
	                    for $P_FAFIDS_Row in $outputParameters1/*:P_FAFID/*:P_FAFIDS_Row
	                    	return
	                            <FAFID>{ data($P_FAFIDS_Row/ns1:FAFID) }</FAFID>     
	             }</FAFIDS>
            </MENSAJE>
            <DESCRIPCION>{ $descripcion }</DESCRIPCION>
        </ns0:WS_Result>
};

declare variable $outputParameters1 as element(ns1:OutputParameters) external;
declare variable $descripcion as xs:string external;

xf:consultarContractTempContract_Resp($outputParameters1, $descripcion)
(:: pragma bea:global-element-parameter parameter="$outputParameters1" element="ns1:OutputParameters" location="../Schemas/BD_ITEL_CONSULTAR_CONTEMP_OFFER.xsd" ::)
(:: pragma bea:global-element-return element="ns0:WS_Result" location="../Schemas/PS_ITEL_CONSULTARCONTEMPSC_OFFER.xsd" ::)

declare namespace ns1 = "http://xmlns.oracle.com/pcbpel/adapter/db/ITELSOA/PKG_SOA_ITEL/PRC_CONSULTAR_CONTEMP_OFFER/";
declare namespace ns0 = "http://www.comcel.com.co/ConsultarConTempSCOffer/";
declare namespace xf = "http://tempuri.org/ITEL/Core/Resources/XQueries/consultarConTempSCOffer_Res/";

declare function xf:consultarConTempSCOffer_Res($outputParameters1 as element(ns1:OutputParameters), $descripcion as xs:string)
    as element(ns0:WS_Result) {
        <ns0:WS_Result>
        <CODIGO>OK</CODIGO>
            <MENSAJE>
                <CONTRACT_TEMPLATE>{ data($outputParameters1/ns1:P_CONTEMPLATE) }</CONTRACT_TEMPLATE>
                <SERVICE_CLASS>{ data($outputParameters1/ns1:P_SERVCLASS) }</SERVICE_CLASS>
                <ESPOSTPAGO>{ data($outputParameters1/ns1:P_ESPOSTPAGO) }</ESPOSTPAGO>
                <FAFIDS>{                      
	                    for $P_FAFIDS_Row in $outputParameters1/*:P_FAFID/*:P_FAFID_Row
	                    	return
	                            <FAFID>{ data($P_FAFIDS_Row/*:FADID) }</FAFID>     
	             }</FAFIDS>
                <FAFIDGROUP>{ data($outputParameters1/ns1:P_FAFIDGROUP) }</FAFIDGROUP>
            </MENSAJE>
            <DESCRIPCION>{ $descripcion }</DESCRIPCION>
        </ns0:WS_Result>
};

declare variable $outputParameters1 as element(ns1:OutputParameters) external;
declare variable $descripcion as xs:string external;

xf:consultarConTempSCOffer_Res($outputParameters1, $descripcion)
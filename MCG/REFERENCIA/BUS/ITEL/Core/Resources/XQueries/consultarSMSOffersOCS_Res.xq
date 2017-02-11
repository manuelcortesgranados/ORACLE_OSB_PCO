(:: pragma bea:global-element-parameter parameter="$outputParameters1" element="ns0:OutputParameters" location="../Schemas/BD_ITEL_CONSULTAR_SMSOFFERSOCS.xsd" ::)
(:: pragma bea:global-element-return element="ns1:WS_Result" location="../Schemas/PS_ITEL_CONSULTAR_SMSOFFERSOCS.xsd" ::)

declare namespace ns1 = "http://www.comcel.com.co/ConsultarSMSOffersOCS/";
declare namespace ns0 = "http://xmlns.oracle.com/pcbpel/adapter/db/ITELSOA/PKG_SOA_ITEL/PRC_CONSULTAR_SMSOFFERS/";
declare namespace xf = "http://tempuri.org/ITEL/Core/Resources/XQueries/consultarSMSOffersOCS_Res/";

declare function xf:consultarSMSOffersOCS_Res($outputParameters1 as element(ns0:OutputParameters))
    as element(ns1:WS_Result) {
        <ns1:WS_Result>
        <CODIGO>OK</CODIGO>
            <MENSAJE>
                <OFFERID>{ data($outputParameters1/ns0:P_OFFERID) }</OFFERID>
                <PRODUCTNAME>{ data($outputParameters1/ns0:P_PRODUCTNAME) }</PRODUCTNAME>
            </MENSAJE>
         <DESCRIPCION>Ejecucion exitosa</DESCRIPCION>   
        </ns1:WS_Result>
};

declare variable $outputParameters1 as element(ns0:OutputParameters) external;

xf:consultarSMSOffersOCS_Res($outputParameters1)
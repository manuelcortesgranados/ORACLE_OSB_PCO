(:: pragma bea:global-element-parameter parameter="$outputParameters1" element="ns1:OutputParameters" location="../Schemas/BD_ITEL_CONSULTAR_MIN_OCS_DRP.xsd" ::)
(:: pragma bea:global-element-return element="ns0:WS_Result" location="../Schemas/PS_ITEL_CONSULTAR_MIN_OCS_DRP.xsd" ::)

declare namespace ns1 = "http://xmlns.oracle.com/pcbpel/adapter/db/sp/bd_consultarMinOcsDrp";
declare namespace ns0 = "http://www.comcel.com.co/ConsultarMinOcsDrp/";
declare namespace xf = "http://tempuri.org/ITEL/Core/Resources/XQueries/consultarMinOcsDrp_Res/";

declare function xf:consultarMinOcsDrp_Res($outputParameters1 as element(ns1:OutputParameters))
    as element(ns0:WS_Result) {
        <ns0:WS_Result>
            <CODIGO>1</CODIGO>
            <MENSAJE>
                <TMCODE>{ data($outputParameters1/ns1:P_TMCODE) }</TMCODE>
                <SPCODE>{ data($outputParameters1/ns1:P_SPCODE) }</SPCODE>
                <ELEGIDO>{ data($outputParameters1/ns1:P_ELEGIDO) }</ELEGIDO>
                <CONTRACT>{ data($outputParameters1/ns1:P_CONTRACT) }</CONTRACT>
                <SERVICECLASS>{ data($outputParameters1/ns1:P_SERVICECLASS) }</SERVICECLASS>
                <RESPUESTA>{ data($outputParameters1/ns1:P_RESPUESTA) }</RESPUESTA>
            </MENSAJE>
            <DESCRIPCION>Operacion Ejecutada</DESCRIPCION>
        </ns0:WS_Result>
};

declare variable $outputParameters1 as element(ns1:OutputParameters) external;

xf:consultarMinOcsDrp_Res($outputParameters1)

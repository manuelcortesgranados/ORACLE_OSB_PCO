(:: pragma bea:global-element-parameter parameter="$outputParameters1" element="ns1:OutputParameters" location="../Schemas/BD_ITEL_CONSULTAR_CONSECUTIVO.xsd" ::)
(:: pragma bea:global-element-return element="ns0:WS_Result" location="../Schemas/PS_ITEL_CONSULTAR_CONSECUTIVO.xsd" ::)

declare namespace ns1 = "http://xmlns.oracle.com/pcbpel/adapter/db/ITELSOA/PKG_SOA_ITEL/PRC_CONSULTAR_CONSECUTIVO/";
declare namespace ns0 = "http://www.comcel.com.co/consultarConsecutivo/";
declare namespace xf = "http://tempuri.org/ITEL/Core/Resources/XQueries/consultarConsecutivo_Res/";

declare function xf:consultarConsecutivo_Res($outputParameters1 as element(ns1:OutputParameters))
    as element(ns0:WS_Result) {
        <ns0:WS_Result>
            <CODIGO>{
              if (data($outputParameters1/ns1:P_EXITO) = 'true')then
                "1"
              else
                "ERROR"
            }</CODIGO>
            <MENSAJE>
                <MESSAGE_ERROR>{ data($outputParameters1/ns1:P_MESSAGE) }</MESSAGE_ERROR>
                <MESSAGE_EXITO>{ data($outputParameters1/ns1:P_EXITO) }</MESSAGE_EXITO>
            </MENSAJE>
            <DESCRIPCION>{data($outputParameters1/ns1:P_MESSAGE)}</DESCRIPCION>
        </ns0:WS_Result>
};

declare variable $outputParameters1 as element(ns1:OutputParameters) external;

xf:consultarConsecutivo_Res($outputParameters1)
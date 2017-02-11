(:: pragma bea:global-element-parameter parameter="$outputParameters1" element="ns0:OutputParameters" location="../Schemas/BD_ITEL_INSERTAR_CONSECUTIVO.xsd" ::)
(:: pragma bea:global-element-return element="ns1:WS_Result" location="../Schemas/PS_ITEL_INSERTAR_CONSECUTIVO.xsd" ::)

declare namespace ns1 = "http://www.comcel.com.co/insertarConsecutivo/";
declare namespace ns0 = "http://xmlns.oracle.com/pcbpel/adapter/db/ITELSOA/PKG_SOA_ITEL/PRC_INSERTAR_CONSECUTIVO/";
declare namespace xf = "http://tempuri.org/ITEL/Core/Resources/XQueries/insertarConsecutivo_Res/";

declare function xf:insertarConsecutivo_Res($outputParameters1 as element(ns0:OutputParameters))
    as element(ns1:WS_Result) {
        <ns1:WS_Result>
             <CODIGO>{if (data($outputParameters1/ns0:P_EXITO) = 'true')then
                "1"
              else
                "ERROR"}</CODIGO>
            <MENSAJE>
                <MESSAGE_ERROR>{ data($outputParameters1/ns0:P_MESSAGE) }</MESSAGE_ERROR>
                <MESSAGE_EXITO>{ data($outputParameters1/ns0:P_EXITO) }</MESSAGE_EXITO>
            </MENSAJE>
            <DESCRIPCION>{data($outputParameters1/ns0:P_MESSAGE)}</DESCRIPCION>
        </ns1:WS_Result>
};

declare variable $outputParameters1 as element(ns0:OutputParameters) external;

xf:insertarConsecutivo_Res($outputParameters1)
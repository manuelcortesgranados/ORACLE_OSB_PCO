(:: pragma bea:global-element-parameter parameter="$outputParameters1" element="ns1:OutputParameters" location="../Schemas/BD_CONSULTAR_PARAMETROS_BB.xsd" ::)
(:: pragma bea:global-element-return element="ns0:WS_Result" location="../Schemas/PS_ITEL_CONSULTAR_PARAMETROS_BB.xsd" ::)

declare namespace ns1 = "http://xmlns.oracle.com/pcbpel/adapter/db/sp/bd_consultarParametrosBB";
declare namespace ns0 = "http://www.comcel.com.co/consultarParametrosBB/";
declare namespace xf = "http://tempuri.org/ITEL/Core/Resources/XQueries/consultarParametrosBB_Res/";

declare function xf:consultarParametrosBB_Res($outputParameters1 as element(ns1:OutputParameters))
    as element(ns0:WS_Result) {
        <ns0:WS_Result>
            <CODIGO>1</CODIGO>
            <MENSAJE>
                <VIGENCIA>{ data($outputParameters1/ns1:P_VIGENCIA) }</VIGENCIA>
                <CODIGO_ACTIVACION_RIM>{ data($outputParameters1/ns1:P_CODIGO_ACTIVACION_RIM) }</CODIGO_ACTIVACION_RIM>
                <CODIGO_DESACTIVACION_RIM>{ data($outputParameters1/ns1:P_CODIGO_DESACTIVACION_RIM) }</CODIGO_DESACTIVACION_RIM>
                <RESULTADO>{ data($outputParameters1/ns1:P_RESULT) }</RESULTADO>
            </MENSAJE>
            <DESCRIPCION>Ejecucion Exitosa</DESCRIPCION>
        </ns0:WS_Result>
};

declare variable $outputParameters1 as element(ns1:OutputParameters) external;

xf:consultarParametrosBB_Res($outputParameters1)

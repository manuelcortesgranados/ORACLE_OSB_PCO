(:: pragma bea:global-element-parameter parameter="$outputParameters1" element="ns1:OutputParameters" location="../Schemas/BD_ITEL_CONSULTARPARAMETROS.xsd" ::)
(:: pragma bea:global-element-return element="ns0:WS_Result" location="../Schemas/PS_ITEL_CONSULTARPARAMETROSEJECUCION.xsd" ::)

declare namespace ns1 = "http://xmlns.oracle.com/pcbpel/adapter/db/SOA_TEST/PKG_SOA_ITEL/PRC_CONSULTAR_PARAMETROS/";
declare namespace ns0 = "http://www.comcel.com.co/ConsultarParametrosEjecucion/";
declare namespace xf = "http://tempuri.org/ITEL/Core/Resources/XQueries/consultarParametrosEjecucion_Res/";

declare function xf:consultarParametrosEjecucion_Res($outputParameters1 as element(ns1:OutputParameters),
    $descripcion as xs:string)
    as element(ns0:WS_Result) {
        <ns0:WS_Result>
            <CODIGO>OK</CODIGO>
            <MENSAJE>
                {
                    for $P_PARAMETROS_Row in $outputParameters1/ns1:P_PARAMETROS/ns1:P_PARAMETROS_Row
                    return
                        <PARAMETRO>
                            <NOMBRE>{ data($P_PARAMETROS_Row/ns1:PARNOMBRE) }</NOMBRE>
                            <VALOR>{ data($P_PARAMETROS_Row/ns1:PARVALOR) }</VALOR>
                        </PARAMETRO>
                }
            </MENSAJE>
            <DESCRIPCION>{ $descripcion }</DESCRIPCION>
        </ns0:WS_Result>
};

declare variable $outputParameters1 as element(ns1:OutputParameters) external;
declare variable $descripcion as xs:string external;

xf:consultarParametrosEjecucion_Res($outputParameters1,
    $descripcion)
(:: pragma bea:global-element-parameter parameter="$outputParameters1" element="ns1:OutputParameters" location="../Schemas/BD_CONSULTAR_PAQUETESCAN_BB.xsd" ::)
(:: pragma bea:global-element-return element="ns0:WS_Result" location="../Schemas/PS_ITEL_CONSULTAR_PAQUETESCAN_BB.xsd" ::)

declare namespace ns1 = "http://xmlns.oracle.com/pcbpel/adapter/db/sp/bd_consultarPaquetesCan";
declare namespace ns0 = "http://www.comcel.com.co/consultarPaquetesCanBB/";
declare namespace xf = "http://tempuri.org/ITEL/Core/Resources/XQueries/consultarPaquetesCan_Res/";

declare function xf:consultarPaquetesCan_Res($outputParameters1 as element(ns1:OutputParameters))
    as element(ns0:WS_Result) {
        <ns0:WS_Result>
            <CODIGO>1</CODIGO>
            <MENSAJE>
                <ACTIVO>{ data($outputParameters1/ns1:P_ACTIVO) }</ACTIVO>
                <ANIDADO>{ data($outputParameters1/ns1:P_ANIDADO) }</ANIDADO>
                <RESULTADO>{ data($outputParameters1/ns1:P_RESULT) }</RESULTADO>
            </MENSAJE>
            <DESCRIPCION>Ejecucion Exitosa</DESCRIPCION>
        </ns0:WS_Result>
};

declare variable $outputParameters1 as element(ns1:OutputParameters) external;

xf:consultarPaquetesCan_Res($outputParameters1)

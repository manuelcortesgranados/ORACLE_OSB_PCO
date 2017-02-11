(:: pragma bea:global-element-parameter parameter="$outputParameters1" element="ns1:OutputParameters" location="../Schemas/BD_CREAR_TICKLER.xsd" ::)
(:: pragma bea:global-element-return element="ns0:WS_Result" location="../Schemas/PS_CREAR_TICKLER.xsd" ::)

declare namespace ns1 = "http://xmlns.oracle.com/pcbpel/adapter/db/sp/bd_crearTickler";
declare namespace ns0 = "http://www.claro.com.co/Elegidos/crearTickler/";
declare namespace xf = "http://tempuri.org/Elegidos/CICLOP/Resources/XQueries/crearTickler_Res/";

declare function xf:crearTickler_Res($outputParameters1 as element(ns1:OutputParameters))
    as element(ns0:WS_Result) {
        <ns0:WS_Result>
            <CODIGO>1</CODIGO>
            <MENSAJE>
                <RESPUESTA>{ data($outputParameters1/ns1:P_RESPUESTA) }</RESPUESTA>
                <DESCRIPCION_RESP>{ data($outputParameters1/ns1:P_DESCRIPCION_RESP) }</DESCRIPCION_RESP>
            </MENSAJE>
            <DESCRIPCION>Operacion Ejecutada</DESCRIPCION>
        </ns0:WS_Result>
};

declare variable $outputParameters1 as element(ns1:OutputParameters) external;

xf:crearTickler_Res($outputParameters1)

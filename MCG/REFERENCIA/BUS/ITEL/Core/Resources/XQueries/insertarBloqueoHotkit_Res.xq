(:: pragma bea:global-element-parameter parameter="$outputParameters1" element="ns0:OutputParameters" location="../Schemas/BD_ITEL_INSERTAR_BLOQUEO_HOTKIT.xsd" ::)
(:: pragma bea:global-element-return element="ns1:WS_Result" location="../Schemas/PS_ITEL_INSERTAR_BLOQUEO_HOTKIT.xsd" ::)

declare namespace ns1 = "http://www.comcel.com.co/InsertarBloqueoHotkit";
declare namespace ns0 = "http://xmlns.oracle.com/pcbpel/adapter/db/ITELSOA/PKG_SOA_ITEL/PRC_INSERTAR_BLOQUEO_HOTKIT/";
declare namespace xf = "http://tempuri.org/ITEL/Core/Resources/XQueries/insertarBloqueoHotkit_Res/";

declare function xf:insertarBloqueoHotkit_Res($outputParameters1 as element(ns0:OutputParameters))
    as element(ns1:WS_Result) {
        <ns1:WS_Result>
        <ns1:CODIGO>1</ns1:CODIGO>
            <ns1:MENSAJE>
                <ns1:BLOQUEADO>{ data($outputParameters1/ns0:P_EXITO) }</ns1:BLOQUEADO>
            </ns1:MENSAJE>
               <ns1:DESCRIPCION />
        </ns1:WS_Result>
};

declare variable $outputParameters1 as element(ns0:OutputParameters) external;

xf:insertarBloqueoHotkit_Res($outputParameters1)
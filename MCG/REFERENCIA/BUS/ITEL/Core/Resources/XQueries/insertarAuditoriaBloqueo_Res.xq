(:: pragma bea:global-element-parameter parameter="$outputParameters1" element="ns1:OutputParameters" location="../Schemas/BD_ITEL_INSERTAR_AUDITORIA_BLOQUEO.xsd" ::)
(:: pragma bea:global-element-return element="ns0:WS_Result" location="../Schemas/PS_ITEL_INSERTARAUDITORIABLOQUEO.xsd" ::)

declare namespace ns1 = "http://xmlns.oracle.com/pcbpel/adapter/db/ITELSOA/PKG_SOA_ITEL/PRC_INSERTAR_AUDITORIA_BLOQUEO/";
declare namespace ns0 = "http://www.comcel.com.co/InsertarAuditoriaBloqueo";
declare namespace xf = "http://tempuri.org/ITEL/Core/Resources/XQueries/insertarAuditoriaBloqueo_Res/";

declare function xf:insertarAuditoriaBloqueo_Res($outputParameters1 as element(ns1:OutputParameters))
    as element(ns0:WS_Result) {
        <ns0:WS_Result>
        	<ns0:CODIGO>1</ns0:CODIGO>
            <ns0:MENSAJE>
                <ns0:BLOQUEADO>{ data($outputParameters1/ns1:P_EXITO) }</ns0:BLOQUEADO>
            </ns0:MENSAJE>
            <ns0:DESCRIPCION />
        </ns0:WS_Result>
};

declare variable $outputParameters1 as element(ns1:OutputParameters) external;

xf:insertarAuditoriaBloqueo_Res($outputParameters1)
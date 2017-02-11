(:: pragma bea:global-element-parameter parameter="$outputParameters1" element="ns1:OutputParameters" location="../Schemas/BD_ITEL_INSERTAR_AUDITORIAPROMOCINE.xsd" ::)
(:: pragma bea:global-element-return element="ns0:WS_Result" location="../Schemas/PS_ITEL_INSERTAR_AUDITORIAPROMOCINE.xsd" ::)

declare namespace ns1 = "http://xmlns.oracle.com/pcbpel/adapter/db/sp/bd_insertarAuditoriaPromoCine";
declare namespace ns0 = "http://www.comcel.com.co/insertarAuditoriaPromoCine";
declare namespace xf = "http://tempuri.org/ITEL/Core/Resources/XQueries/insertarAuditoriaPromoCine_Res/";

declare function xf:insertarAuditoriaPromoCine_Res($outputParameters1 as element(ns1:OutputParameters))
    as element(ns0:WS_Result) {
        <ns0:WS_Result>
            <CODIGO>{ data($outputParameters1/ns1:P_RESULTADO) }</CODIGO>
            <MENSAJE>{ data($outputParameters1/ns1:P_DESCRIPCION) }</MENSAJE>
        </ns0:WS_Result>
};

declare variable $outputParameters1 as element(ns1:OutputParameters) external;

xf:insertarAuditoriaPromoCine_Res($outputParameters1)
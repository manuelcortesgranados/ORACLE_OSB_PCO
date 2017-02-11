(:: pragma bea:global-element-parameter parameter="$outputParameters1" element="ns0:OutputParameters" location="../Schemas/BD_ITEL_INSERTARAUDITORIARECARGADATOS.xsd" ::)
(:: pragma bea:global-element-return element="ns1:WS_Result" location="../Schemas/PS_ITEL_INSERTAR_AUDITORIARECARGADATOS.xsd" ::)

declare namespace ns1 = "http://www.comcel.com.co/InsertarAuditoriaRecargaDatos";
declare namespace ns0 = "http://xmlns.oracle.com/pcbpel/adapter/db/sp/bd_insertarAuditoriaRecargaDatos";
declare namespace xf = "http://tempuri.org/ITEL/Core/Resources/XQueries/insertarAuditoriaRecargaDatos_Res/";

declare function xf:insertarAuditoriaRecargaDatos_Res($outputParameters1 as element(ns0:OutputParameters), $descripcion as xs:string)
    as element(ns1:WS_Result) {
        <ns1:WS_Result>
        	<CODIGO>OK</CODIGO>
            <MENSAJE>
                <EXITO>{ data($outputParameters1/ns0:P_EXITO) }</EXITO>
            </MENSAJE>
            <DESCRIPCION>{ $descripcion }</DESCRIPCION>
        </ns1:WS_Result>
};

declare variable $outputParameters1 as element(ns0:OutputParameters) external;
declare variable $descripcion as xs:string external;

xf:insertarAuditoriaRecargaDatos_Res($outputParameters1, $descripcion)
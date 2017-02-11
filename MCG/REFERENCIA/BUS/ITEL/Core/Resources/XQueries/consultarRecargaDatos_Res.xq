(:: pragma bea:global-element-parameter parameter="$outputParameters1" element="ns1:OutputParameters" location="../Schemas/BD_ITEL_CONSULTARRECARGADATOS.xsd" ::)
(:: pragma bea:global-element-return element="ns0:WS_Result" location="../Schemas/PS_ITEL_CONSULTARRECARGADATOS.xsd" ::)

declare namespace ns1 = "http://xmlns.oracle.com/pcbpel/adapter/db/sp/bd_consultarRecargaDatos";
declare namespace ns0 = "http://www.comcel.com.co/ConsultarRecargaDatos/";
declare namespace xf = "http://tempuri.org/ITEL/Core/Resources/XQueries/consultarRecargaDatos_Res/";

declare function xf:consultarRecargaDatos_Res($outputParameters1 as element(ns1:OutputParameters), $descripcion as xs:string)
    as element(ns0:WS_Result) {
        <ns0:WS_Result>
        	<CODIGO>OK</CODIGO>
            <MENSAJE>
                <CODIGO>{ data($outputParameters1/ns1:P_CODIGO) }</CODIGO>
                <BONO>{ data($outputParameters1/ns1:P_BONO) }</BONO>
            </MENSAJE>
            <DESCRIPCION>{ $descripcion }</DESCRIPCION>
        </ns0:WS_Result>
};

declare variable $outputParameters1 as element(ns1:OutputParameters) external;
declare variable $descripcion as xs:string external;

xf:consultarRecargaDatos_Res($outputParameters1, $descripcion)
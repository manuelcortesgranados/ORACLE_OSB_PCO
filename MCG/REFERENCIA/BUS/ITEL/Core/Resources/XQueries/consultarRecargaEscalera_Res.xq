(:: pragma bea:global-element-parameter parameter="$outputParameters1" element="ns1:OutputParameters" location="../Schemas/BD_ITEL_CONSULTARRECARGAESCALERA.xsd" ::)
(:: pragma bea:global-element-return element="ns0:WS_Result" location="../Schemas/PS_ITEL_CONSULTARRECARGAESCALERA.xsd" ::)

declare namespace ns1 = "http://xmlns.oracle.com/pcbpel/adapter/db/sp/bd_consultarRecargaEscalera";
declare namespace ns0 = "http://www.comcel.com.co/ConsultarRecargaEscalera/";
declare namespace xf = "http://tempuri.org/ITEL/Core/Resources/XQueries/consultarRecargaEscalera_Res/";

declare function xf:consultarRecargaEscalera_Res($outputParameters1 as element(ns1:OutputParameters), $descripcion as xs:string)
    as element(ns0:WS_Result) {
        <ns0:WS_Result>
        	<CODIGO>OK</CODIGO>
            <MENSAJE>
                <CODIGO>{ data($outputParameters1/ns1:P_CODIGO) }</CODIGO>
                <CUENTA>{ data($outputParameters1/ns1:P_CUENTA) }</CUENTA>
                <COMENTARIO>{ data($outputParameters1/ns1:P_COMENTARIO) }</COMENTARIO>
                <HOSTIDOUT>{ data($outputParameters1/ns1:P_HOSTIDOUT) }</HOSTIDOUT>
                <VALOR>{ data($outputParameters1/ns1:P_VALOR) }</VALOR>
                <VIGENCIA>{ data($outputParameters1/ns1:P_VIGENCIA) }</VIGENCIA>                                
            </MENSAJE>
            <DESCRIPCION>{ $descripcion }</DESCRIPCION>
        </ns0:WS_Result>
};

declare variable $outputParameters1 as element(ns1:OutputParameters) external;
declare variable $descripcion as xs:string external;

xf:consultarRecargaEscalera_Res($outputParameters1, $descripcion)
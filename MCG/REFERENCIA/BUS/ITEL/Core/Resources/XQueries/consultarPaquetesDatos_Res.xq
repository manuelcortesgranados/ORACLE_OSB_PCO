(:: pragma bea:global-element-parameter parameter="$outputParameters1" element="ns1:OutputParameters" location="../Schemas/BD_ITEL_CONSULTAR_PAQUETES_DATOS.xsd" ::)
(:: pragma bea:global-element-return element="ns0:WS_Result" location="../Schemas/PS_ITEL_CONSULTARPAQUETESDATOS.xsd" ::)

declare namespace ns1 = "http://xmlns.oracle.com/pcbpel/adapter/db/sp/bd_consultarPaquetesDatos";
declare namespace ns0 = "http://www.comcel.com.co/ConsultarPaquetesDatos/";
declare namespace xf = "http://tempuri.org/ITEL/Core/Resources/XQueries/consultarPaquetesDatos_Res/";

declare function xf:consultarPaquetesDatos_Res($outputParameters1 as element(ns1:OutputParameters),
    $descripcion as xs:string)
    as element(ns0:WS_Result) {
        <ns0:WS_Result>
            <MENSAJE>
                <ID_SM_BRMS>{ data($outputParameters1/ns1:P_ID_SM_BRMS) }</ID_SM_BRMS>
                <COMENTARIO>{ data($outputParameters1/ns1:P_COMENTARIO) }</COMENTARIO>
                <HOST_ID>{ data($outputParameters1/ns1:P_HOST_ID) }</HOST_ID>
                <PLATAFORMA>{ data($outputParameters1/ns1:P_PLATAFORMA) }</PLATAFORMA>
                <VALOR>{ data($outputParameters1/ns1:P_VALOR) }</VALOR>
                <NOTIFICACION>{ data($outputParameters1/ns1:P_NOTIFICACION) }</NOTIFICACION>
                <OFFER_ID>{ data($outputParameters1/ns1:P_OFFER_ID) }</OFFER_ID>
            </MENSAJE>
            <DESCRIPCION>{ $descripcion }</DESCRIPCION>
        </ns0:WS_Result>
};

declare variable $outputParameters1 as element(ns1:OutputParameters) external;
declare variable $descripcion as xs:string external;

xf:consultarPaquetesDatos_Res($outputParameters1,
    $descripcion)

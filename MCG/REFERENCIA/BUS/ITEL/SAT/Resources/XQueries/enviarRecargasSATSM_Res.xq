(:: pragma bea:global-element-return element="ns0:WS_Result" location="../Schemas/PS_ENVIAR_RECARGAS_SAT_SM.xsd" ::)

declare namespace ns0 = "http://www.comcel.com.co/EnviarRecargasSATSM/";
declare namespace xf = "http://tempuri.org/ITEL/SAT/Resources/XQueries/enviarRecargasSATSM_Res/";

declare function xf:enviarRecargasSATSM_Res($response as xs:string,
    $descripcion as xs:string)
    as element(ns0:WS_Result) {
        <ns0:WS_Result>
            <ns0:MENSAJE>
                <ns0:resultCode>{ $response }</ns0:resultCode>
            </ns0:MENSAJE>
            <ns0:DESCRIPCION>{ $descripcion }</ns0:DESCRIPCION>
        </ns0:WS_Result>
};

declare variable $response as xs:string external;
declare variable $descripcion as xs:string external;

xf:enviarRecargasSATSM_Res($response,
    $descripcion)

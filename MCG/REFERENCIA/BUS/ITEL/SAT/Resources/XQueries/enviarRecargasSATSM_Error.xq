(:: pragma bea:global-element-return element="ns0:WS_Result" location="../Schemas/PS_ENVIAR_RECARGAS_SAT_SM.xsd" ::)

declare namespace ns0 = "http://www.comcel.com.co/EnviarRecargasSATSM/";
declare namespace xf = "http://tempuri.org/ITEL/SAT/Resources/XQueries/enviarRecargasSATSM_Error/";

declare function xf:enviarRecargasSATSM_Error($codigo as xs:string,
    $mensaje as xs:string,
    $descripcion as xs:string)
    as element(ns0:WS_Result) {
        <ns0:WS_Result>
            <ns0:CODIGO>{ $codigo }</ns0:CODIGO>
            <ns0:MENSAJE>
                <ns0:resultDescription>{ $mensaje }</ns0:resultDescription>
            </ns0:MENSAJE>
            <ns0:DESCRIPCION>{ $descripcion }</ns0:DESCRIPCION>
        </ns0:WS_Result>
};

declare variable $codigo as xs:string external;
declare variable $mensaje as xs:string external;
declare variable $descripcion as xs:string external;

xf:enviarRecargasSATSM_Error($codigo,
    $mensaje,
    $descripcion)

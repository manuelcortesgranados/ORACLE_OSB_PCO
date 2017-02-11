(:: pragma bea:global-element-return element="ns0:WS_Result" location="../Schemas/PS_PROVISION_SPR_RTC.xsd" ::)

declare namespace ns0 = "http://www.comcel.com.co/ITEL/provisionSPR_RTC/";
declare namespace xf = "http://tempuri.org/ITEL/RTC/Resources/XQueries/provisionSPR_RTC_Error/";

declare function xf:provisionSPR_RTC_Error($codigo as xs:string,
    $mensaje as xs:string,
    $descripcion as xs:string)
    as element(ns0:WS_Result) {
        <ns0:WS_Result>
            <CODIGO>{ $codigo }</CODIGO>
            <MENSAJE>
                <xmlResponse>{ $mensaje }</xmlResponse>
            </MENSAJE>
            <DESCRIPCION>{ $descripcion }</DESCRIPCION>
        </ns0:WS_Result>
};

declare variable $codigo as xs:string external;
declare variable $mensaje as xs:string external;
declare variable $descripcion as xs:string external;

xf:provisionSPR_RTC_Error($codigo,
    $mensaje,
    $descripcion)
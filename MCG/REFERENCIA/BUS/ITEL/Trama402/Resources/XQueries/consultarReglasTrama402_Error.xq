(:: pragma bea:global-element-return element="ns0:WS_Result" location="../Schemas/PS_ITEL_CONSULTARREGLASTRAMA402.xsd" ::)

declare namespace ns0 = "http://www.comcel.com.co/ConsultarReglasTrama402/";
declare namespace xf = "http://tempuri.org/ITEL/Trama402/Resources/XQueries/consultarReglasTrama402_Error/";

declare function xf:consultarReglasTrama402_Error($codigo as xs:string,
    $mensaje as xs:string,
    $descripcion as xs:string)
    as element(ns0:WS_Result) {
        <ns0:WS_Result>
            <CODIGO>{ $codigo }</CODIGO>
            <MENSAJE>
                <ERROR/>
                <CONSULTASUSCRIPTOR/>
                <ACREDITAONPEAK/>
                <MONTOONPEAK/>
                <MODIFICAVIGENCIAONPEAK/>
                <VIGENCIAONPEAK/>
            </MENSAJE>
            <DESCRIPCION>{ $descripcion }</DESCRIPCION>
        </ns0:WS_Result>
};

declare variable $codigo as xs:string external;
declare variable $mensaje as xs:string external;
declare variable $descripcion as xs:string external;

xf:consultarReglasTrama402_Error($codigo,
    $mensaje,
    $descripcion)
(:: pragma bea:global-element-return element="ns0:WS_Result" location="../Schemas/PS_ITEL_CONSULTARREGLASTRAMA403.xsd" ::)

declare namespace ns0 = "http://www.comcel.com.co/ConsultarReglasTrama403/";
declare namespace xf = "http://tempuri.org/ITEL/Trama403/Resources/XQueries/consultarReglasTrama403_Error/";

declare function xf:consultarReglasTrama403_Error($codigo as xs:string,
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
                <ACREDITABONUS/>
                <MODIFICAVIGENCIABONUS/>
                <VIGENCIABONOS/>
                <MONTOBONOS/>
            </MENSAJE>
            <DESCRIPCION>{ $descripcion }</DESCRIPCION>
        </ns0:WS_Result>
};

declare variable $codigo as xs:string external;
declare variable $mensaje as xs:string external;
declare variable $descripcion as xs:string external;

xf:consultarReglasTrama403_Error($codigo,
    $mensaje,
    $descripcion)
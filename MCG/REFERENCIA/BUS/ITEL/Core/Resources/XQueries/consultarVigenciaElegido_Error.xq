xquery version "1.0" encoding "Cp1252";
(:: pragma bea:global-element-return element="ns0:WS_Result" location="../Schemas/PS_ITEL_CONSULTARVIGENCIAELEGIDO.xsd" ::)

declare namespace xf = "http://tempuri.org/ITEL/Core/Resources/XQueries/consultarVigenciaElegido_Res/";
declare namespace ns0 = "http://www.comcel.com.co/ConsultarVigenciaElegido/";

declare function xf:consultarVigenciaElegido_Res($codigo as xs:string, $mensaje as xs:string, $descripcion as xs:string )
    as element(ns0:WS_Result) {
        <ns0:WS_Result>
            <CODIGO>{ $codigo }</CODIGO>
            <MENSAJE>
                <VIGENCIA>{ $mensaje }</VIGENCIA>
            </MENSAJE>
            <DESCRIPCION>{ $descripcion }</DESCRIPCION>
        </ns0:WS_Result>
};

declare variable $codigo as xs:string external;
declare variable $mensaje as xs:string external;
declare variable $descripcion as xs:string external;

xf:consultarVigenciaElegido_Res($codigo, $mensaje, $descripcion)
(:: pragma bea:global-element-return element="ns0:WS_Result" location="../Schemas/PS_ITEL_CONSULTARCOBROSMSELEGIDOS.xsd" ::)

declare namespace ns0 = "http://www.comcel.com.co/ConsultarCobroSMSElegidos";
declare namespace xf = "http://tempuri.org/ITEL/Core/Resources/XQueries/consultarCobroSMSElegidos_Error/";

declare function xf:consultarCobroSMSElegidos_Error($codigo as xs:string,
    $mensaje as xs:string,
    $descripcion as xs:string)
    as element(ns0:WS_Result) {
        <ns0:WS_Result>
            <ns0:CODIGO>{ $codigo }</ns0:CODIGO>
            <ns0:MENSAJE>
                <ns0:VALOR/>
            </ns0:MENSAJE>
            <ns0:DESCRIPCION>{ $descripcion }</ns0:DESCRIPCION>
        </ns0:WS_Result>
};

declare variable $codigo as xs:string external;
declare variable $mensaje as xs:string external;
declare variable $descripcion as xs:string external;

xf:consultarCobroSMSElegidos_Error($codigo,
    $mensaje,
    $descripcion)
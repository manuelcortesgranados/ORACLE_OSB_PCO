(:: pragma bea:global-element-return element="ns0:WS_Result" location="../Schemas/PS_ITEL_BBPREPAGO.xsd" ::)

declare namespace ns0 = "http://www.comcel.com.co/BBPrepago/";
declare namespace xf = "http://tempuri.org/ITEL/BSCS/Resources/XQueries/bbPrepago_Error/";

declare function xf:bbPrepago_Error($codigo as xs:string,
    $descripcion as xs:string)
    as element(ns0:WS_Result) {
        <ns0:WS_Result>
            <CODIGO>{ $codigo }</CODIGO>
            <MENSAJE>
                <R_ERROR/>
            </MENSAJE>
            <DESCRIPCION>{ $descripcion }</DESCRIPCION>
        </ns0:WS_Result>
};

declare variable $codigo as xs:string external;
declare variable $descripcion as xs:string external;

xf:bbPrepago_Error($codigo,
    $descripcion)

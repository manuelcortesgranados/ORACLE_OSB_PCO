(:: pragma bea:global-element-return element="ns0:WS_Result" location="../Schemas/PS_ITEL_CONSULTAR_PAQUETESADD_BB.xsd" ::)

declare namespace ns0 = "http://www.comcel.com.co/consultarPaquetesAddBB/";
declare namespace xf = "http://tempuri.org/ITEL/Core/Resources/XQueries/consultarPaquetesAdd_Error/";

declare function xf:consultarPaquetesAdd_Error($codigo as xs:string,
    $descripcion as xs:string)
    as element(ns0:WS_Result) {
        <ns0:WS_Result>
            <CODIGO>{ $codigo }</CODIGO>
            <MENSAJE>
                <ACTIVO/>
                <ANIDADO/>
                <RESULTADO/>
            </MENSAJE>
            <DESCRIPCION>{ $descripcion }</DESCRIPCION>
        </ns0:WS_Result>
};

declare variable $codigo as xs:string external;
declare variable $descripcion as xs:string external;

xf:consultarPaquetesAdd_Error($codigo,
    $descripcion)

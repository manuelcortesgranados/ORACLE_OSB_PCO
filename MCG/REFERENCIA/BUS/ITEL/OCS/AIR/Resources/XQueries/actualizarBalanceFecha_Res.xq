xquery version "1.0" encoding "Cp1252";
(:: pragma bea:global-element-return element="ns2:WS_Result" location="../Schemas/PS_ITEL_ACTUALIZAR_BALANCE_FECHA.xsd" ::)

declare namespace xf = "http://tempuri.org/ITEL/OCS/Resources/XQueries/actualizarBalanceFecha_Res/";
declare namespace ns2 = "http://www.comcel.com.co/ActualizarBalanceFechaOCS/";

declare function xf:actualizarBalanceFecha_Res($codigo as xs:string, $descripcion as xs:string )
    as element(ns2:WS_Result) {
        <ns2:WS_Result>
        	<CODIGO>{ $codigo }</CODIGO>
            <MENSAJE>
              
            </MENSAJE>
            <DESCRIPCION>{ $descripcion }</DESCRIPCION>
        </ns2:WS_Result>
};

declare variable $codigo as xs:string external;
declare variable $descripcion as xs:string external;

xf:actualizarBalanceFecha_Res($codigo, $descripcion)
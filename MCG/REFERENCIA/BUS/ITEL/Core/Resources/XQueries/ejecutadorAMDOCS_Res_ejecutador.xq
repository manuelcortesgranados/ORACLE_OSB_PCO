(:: pragma bea:global-element-parameter parameter="$wS_Result1" element="ns0:WS_Result" location="../Schemas/PS_ITEL_EJECUTARTRAMA.xsd" ::)
(:: pragma bea:global-element-return element="ns0:WS_Result" location="../Schemas/PS_ITEL_EJECUTARTRAMA_ESPECIFICA.xsd" ::)

declare namespace ns0 = "http://www.comcel.com.co/EjecutarTrama/";
declare namespace xf = "http://tempuri.org/ITEL/Core/Resources/XQueries/ejecutadorEspecifica_Res_ejecutador/";


declare function xf:ejecutadorEspecifica_Res_ejecutador($wS_Result1 as element(ns0:WS_Result), $metodo as xs:string)
    as element(ns0:WS_Result) {
        <ns0:WS_Result>
            <CODIGO>{ data($wS_Result1/CODIGO) }</CODIGO>
            <MENSAJE>
                <USUARIO>{ fn:normalize-space(fn:tokenize(data($wS_Result1/MENSAJE),"!")[1]) }</USUARIO>
                <METODO>{ $metodo }</METODO>
                <CODIGO_RESPUESTA>{ data($wS_Result1/CODIGO) }</CODIGO_RESPUESTA>
                <DESCRIPCION>{ fn:normalize-space(fn:tokenize(data($wS_Result1/MENSAJE),"!")[4]) }</DESCRIPCION>
                {                  
                  <PARAMETROS/>
                }                
            </MENSAJE>
            <DESCRIPCION>{ fn:normalize-space(fn:tokenize(data($wS_Result1/MENSAJE),"!")[4]) }</DESCRIPCION>
        </ns0:WS_Result>
};

declare variable $wS_Result1 as element(ns0:WS_Result) external;
declare variable $metodo as xs:string external;

xf:ejecutadorEspecifica_Res_ejecutador($wS_Result1, $metodo)
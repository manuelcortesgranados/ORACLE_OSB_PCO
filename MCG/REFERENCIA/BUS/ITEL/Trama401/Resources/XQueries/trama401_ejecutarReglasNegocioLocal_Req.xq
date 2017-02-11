(:: pragma bea:global-element-parameter parameter="$trama" element="ns1:TRAMA" location="../../../Core/Resources/Schemas/DA_TRAMA.xsd" ::)
(:: pragma bea:global-element-parameter parameter="$parametros" element="ns2:WS_Result" location="../Schemas/PS_ITEL_VALIDARTRAMA401.xsd" ::)
(:: pragma bea:global-element-return element="ns0:Input_Parameters" location="../../../Core/Resources/Schemas/PS_ITEL_EJECUTARREGLASNEGOCIO.xsd" ::)

declare namespace ns2 = "http://www.comcel.com.co/ValidarTrama401/";
declare namespace ns1 = "http://www.comcel.com.co/DA_TRAMA";
declare namespace ns0 = "http://www.comcel.com.co/EjecutarReglasNegocio/";
declare namespace xf = "http://tempuri.org/ITEL/Trama401/Resources/XQueries/trama401_ejecutarReglasNegocioLocal_Req/";

declare function xf:trama401_ejecutarReglasNegocioLocal_Req($trama as element(ns1:TRAMA),
    $parametros as element(ns2:WS_Result),
    $indestino as xs:string,
    $inorigen as xs:string,
    $prefijo as xs:string,
    $tiempo as xs:dateTime,
    $timeout as xs:integer)
    as element(ns0:Input_Parameters) {
        <ns0:Input_Parameters>
            <METODO>{ data($trama/ns1:METODO) }</METODO>
            <MIN_DESTINO>{ data($trama/ns1:MIN) }</MIN_DESTINO>
            <MIN_ORIGEN>{ data($parametros/MENSAJE/MINORIGEN) }</MIN_ORIGEN>
            <IN_DESTINO>{ $indestino }</IN_DESTINO>
            <IN_ORIGEN>{ $inorigen }</IN_ORIGEN>
            <PREFIJO>{ $prefijo }</PREFIJO>
            <CONSECUTIVO>{ data($parametros/MENSAJE/CONSECUTIVO) }</CONSECUTIVO>
            <PARAMETROS_TRAMA>
            	<PARAMETRO>
                    <NOMBRE>MINORIGEN</NOMBRE>
                    <TIPO>string</TIPO>
                    <VALOR>{ data($parametros/MENSAJE/MINORIGEN) }</VALOR>
                </PARAMETRO>
                <PARAMETRO>
                    <NOMBRE>COMENTARIO</NOMBRE>
                    <TIPO>string</TIPO>
                    <VALOR>{ data($parametros/MENSAJE/COMENTARIO) }</VALOR>
                </PARAMETRO>
                <PARAMETRO>
                    <NOMBRE>HOSTID</NOMBRE>
                    <TIPO>string</TIPO>
                    <VALOR>{ data($parametros/MENSAJE/HOSTID) }</VALOR>
                </PARAMETRO>
                <PARAMETRO>
                    <NOMBRE>CONSECUTIVO</NOMBRE>
                    <TIPO>decimal</TIPO>
                    <VALOR>{ data($parametros/MENSAJE/CONSECUTIVO) }</VALOR>
                </PARAMETRO>
                <PARAMETRO>
                    <NOMBRE>MONTORECARGA</NOMBRE>
                    <TIPO>decimal</TIPO>
                    <VALOR>{ data($parametros/MENSAJE/MONTORECARGA) }</VALOR>
                </PARAMETRO>
                <PARAMETRO>
                    <NOMBRE>BONIFICAR</NOMBRE>
                    <TIPO>string</TIPO>
                    <VALOR>{ data($parametros/MENSAJE/BONIFICAR) }</VALOR>
                </PARAMETRO>
                <PARAMETRO>
                    <NOMBRE>DIASVIGENCIA</NOMBRE>
                    <TIPO>decimal</TIPO>
                    <VALOR>{ data($parametros/MENSAJE/DIASVIGENCIA) }</VALOR>
                </PARAMETRO>
            </PARAMETROS_TRAMA>
            <TIEMPO_INICIO>{ $tiempo }</TIEMPO_INICIO>
            <TIMEOUT>{ $timeout }</TIMEOUT>
        </ns0:Input_Parameters>
};

declare variable $trama as element(ns1:TRAMA) external;
declare variable $parametros as element(ns2:WS_Result) external;
declare variable $indestino as xs:string external;
declare variable $inorigen as xs:string external;
declare variable $prefijo as xs:string external;
declare variable $tiempo as xs:dateTime external;
declare variable $timeout as xs:integer external;

xf:trama401_ejecutarReglasNegocioLocal_Req($trama,
    $parametros,
    $indestino,
    $inorigen,
    $prefijo,
    $tiempo,
    $timeout)
(:: pragma bea:global-element-parameter parameter="$reglasNegocioRequest" element="ns2:Input_Parameters" location="../Schemas/PS_ITEL_EJECUTARREGLASNEGOCIO.xsd" ::)
(:: pragma bea:global-element-parameter parameter="$reglasNegocioResponse" element="ns2:WS_Result" location="../Schemas/PS_ITEL_EJECUTARREGLASNEGOCIO.xsd" ::)
(:: pragma bea:global-element-return element="ns0:Input_Parameters" location="../Schemas/PS_ITEL_EJECUTADOR.xsd" ::)

declare namespace ns2 = "http://www.comcel.com.co/EjecutarReglasNegocio/";
declare namespace ns1 = "http://www.comcel.com.co/IN/OperacionCorba";
declare namespace ns3 = "http://www.comcel.com.co/DA_TRAMA";
declare namespace ns0 = "http://www.comcel.com.co/Ejecutador/";
declare namespace xf = "http://tempuri.org/ITEL/Core/Resources/XQueries/ejecutador_Req/";

declare function xf:ejecutador_Req($reglasNegocioRequest as element(ns2:Input_Parameters),
    $reglasNegocioResponse as element(ns2:WS_Result),
    $timeout as xs:integer)
    as element(ns0:Input_Parameters) {
        <ns0:Input_Parameters>
            <METODO>{ data($reglasNegocioRequest/METODO) }</METODO>
            <MIN_DESTINO>{ data($reglasNegocioRequest/MIN_DESTINO) }</MIN_DESTINO>
            <MIN_ORIGEN>{ data($reglasNegocioRequest/MIN_ORIGEN) }</MIN_ORIGEN>
            <IN_DESTINO>{ data($reglasNegocioRequest/IN_DESTINO) }</IN_DESTINO>
            <IN_ORIGEN>{ data($reglasNegocioRequest/IN_ORIGEN) }</IN_ORIGEN>
            <CONSECUTIVO>{ data($reglasNegocioRequest/CONSECUTIVO) }</CONSECUTIVO>
            <PARAMETROS_TRAMA>
                {
                    for $PARAMETRO in $reglasNegocioRequest/PARAMETROS_TRAMA/PARAMETRO
                    return
                        <PARAMETRO>{ $PARAMETRO/@* , $PARAMETRO/node() }</PARAMETRO>
                }
            </PARAMETROS_TRAMA>
            <PARAMETROS_NEGOCIO>
                {
                    for $PARAMETRO in $reglasNegocioResponse/MENSAJE/PARAMETROS_REGLAS/PARAMETRO
                    return
                        <PARAMETRO>{ $PARAMETRO/@* , $PARAMETRO/node() }</PARAMETRO>
                }
            </PARAMETROS_NEGOCIO>
            <SUSCRIPTOR_DESTINO>{ $reglasNegocioResponse/MENSAJE/SUSCRIPTOR_DESTINO/@* , $reglasNegocioResponse/MENSAJE/SUSCRIPTOR_DESTINO/node() }</SUSCRIPTOR_DESTINO>
            <SUSCRIPTOR_ORIGEN>{ $reglasNegocioResponse/MENSAJE/SUSCRIPTOR_ORIGEN/@* , $reglasNegocioResponse/MENSAJE/SUSCRIPTOR_ORIGEN/node() }</SUSCRIPTOR_ORIGEN>
            <TIEMPO_INICIO>{ data($reglasNegocioRequest/TIEMPO_INICIO) }</TIEMPO_INICIO>
            <TIMEOUT>{ $timeout }</TIMEOUT>
        </ns0:Input_Parameters>
};

declare variable $reglasNegocioRequest as element(ns2:Input_Parameters) external;
declare variable $reglasNegocioResponse as element(ns2:WS_Result) external;
declare variable $timeout as xs:integer external;

xf:ejecutador_Req($reglasNegocioRequest,
    $reglasNegocioResponse,
    $timeout)
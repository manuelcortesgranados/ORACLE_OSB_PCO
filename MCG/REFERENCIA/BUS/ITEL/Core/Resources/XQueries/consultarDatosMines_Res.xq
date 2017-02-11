(:: pragma bea:global-element-parameter parameter="$datosDestino" element="ns0:WS_Result" location="../../../IN/Resources/Schemas/PS_ITEL_CONSULTAR_SUSCRIPTOR.xsd" ::)
(:: pragma bea:global-element-parameter parameter="$datosOrigen" element="ns0:WS_Result" location="../../../IN/Resources/Schemas/PS_ITEL_CONSULTAR_SUSCRIPTOR.xsd" ::)
(:: pragma bea:global-element-return element="ns1:WS_Result" location="../Schemas/PS_ITEL_CONSULTARDATOSMINES.xsd" ::)

declare namespace ns2 = "http://www.comcel.com.co/IN/OperacionCorba";
declare namespace ns1 = "http://www.comcel.com.co/ConsultarDatosMines/";
declare namespace ns0 = "http://www.comcel.com.co/ConsultarSuscriptorIN/";
declare namespace xf = "http://tempuri.org/ITEL/Core/Resources/XQueries/consultarDatosMines_Res/";

declare function xf:consultarDatosMines_Res($datosDestino as element(ns0:WS_Result),
    $datosOrigen as element(ns0:WS_Result))
    as element(ns1:WS_Result) {
        <ns1:WS_Result>
            {
              if( fn:string-length($datosOrigen/CODIGO) > 0 and $datosOrigen/CODIGO/text() != "1"  ) then
                <CODIGO>{ data($datosOrigen/CODIGO) }</CODIGO>
              else if( fn:string-length($datosDestino/CODIGO) > 0 and $datosDestino/CODIGO/text() != "1"  ) then
                <CODIGO>{ data($datosDestino/CODIGO) }</CODIGO>
              else
                <CODIGO>1</CODIGO>
            }
            <MENSAJE clusterDestino = "{ data($datosDestino/MENSAJE/CONSULTAR_SUSCRIPTOR/@cluster) }"
                     clusterOrigen = "{ data($datosOrigen/MENSAJE/CONSULTAR_SUSCRIPTOR/@cluster) }">
                <DatosDestino>{ $datosDestino/MENSAJE/CONSULTAR_SUSCRIPTOR/ns2:suscriptor/@* , $datosDestino/MENSAJE/CONSULTAR_SUSCRIPTOR/ns2:suscriptor/node() }</DatosDestino>
                <DatosOrigen>{ $datosOrigen/MENSAJE/CONSULTAR_SUSCRIPTOR/ns2:suscriptor/@* , $datosOrigen/MENSAJE/CONSULTAR_SUSCRIPTOR/ns2:suscriptor/node() }</DatosOrigen>
            </MENSAJE>
        </ns1:WS_Result>
};

declare variable $datosDestino as element(ns0:WS_Result) external;
declare variable $datosOrigen as element(ns0:WS_Result) external;

xf:consultarDatosMines_Res($datosDestino,
    $datosOrigen)
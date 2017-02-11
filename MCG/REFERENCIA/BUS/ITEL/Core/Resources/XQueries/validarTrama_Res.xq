(:: pragma bea:global-element-parameter parameter="$tramaXML" element="ns1:TRAMA" location="../Schemas/DA_TRAMA.xsd" ::)
(:: pragma bea:global-element-return element="ns0:WS_Result" location="../Schemas/PS_ITEL_VALIDARTRAMA.xsd" ::)

declare namespace ns1 = "http://www.comcel.com.co/DA_TRAMA";
declare namespace ns0 = "http://www.comcel.com.co/ValidarTrama/";
declare namespace xf = "http://tempuri.org/ITEL/Core/Resources/XQueries/validarTrama_Res/";

declare function xf:validarTrama_Res($codigoError as xs:string,
    $tramaXML as element(ns1:TRAMA),
    $inDestino as xs:string,
    $inOrigen as xs:string,
    $timeouts as xs:integer*,
    $duraciones as xs:integer*,
    $descripcion as xs:string,
    $contrato as xs:string,
    $contratoEsPostpago,
    $categoria as xs:string,
    $cargaInicial as xs:string,
    $bloquea as xs:string,
    $vigencia as xs:string,
    $plataforma as xs:string
    )
    as element(ns0:WS_Result) {
        <ns0:WS_Result>
            <CODIGO>{ $codigoError }</CODIGO>
            <MENSAJE>
                <TRAMA>
                    <ns1:TRAMA>{ data($tramaXML/ns1:TRAMA) }</ns1:TRAMA>
                    <ns1:USUARIO>{ data($tramaXML/ns1:USUARIO) }</ns1:USUARIO>
                    <ns1:CLAVE>{ data($tramaXML/ns1:CLAVE) }</ns1:CLAVE>
                    <ns1:METODO>{ data($tramaXML/ns1:METODO) }</ns1:METODO>
                    <ns1:MIN>{ data($tramaXML/ns1:MIN) }</ns1:MIN>
                    <ns1:CADENA_PARAMETROS>{ data($tramaXML/ns1:CADENA_PARAMETROS) }</ns1:CADENA_PARAMETROS>
                    <ns1:PARAMETROS>{ $tramaXML/ns1:PARAMETROS/@* , $tramaXML/ns1:PARAMETROS/node() }</ns1:PARAMETROS>
                </TRAMA>
                <IN_DESTINO>{ $inDestino }</IN_DESTINO>
                <IN_ORIGEN>{ $inOrigen }</IN_ORIGEN>
                <CONTRATO>{ $contrato }</CONTRATO>
                <CONTRATOESPOSTPAGO> { $contratoEsPostpago } </CONTRATOESPOSTPAGO>
                <CATEGORIA> { $categoria } </CATEGORIA>
                <CARGAINICIAL> { $cargaInicial } </CARGAINICIAL>
                <BLOQUEA> { $bloquea } </BLOQUEA>
                <VIGENCIA> { $vigencia } </VIGENCIA>
                <TIMEOUT_VALIDACION>{ $timeouts[1] }</TIMEOUT_VALIDACION>
                <TIMEOUT_CONSULTA>{ $timeouts[2] }</TIMEOUT_CONSULTA>
                <TIMEOUT_PROVISION>{ $timeouts[3] }</TIMEOUT_PROVISION>
                <TIMEOUT_FINAL>{ $timeouts[4] }</TIMEOUT_FINAL>
                <DURACION_GENERAL>{ $duraciones[1] }</DURACION_GENERAL>
                <DURACION_ESPECIFICA>{ $duraciones[2] }</DURACION_ESPECIFICA>
                <PLATAFORMA>{ $plataforma }</PLATAFORMA>
            </MENSAJE>
            <DESCRIPCION>{ $descripcion }</DESCRIPCION>
        </ns0:WS_Result>
};

declare variable $codigoError as xs:string external;
declare variable $tramaXML as element(ns1:TRAMA) external;
declare variable $inDestino as xs:string external;
declare variable $inOrigen as xs:string external;
declare variable $timeouts as xs:integer* external;
declare variable $duraciones as xs:integer* external;
declare variable $descripcion as xs:string external;
declare variable $contrato as xs:string external;
declare variable $contratoEsPostpago as xs:string external;
declare variable $categoria as xs:string external;
declare variable $cargaInicial as xs:string external;
declare variable $bloquea as xs:string external;
declare variable $vigencia as xs:string external;
declare variable $plataforma as xs:string external;


xf:validarTrama_Res($codigoError,
    $tramaXML,
    $inDestino,
    $inOrigen,
    $timeouts,
    $duraciones,
    $descripcion,
    $contrato,
    $contratoEsPostpago,
    $categoria,
    $cargaInicial,
    $bloquea,
    $vigencia,
    $plataforma)
(:: pragma bea:local-element-return type="ns0:TRAMA/ns0:PARAMETROS" location="../Schemas/DA_TRAMA.xsd" ::)

declare namespace ns0 = "http://www.comcel.com.co/DA_TRAMA";
declare namespace xf = "http://tempuri.org/ITEL/Core/Resources/XQueries/adaptarParametrosValidarTrama/";

declare function xf:adaptarParametrosValidarTrama2($minOrigen as xs:string,
    $comentario as xs:string,
    $hostId as xs:string,
    $consecutivo as xs:string,
    $monto as xs:string,
    $bonificar as xs:string,
    $diasVigencia as xs:string)
    as element() {
        <ns0:PARAMETROS>
            <ns0:MINORIGEN>{ $minOrigen }</ns0:MINORIGEN>
            <ns0:COMENTARIO>{ $comentario }</ns0:COMENTARIO>
            <ns0:HOSTID>{ $hostId }</ns0:HOSTID>
            <ns0:CONSECUTIVO>{ $consecutivo }</ns0:CONSECUTIVO>
            <ns0:MONTORECARGA>{ $monto }</ns0:MONTORECARGA>
            <ns0:BONIFICAR>{ $bonificar }</ns0:BONIFICAR>
            <ns0:DIASVIGENCIA>{ $diasVigencia }</ns0:DIASVIGENCIA>
        </ns0:PARAMETROS>
};

declare variable $minOrigen as xs:string external;
declare variable $comentario as xs:string external;
declare variable $hostId as xs:string external;
declare variable $consecutivo as xs:string external;
declare variable $monto as xs:string external;
declare variable $bonificar as xs:string external;
declare variable $diasVigencia as xs:string external;

xf:adaptarParametrosValidarTrama2($minOrigen,
    $comentario,
    $hostId,
    $consecutivo,
    $monto,
    $bonificar,
    $diasVigencia)
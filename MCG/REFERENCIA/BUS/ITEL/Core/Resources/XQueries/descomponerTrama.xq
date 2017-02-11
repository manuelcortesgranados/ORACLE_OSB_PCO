(:: pragma bea:global-element-return element="ns0:TRAMA" location="../Schemas/DA_TRAMA.xsd" ::)

declare namespace ns0 = "http://www.comcel.com.co/DA_TRAMA";
declare namespace xf = "http://tempuri.org/ITEL/Core/Resources/XQueries/descomponerTrama/";

declare function xf:descomponerTrama($trama as xs:string)
    as element(ns0:TRAMA) {
        let $campos := fn:tokenize($trama, '!')
        return
            <ns0:TRAMA>
                <ns0:TRAMA>{ $trama }</ns0:TRAMA>
                <ns0:USUARIO>{ $campos[1] }</ns0:USUARIO>
                <ns0:CLAVE>{ $campos[2] }</ns0:CLAVE>
                <ns0:METODO>{ $campos[3] }</ns0:METODO>
                <ns0:MIN>{ $campos[4] }</ns0:MIN>
                <ns0:CADENA_PARAMETROS>{ $campos[5] }</ns0:CADENA_PARAMETROS>
            </ns0:TRAMA>
};

declare variable $trama as xs:string external;

xf:descomponerTrama($trama)
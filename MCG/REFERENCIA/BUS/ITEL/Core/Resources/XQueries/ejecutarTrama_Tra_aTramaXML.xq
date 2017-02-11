(:: pragma bea:global-element-return element="ns0:TRAMA" location="../Schemas/DA_TRAMA.xsd" ::)

declare namespace ns0 = "http://www.comcel.com.co/DA_TRAMA";
declare namespace xf = "http://tempuri.org/ITEL/Core/Resources/XQueries/ejecutarTrama_Tra_aTramaXML/";

declare function xf:ejecutarTrama_Tra_aTramaXML($trama as xs:string)
    as element(ns0:TRAMA) {
    let $partes :=fn:tokenize($trama, '!')  
		return
        <ns0:TRAMA>
        	<ns0:CAMPOS>{count($partes)}</ns0:CAMPOS>
            <ns0:USUARIO>{$partes[1]}</ns0:USUARIO>
            <ns0:CLAVE>{$partes[2]}</ns0:CLAVE>
            <ns0:METODO>{$partes[3]}</ns0:METODO>
            <ns0:MIN>{$partes[4]}</ns0:MIN>
            <ns0:PARAMETROS>{$partes[5]}</ns0:PARAMETROS>
            <ns0:FIN>{$partes[6]}</ns0:FIN>
        </ns0:TRAMA>
};

declare variable $trama as xs:string external;

xf:ejecutarTrama_Tra_aTramaXML($trama)
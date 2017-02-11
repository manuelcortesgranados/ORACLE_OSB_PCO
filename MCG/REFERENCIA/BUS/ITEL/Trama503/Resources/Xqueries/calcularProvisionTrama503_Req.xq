(:: pragma bea:global-element-parameter parameter="$input_Parameters1" element="ns3:Input_Parameters" location="../Schemas/PS_ITEL_CALCULARPROVISIONTRAMA503.xsd" ::)
(:: pragma bea:global-element-return element="ns2:callFunctionStateless" location="../WSDLs/trama503Provision_DB.wsdl" ::)

declare namespace ns2 = "http://xmlns.oracle.com/Trama503Provision/Trama503Provision_DF_Trama503Provision";
declare namespace ns1 = "http://xmlns.oracle.com/bpel";
declare namespace ns3 = "http://www.comcel.com.co/CalcularProvisionTrama503/";
declare namespace ns0 = "http://www.comcel.com.co/Ejecutador/";
declare namespace xf = "http://tempuri.org/ITEL/Trama503/Resources/XQueries/calcularProvisionTrama503_Req/";

declare function xf:isExpired($fechaString as xs:string)
    as xs:boolean {
    	let $fechaActual := xs:date(substring(xs:string(current-date()), 1, 10))
    	let $fechaCUENTA := xs:date(substring($fechaString, 1, 10))
    	return if ($fechaActual > $fechaCUENTA) then xs:boolean("true") else xs:boolean("false")
};
declare function xf:expirationDate($fechaString as xs:string, $diasVigencia as xs:decimal)
    as xs:integer {
    	let $fechaActual := xs:dateTime(concat(substring(xs:string(current-date()), 1, 10), "T00:00:00-05:00"))
    	let $fechaCUENTA := xs:dateTime(concat(substring($fechaString, 1, 10), "T00:00:00-05:00"))
    	let $duracion := xdt:dayTimeDuration(concat("P", $diasVigencia, "D"))
    	let $fechaExpiracion := $fechaActual + $duracion
    	let $diferencia := fn:days-from-duration($fechaExpiracion - $fechaCUENTA)
    	return if ($diferencia > 0) then $diferencia else 0 
};

declare function xf:calcularProvisionTrama503_Req($input_Parameters1 as element(ns3:Input_Parameters))
    as element(ns2:callFunctionStateless) {
        <ns2:callFunctionStateless>
            <ns2:parameterList>
                <ns0:TRAMA_EJECUCION>
                    <ns0:MIN>{ xs:decimal($input_Parameters1/MIN) }</ns0:MIN>
                    <ns0:PARAMETROSTRAMA>
                        <ns0:OFFERID>{ data($input_Parameters1/PARAMETROSTRAMA/PARAMETRO[NOMBRE="COMENTARIO"]/VALOR) }</ns0:OFFERID>
                        <ns0:PRODUCTID>{ data($input_Parameters1/PARAMETROSTRAMA/PARAMETRO[NOMBRE="PRODUCT_ID"]/VALOR) }</ns0:PRODUCTID>
                        <ns0:AIRPTF>{ data($input_Parameters1/PARAMETROSTRAMA/PARAMETRO[NOMBRE="PLATAFORMA_PAQUETE"]/VALOR) }</ns0:AIRPTF>
                        (:<ns0:SUBSCRIPTIONID>{ data($input_Parameters1/PARAMETROSTRAMA/PARAMETRO[NOMBRE="SUBSCRIPTIONID"]/VALOR) }</ns0:SUBSCRIPTIONID>:)
                    </ns0:PARAMETROSTRAMA>
                    <ns0:CODIGOPLATAFORMA>{ data($input_Parameters1/CODIGOIN) }</ns0:CODIGOPLATAFORMA>
                    <ns0:SERVICIOSEJECUCION />
                    <ns0:ERROR>1</ns0:ERROR>
                </ns0:TRAMA_EJECUCION>
            </ns2:parameterList>
        </ns2:callFunctionStateless>
};

declare variable $input_Parameters1 as element(ns3:Input_Parameters) external;

xf:calcularProvisionTrama503_Req($input_Parameters1)
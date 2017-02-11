(:: pragma bea:global-element-parameter parameter="$input_Parameters" element="ns2:Input_Parameters" location="../Schemas/PS_ITEL_CALCULARPROVISIONTRAMA414.xsd" ::)
(:: pragma bea:global-element-return element="ns1:callFunctionStateless" location="../WSDLs/trama414Provision_DB.wsdl" ::)

declare namespace ns2 = "http://www.comcel.com.co/CalcularProvisionTrama414/";
declare namespace ns1 = "http://xmlns.oracle.com/trama414provision/trama414provision_DF_CalcularProvTrama414";
declare namespace ns0 = "http://www.comcel.com.co/Ejecutador/";
declare namespace xf = "http://tempuri.org/ITEL/Trama414/Resources/XQueries/calcular/";

declare function xf:isExpiredOnpeak($fechaString as xs:string)
    as xs:boolean {
    	let $fechaActual := xs:date(substring(xs:string(current-date()), 1, 10))
    	let $fechaOnPeak := xs:date(substring($fechaString, 1, 10))
    	return if ($fechaActual > $fechaOnPeak) then xs:boolean("true") else xs:boolean("false")
};
declare function xf:expirationDate($fechaString as xs:string, $diasVigencia as xs:decimal)
    as xs:integer {
    	let $fechaActual := xs:dateTime(concat(substring(xs:string(current-date()), 1, 10), "T00:00:00-05:00"))
    	let $fechaOnPeak := xs:dateTime(concat(substring($fechaString, 1, 10), "T00:00:00-05:00"))
    	let $duracion := xdt:dayTimeDuration(concat("P", $diasVigencia, "D"))
    	let $fechaExpiracion := $fechaActual + $duracion
    	let $diferencia := fn:days-from-duration($fechaExpiracion - $fechaOnPeak)
    	return if ($diferencia > 0) then $diferencia else 0
};

declare function xf:calcular($input_Parameters as element(ns2:Input_Parameters))
    as element(ns1:callFunctionStateless) {
        <ns1:callFunctionStateless name = "trama414provision_DF_CalcularProvTrama414">
            <ns1:parameterList>
                <ns0:TRAMA_EJECUCION>
                    <ns0:MINORIGEN>{ data($input_Parameters/MINORIGEN) }</ns0:MINORIGEN>
                    <ns0:MINDESTINO>{ data($input_Parameters/MINDESTINO) }</ns0:MINDESTINO>
                    <ns0:PARAMETROSTRAMA>                        
                        <ns0:CODIGO_COBRO>{ data($input_Parameters/PARAMETROSTRAMA/PARAMETRO[NOMBRE='DIASVIGENCIA']/VALOR) }</ns0:CODIGO_COBRO>
                        <ns0:COMENTARIO>{ data($input_Parameters/PARAMETROSTRAMA/PARAMETRO[NOMBRE='COMENTARIO']/VALOR) }</ns0:COMENTARIO>
                        <ns0:HOSTID>{ data($input_Parameters/PARAMETROSTRAMA/PARAMETRO[NOMBRE='HOSTID']/VALOR) }</ns0:HOSTID>
                        <ns0:CONSECUTIVO>{ data($input_Parameters/PARAMETROSTRAMA/PARAMETRO[NOMBRE='CONSECUTIVO']/VALOR) }</ns0:CONSECUTIVO>
                    </ns0:PARAMETROSTRAMA>
                    <ns0:PARAMETROSNEGOCIO>
                        <ns0:COMENTARIO_PAQUETE>{ data($input_Parameters/PARAMETROSNEGOCIO/PARAMETRO[NOMBRE='COMENTARIO']/VALOR) }</ns0:COMENTARIO_PAQUETE>
                        <ns0:HOSTID_PAQUETE>{ data($input_Parameters/PARAMETROSNEGOCIO/PARAMETRO[NOMBRE='HOSTID']/VALOR) }</ns0:HOSTID_PAQUETE>
                        <ns0:VALOR>{ data($input_Parameters/PARAMETROSNEGOCIO/PARAMETRO[NOMBRE='VALOR']/VALOR) }</ns0:VALOR>
                        <ns0:TIPO_PAQUETE>{ data($input_Parameters/PARAMETROSNEGOCIO/PARAMETRO[NOMBRE='TIPO_PAQUETE']/VALOR) }</ns0:TIPO_PAQUETE>
                        <ns0:TIPONOTIFICACION>{ data($input_Parameters/PARAMETROSTRAMA/PARAMETRO[NOMBRE='TIPONOTIFICACION']/VALOR) }</ns0:TIPONOTIFICACION>
                        <ns0:NOTIFICACION>{ data($input_Parameters/PARAMETROSNEGOCIO/PARAMETRO[NOMBRE='NOTIFICACION']/VALOR) }</ns0:NOTIFICACION>
                        <ns0:PAQUETES>
                        <ns0:SIZE>{count($input_Parameters/PARAMETROSNEGOCIO/PARAMETRO[NOMBRE='PAQUETES']/VALOR/PAQUETE[string(.)])}</ns0:SIZE>
                        {                        
                            for $PAQUETE in $input_Parameters/PARAMETROSNEGOCIO/PARAMETRO[NOMBRE='PAQUETES']/VALOR/PAQUETE
                            return                                
                                    <ns0:PAQUETE>
                                        <ns0:CODIGO_PAQUETE>{ data($PAQUETE/CODIGO_PAQUETE) }</ns0:CODIGO_PAQUETE>
                                        <ns0:PLATAFORMA>{ data($PAQUETE/PLATAFORMA) }</ns0:PLATAFORMA>
                                    </ns0:PAQUETE>
                               
                        }</ns0:PAQUETES>
                    </ns0:PARAMETROSNEGOCIO>
                    <ns0:CODIGOPLATAFORMAORIGEN>{ data($input_Parameters/INORIGEN) }</ns0:CODIGOPLATAFORMAORIGEN>
                    <ns0:CODIGOPLATAFORMADESTINO>{ data($input_Parameters/INDESTINO) }</ns0:CODIGOPLATAFORMADESTINO>
                    <ns0:ERROR>1</ns0:ERROR>
                    <ns0:SERVICIOSEJECUCION/>
                </ns0:TRAMA_EJECUCION>
            </ns1:parameterList>
        </ns1:callFunctionStateless>
};

declare variable $input_Parameters as element(ns2:Input_Parameters) external;

xf:calcular($input_Parameters)

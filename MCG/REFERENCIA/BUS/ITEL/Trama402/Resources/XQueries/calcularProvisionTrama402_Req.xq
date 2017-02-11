(:: pragma bea:global-element-parameter parameter="$input_Parameters1" element="ns1:Input_Parameters" location="../Schemas/PS_ITEL_CALCULARPROVISIONTRAMA402.xsd" ::)
(:: pragma bea:global-element-return element="ns2:callFunctionStateless" location="../WSDLs/trama402Provision_DB.wsdl" ::)

declare namespace ns2 = "http://xmlns.oracle.com/Trama402Provision/Trama402Provision_DF_Trama402Provision";
declare namespace ns1 = "http://www.comcel.com.co/CalcularProvisionTrama402/";
declare namespace ns3 = "http://xmlns.oracle.com/bpel";
declare namespace ns0 = "http://www.comcel.com.co/Ejecutador/";
declare namespace xf = "http://tempuri.org/ITEL/Trama402/Resources/XQueries/calcularProvisionTrama402_Req/";

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

declare function xf:calcularProvisionTrama402_Req($input_Parameters1 as element(ns1:Input_Parameters))
    as element(ns2:callFunctionStateless) {
        <ns2:callFunctionStateless name = "Trama402Provision_DF_Trama402Provision">
            <ns2:parameterList>
                <ns0:TRAMA_EJECUCION>
                <ns0:MINORIGEN>{ xs:decimal($input_Parameters1/MINORIGEN) }</ns0:MINORIGEN>
                <ns0:MINDESTINO>{ xs:decimal($input_Parameters1/MINDESTINO) }</ns0:MINDESTINO>
                    <ns0:PARAMETROSTRAMA>
                        <ns0:COMENTARIO>{ data($input_Parameters1/PARAMETROSTRAMA/PARAMETRO[2]/VALOR) }</ns0:COMENTARIO>
                        <ns0:CONSECUTIVO>{ data($input_Parameters1/PARAMETROSTRAMA/PARAMETRO[4]/VALOR) }</ns0:CONSECUTIVO>
                    </ns0:PARAMETROSTRAMA>
                    {if ($input_Parameters1/CODIGOINDESTINO <= 50) then 
                    <ns0:PARAMETROSNEGOCIO>
                        <ns0:ACREDITAONPEAK>{ if ("TRUE" = $input_Parameters1/PARAMETROSNEGOCIO/PARAMETRO[1]/VALOR/text()) then "true" else "false" }</ns0:ACREDITAONPEAK>
                        <ns0:MONTOONPEAKORIGEN>{ if (fn:empty($input_Parameters1/PARAMETROSNEGOCIO/PARAMETRO[2]/VALOR/text())) then xs:decimal("0") else xs:decimal($input_Parameters1/PARAMETROSNEGOCIO/PARAMETRO[2]/VALOR) }</ns0:MONTOONPEAKORIGEN>
                        <ns0:MONTOONPEAKDESTINO>{ if (fn:empty($input_Parameters1/PARAMETROSNEGOCIO/PARAMETRO[3]/VALOR/text())) then xs:decimal("0") else xs:decimal($input_Parameters1/PARAMETROSNEGOCIO/PARAMETRO[3]/VALOR) }</ns0:MONTOONPEAKDESTINO>
                        <ns0:MODIFICAVIGENCIAONPEAK>{ if ("TRUE" = $input_Parameters1/PARAMETROSNEGOCIO/PARAMETRO[4]/VALOR/text()) then "true" else "false" }</ns0:MODIFICAVIGENCIAONPEAK>
                        <ns0:VIGENCIAONPEAK>{ if (fn:empty($input_Parameters1/PARAMETROSNEGOCIO/PARAMETRO[5]/VALOR/text())) then xs:decimal("0") else xs:decimal($input_Parameters1/PARAMETROSNEGOCIO/PARAMETRO[5]/VALOR) }</ns0:VIGENCIAONPEAK>
                    </ns0:PARAMETROSNEGOCIO>
                    else
                    <ns0:PARAMETROSNEGOCIO>
                        <ns0:ACREDITAONPEAK>{ if ("TRUE" = $input_Parameters1/PARAMETROSNEGOCIO/PARAMETRO[1]/VALOR/text()) then "true" else "false" }</ns0:ACREDITAONPEAK>
                        <ns0:MONTOONPEAKORIGEN>{ if (fn:empty($input_Parameters1/PARAMETROSNEGOCIO/PARAMETRO[2]/VALOR/text())) then xs:decimal("0") else xs:decimal($input_Parameters1/PARAMETROSNEGOCIO/PARAMETRO[2]/VALOR) }</ns0:MONTOONPEAKORIGEN>
                        <ns0:MONTOONPEAKDESTINO>{ if (fn:empty($input_Parameters1/PARAMETROSTRAMA/PARAMETRO[5]/VALOR/text())) then xs:decimal("0") else xs:decimal($input_Parameters1/PARAMETROSTRAMA/PARAMETRO[5]/VALOR) }</ns0:MONTOONPEAKDESTINO>
                        <ns0:MODIFICAVIGENCIAONPEAK>{ if ("TRUE" = $input_Parameters1/PARAMETROSNEGOCIO/PARAMETRO[4]/VALOR/text()) then "true" else "false" }</ns0:MODIFICAVIGENCIAONPEAK>
                        <ns0:VIGENCIAONPEAK>{ if (fn:empty($input_Parameters1/PARAMETROSNEGOCIO/PARAMETRO[5]/VALOR/text())) then xs:decimal("0") else xs:decimal($input_Parameters1/PARAMETROSNEGOCIO/PARAMETRO[5]/VALOR) }</ns0:VIGENCIAONPEAK>
                    </ns0:PARAMETROSNEGOCIO>                    
                    }
                    {if ($input_Parameters1/CODIGOINORIGEN <= 50) then  
                    <ns0:SUSCRIPTORORIGEN>
                        <ns0:ONPEAKEXPIRYDATE>{ data($input_Parameters1/SUSCRIPTORORIGEN/*:OnPeakAccountID/*:ExpiryDate) }</ns0:ONPEAKEXPIRYDATE>
                        <ns0:ISEXPIREDONPEAK>{ xf:isExpiredOnpeak(data($input_Parameters1/SUSCRIPTORORIGEN/*:OnPeakAccountID/*:ExpiryDate)) }</ns0:ISEXPIREDONPEAK>
                        <ns0:EXPIRATIONDATE>{ xf:expirationDate(data($input_Parameters1/SUSCRIPTORORIGEN/*:OnPeakAccountID/*:ExpiryDate), xs:decimal($input_Parameters1/PARAMETROSNEGOCIO/PARAMETRO[5]/VALOR)) }</ns0:EXPIRATIONDATE>
                        <ns0:ONPEAKBALANCE>{ xs:decimal($input_Parameters1/SUSCRIPTORORIGEN/*:OnPeakAccountID/*:Balance) }</ns0:ONPEAKBALANCE>
                    </ns0:SUSCRIPTORORIGEN>
                    else
                    <ns0:SUSCRIPTORORIGEN>
                        <ns0:ONPEAKEXPIRYDATE></ns0:ONPEAKEXPIRYDATE>
                        <ns0:ISEXPIREDONPEAK>false</ns0:ISEXPIREDONPEAK>
                        <ns0:EXPIRATIONDATE></ns0:EXPIRATIONDATE>
                        <ns0:ONPEAKBALANCE>0</ns0:ONPEAKBALANCE>
                    </ns0:SUSCRIPTORORIGEN>
                    }
                    {if ($input_Parameters1/CODIGOINDESTINO <= 50) then 
                    <ns0:SUSCRIPTORDESTINO>
                        <ns0:ONPEAKEXPIRYDATE>{ data($input_Parameters1/SUSCRIPTORDESTINO/*:OnPeakAccountID/*:ExpiryDate) }</ns0:ONPEAKEXPIRYDATE>
                        <ns0:ISEXPIREDONPEAK>{ xf:isExpiredOnpeak(data($input_Parameters1/SUSCRIPTORDESTINO/*:OnPeakAccountID/*:ExpiryDate)) }</ns0:ISEXPIREDONPEAK>
                        <ns0:EXPIRATIONDATE>{ xf:expirationDate(data($input_Parameters1/SUSCRIPTORDESTINO/*:OnPeakAccountID/*:ExpiryDate), xs:decimal($input_Parameters1/PARAMETROSNEGOCIO/PARAMETRO[5]/VALOR)) }</ns0:EXPIRATIONDATE>
                        <ns0:ONPEAKBALANCE>{ xs:decimal($input_Parameters1/SUSCRIPTORDESTINO/*:OnPeakAccountID/*:Balance) }</ns0:ONPEAKBALANCE>
                    </ns0:SUSCRIPTORDESTINO>
                    else
                    <ns0:SUSCRIPTORDESTINO>
                        <ns0:ONPEAKEXPIRYDATE></ns0:ONPEAKEXPIRYDATE>
                        <ns0:ISEXPIREDONPEAK>false</ns0:ISEXPIREDONPEAK>
                        <ns0:EXPIRATIONDATE></ns0:EXPIRATIONDATE>
                        <ns0:ONPEAKBALANCE>0</ns0:ONPEAKBALANCE>
                    </ns0:SUSCRIPTORDESTINO>
                    }
                    <ns0:CODIGOPLATAFORMAORIGEN>{ data($input_Parameters1/CODIGOINORIGEN) }</ns0:CODIGOPLATAFORMAORIGEN>
                    <ns0:CODIGOPLATAFORMADESTINO>{ data($input_Parameters1/CODIGOINDESTINO) }</ns0:CODIGOPLATAFORMADESTINO>
                    <ns0:SERVICIOSEJECUCION />
                    <ns0:HOSTID>{ data($input_Parameters1/PARAMETROSTRAMA/PARAMETRO[3]/VALOR) }</ns0:HOSTID>
                    <ns0:ERROR>1</ns0:ERROR>
                </ns0:TRAMA_EJECUCION>
            </ns2:parameterList>
        </ns2:callFunctionStateless>
};

declare variable $input_Parameters1 as element(ns1:Input_Parameters) external;

xf:calcularProvisionTrama402_Req($input_Parameters1)
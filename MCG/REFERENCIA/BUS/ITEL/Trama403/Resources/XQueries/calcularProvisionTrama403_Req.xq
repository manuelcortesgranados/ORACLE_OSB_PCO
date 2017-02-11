(:: pragma bea:global-element-parameter parameter="$input_Parameters1" element="ns1:Input_Parameters" location="../Schemas/PS_ITEL_CALCULARPROVISIONTRAMA403.xsd" ::)
(:: pragma bea:global-element-return element="ns2:callFunctionStateless" location="../WSDLs/trama403Provision_DB.wsdl" ::)

declare namespace ns2 = "http://xmlns.oracle.com/Trama403Provision/Trama403Provision_DF_Trama403Provision";
declare namespace ns1 = "http://www.comcel.com.co/CalcularProvisionTrama403/";
declare namespace ns3 = "http://xmlns.oracle.com/bpel";
declare namespace ns0 = "http://www.comcel.com.co/Ejecutador/";
declare namespace xf = "http://tempuri.org/ITEL/Trama403/Resources/XQueries/calcularProvisionTrama403_Req/";

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

declare function xf:calcularProvisionTrama403_Req($input_Parameters1 as element(ns1:Input_Parameters))
    as element(ns2:callFunctionStateless) {
        <ns2:callFunctionStateless name = "Trama403Provision_DF_Trama403Provision">
           <ns2:parameterList>
                <ns0:TRAMA_EJECUCION>
                <ns0:MIN>{ xs:decimal($input_Parameters1/MIN) }</ns0:MIN>
                    <ns0:PARAMETROSTRAMA>
                        <ns0:COMENTARIO>{ data($input_Parameters1/PARAMETROSTRAMA/PARAMETRO[2]/VALOR) }</ns0:COMENTARIO>
                        <ns0:CONSECUTIVO>{ data($input_Parameters1/PARAMETROSTRAMA/PARAMETRO[4]/VALOR) }</ns0:CONSECUTIVO>
                    </ns0:PARAMETROSTRAMA>
                    {if ($input_Parameters1/CODIGOIN < 51) then
                    <ns0:PARAMETROSNEGOCIO>
                        <ns0:ACREDITAONPEAK>{ if ("TRUE" =  $input_Parameters1/PARAMETROSNEGOCIO/PARAMETRO[1]/VALOR/text())  then "true" else "false" }</ns0:ACREDITAONPEAK>
                        <ns0:MONTOONPEAK>{ if (fn:empty($input_Parameters1/PARAMETROSNEGOCIO/PARAMETRO[2]/VALOR/text())) then xs:decimal("0") else xs:decimal($input_Parameters1/PARAMETROSNEGOCIO/PARAMETRO[2]/VALOR) }</ns0:MONTOONPEAK>
                        <ns0:MODIFICAVIGENCIAONPEAK>{ if ("TRUE" = $input_Parameters1/PARAMETROSNEGOCIO/PARAMETRO[3]/VALOR/text()) then "true" else "false" }</ns0:MODIFICAVIGENCIAONPEAK>
                        <ns0:VIGENCIAONPEAK>{ if (fn:empty($input_Parameters1/PARAMETROSNEGOCIO/PARAMETRO[4]/VALOR/text())) then xs:decimal("0") else xs:decimal($input_Parameters1/PARAMETROSNEGOCIO/PARAMETRO[4]/VALOR) }</ns0:VIGENCIAONPEAK>
                        <ns0:ACREDITABONUS>{ if ("TRUE" = $input_Parameters1/PARAMETROSNEGOCIO/PARAMETRO[5]/VALOR/text()) then "true" else "false" }</ns0:ACREDITABONUS>
                        <ns0:MODIFICAVIGENCIABONOS>{ if ("TRUE" = $input_Parameters1/PARAMETROSNEGOCIO/PARAMETRO[6]/VALOR/text()) then "true" else "false" }</ns0:MODIFICAVIGENCIABONOS>
						<ns0:VIGENCIABONOS>{ if (fn:empty($input_Parameters1/PARAMETROSNEGOCIO/PARAMETRO[7]/VALOR/text())) then xs:decimal("0") else xs:decimal($input_Parameters1/PARAMETROSNEGOCIO/PARAMETRO[7]/VALOR) }</ns0:VIGENCIABONOS>
                        <ns0:MONTOBONOS>{ if (fn:empty($input_Parameters1/PARAMETROSNEGOCIO/PARAMETRO[8]/VALOR/text())) then xs:decimal("0") else xs:decimal($input_Parameters1/PARAMETROSNEGOCIO/PARAMETRO[8]/VALOR) }</ns0:MONTOBONOS>
                        <ns0:ACREDITAMIN>{ if ("TRUE" = $input_Parameters1/PARAMETROSNEGOCIO/PARAMETRO[NOMBRE="ACREDITAMIN"]/VALOR/text()) then "true" else "false" }</ns0:ACREDITAMIN>
                        <ns0:MODIFICAVIGENCIAMIN>{ if ("TRUE" = $input_Parameters1/PARAMETROSNEGOCIO/PARAMETRO[NOMBRE="MODIFICAVIGENCIAMIN"]/VALOR/text()) then "true" else "false" }</ns0:MODIFICAVIGENCIAMIN>
                        <ns0:VIGENCIAMIN>{ if (fn:empty($input_Parameters1/PARAMETROSNEGOCIO/PARAMETRO[NOMBRE="VIGENCIAMIN"]/VALOR/text())) then xs:decimal("0") else xs:decimal($input_Parameters1/PARAMETROSNEGOCIO/PARAMETRO[NOMBRE="VIGENCIAMIN"]/VALOR) }</ns0:VIGENCIAMIN>
                        <ns0:MONTOMIN>{ if (fn:empty($input_Parameters1/PARAMETROSNEGOCIO/PARAMETRO[NOMBRE="MONTOMIN"]/VALOR/text())) then xs:decimal("0") else xs:decimal($input_Parameters1/PARAMETROSNEGOCIO/PARAMETRO[NOMBRE="MONTOMIN"]/VALOR) }</ns0:MONTOMIN>
                    </ns0:PARAMETROSNEGOCIO>
                    else
                    <ns0:PARAMETROSNEGOCIO>
                        <ns0:ACREDITAONPEAK>true</ns0:ACREDITAONPEAK>
                        <ns0:MONTOONPEAK>{ if (fn:empty($input_Parameters1/PARAMETROSTRAMA/PARAMETRO[5]/VALOR/text())) then xs:decimal("0") else xs:decimal($input_Parameters1/PARAMETROSTRAMA/PARAMETRO[5]/VALOR) }</ns0:MONTOONPEAK>
                        <ns0:MODIFICAVIGENCIAONPEAK>false</ns0:MODIFICAVIGENCIAONPEAK>
                        <ns0:VIGENCIAONPEAK>{ xs:decimal("0")}</ns0:VIGENCIAONPEAK>
                        <ns0:ACREDITABONUS>{ if ("1" = $input_Parameters1/PARAMETROSTRAMA/PARAMETRO[6]/VALOR/text()) then "true" else "false" }</ns0:ACREDITABONUS>
                        <ns0:MODIFICAVIGENCIABONOS>false</ns0:MODIFICAVIGENCIABONOS>
						<ns0:VIGENCIABONOS>{xs:decimal("0")}</ns0:VIGENCIABONOS>
                        <ns0:MONTOBONOS>{xs:decimal("0")}</ns0:MONTOBONOS>
                        <ns0:ACREDITAMIN>{"false"}</ns0:ACREDITAMIN>
                        <ns0:MODIFICAVIGENCIAMIN>{"false"}</ns0:MODIFICAVIGENCIAMIN>
                        <ns0:VIGENCIAMIN>{xs:decimal("0")}</ns0:VIGENCIAMIN>
                        <ns0:MONTOMIN>{xs:decimal("0")}</ns0:MONTOMIN>
                    </ns0:PARAMETROSNEGOCIO>
                    }
                    {if ($input_Parameters1/CODIGOIN < 51) then
                    <ns0:SUSCRIPTOR>
                        <ns0:ONPEAKEXPIRYDATE>{ data($input_Parameters1/SUSCRIPTOR/*:OnPeakAccountID/*:ExpiryDate) }</ns0:ONPEAKEXPIRYDATE>
                        <ns0:ISEXPIREDONPEAK>{ xf:isExpiredOnpeak(data($input_Parameters1/SUSCRIPTOR/*:OnPeakAccountID/*:ExpiryDate)) }</ns0:ISEXPIREDONPEAK>
                        <ns0:EXPIRATIONDATE>
                        { 
                        	if (xf:isExpiredOnpeak(data($input_Parameters1/SUSCRIPTOR/*:OnPeakAccountID/*:ExpiryDate)) and "FALSE" = $input_Parameters1/PARAMETROSNEGOCIO/PARAMETRO[5]/VALOR/text() and "TRUE" = $input_Parameters1/PARAMETROSNEGOCIO/PARAMETRO[1]/VALOR/text() and "FALSE" = $input_Parameters1/PARAMETROSNEGOCIO/PARAMETRO[3]/VALOR/text()) then concat(day-from-date(current-date()),".",month-from-date(current-date()),".",year-from-date(current-date())," 23:59:59") else xf:expirationDate(data($input_Parameters1/SUSCRIPTOR/*:OnPeakAccountID/*:ExpiryDate), xs:decimal($input_Parameters1/PARAMETROSNEGOCIO/PARAMETRO[4]/VALOR)) 
                        }
                        </ns0:EXPIRATIONDATE>
                        <ns0:EXPIRATIONDATEBONUS>{ xf:expirationDate(data($input_Parameters1/SUSCRIPTOR/*:BonusAccountID/*:ExpiryDate), xs:decimal($input_Parameters1/PARAMETROSNEGOCIO/PARAMETRO[7]/VALOR)) }</ns0:EXPIRATIONDATEBONUS>
                        <ns0:EXPIRATIONDATEMINUTS2>{ xf:expirationDate(data($input_Parameters1/SUSCRIPTOR/*:OffPeakAccountID/*:ExpiryDate), if (fn:empty($input_Parameters1/PARAMETROSNEGOCIO/PARAMETRO[NOMBRE="VIGENCIAMIN"]/VALOR/text())) then xs:decimal("0") else xs:decimal($input_Parameters1/PARAMETROSNEGOCIO/PARAMETRO[NOMBRE="VIGENCIAMIN"]/VALOR)) }</ns0:EXPIRATIONDATEMINUTS2>
                        <ns0:ONPEAKBALANCE>{ xs:decimal($input_Parameters1/SUSCRIPTOR/*:OnPeakAccountID/*:Balance) }</ns0:ONPEAKBALANCE>
                    </ns0:SUSCRIPTOR>
                    else
                    <ns0:SUSCRIPTOR>
                        <ns0:ONPEAKEXPIRYDATE></ns0:ONPEAKEXPIRYDATE>
                        <ns0:ISEXPIREDONPEAK>false</ns0:ISEXPIREDONPEAK>
                        <ns0:EXPIRATIONDATE></ns0:EXPIRATIONDATE>
                        <ns0:EXPIRATIONDATEBONUS></ns0:EXPIRATIONDATEBONUS>
                        <ns0:EXPIRATIONDATEMINUTS2></ns0:EXPIRATIONDATEMINUTS2>
                        <ns0:ONPEAKBALANCE>{xs:decimal("0")}</ns0:ONPEAKBALANCE>
                    </ns0:SUSCRIPTOR>
                    }
                    <ns0:CODIGOPLATAFORMA>{ data($input_Parameters1/CODIGOIN) }</ns0:CODIGOPLATAFORMA>
                    <ns0:SERVICIOSEJECUCION />
                    <ns0:HOSTID>{ data($input_Parameters1/PARAMETROSTRAMA/PARAMETRO[3]/VALOR) }</ns0:HOSTID>
                    <ns0:ERROR>1</ns0:ERROR>
                </ns0:TRAMA_EJECUCION>
            </ns2:parameterList>
        </ns2:callFunctionStateless>
};

declare variable $input_Parameters1 as element(ns1:Input_Parameters) external;

xf:calcularProvisionTrama403_Req($input_Parameters1)
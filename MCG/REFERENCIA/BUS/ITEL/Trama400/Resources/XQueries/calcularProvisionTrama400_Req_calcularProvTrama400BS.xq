(:: pragma bea:global-element-parameter parameter="$input_Parameters" element="ns2:Input_Parameters" location="../Schemas/PS_ITEL_CALCULARPROVISIONTRAMA400.xsd" ::)
(:: pragma bea:global-element-return element="ns0:callFunctionStateless" location="../WSDLs/trama400Provision_DB.wsdl" ::)

declare namespace ns2 = "http://www.comcel.com.co/CalcularProvisionTrama400/";
declare namespace ns1 = "http://www.comcel.com.co/Ejecutador/";
declare namespace ns3 = "http://xmlns.oracle.com/bpel";
declare namespace ns0 = "http://xmlns.oracle.com/trama400Provision2/trama400Provision2_DF";
declare namespace xf = "http://tempuri.org/ITEL/Trama400/Resources/XQueries/calcularProvisionTrama400_Req_calcularProvTrama400BS/";

declare function xf:calcularProvisionTrama400_Req_calcularProvTrama400BS($input_Parameters as element(ns2:Input_Parameters))
    as element(ns0:callFunctionStateless) {
        <ns0:callFunctionStateless name = "trama400Provision2_DF">
            <ns0:parameterList>
                <ns1:TRAMA_EJECUCION>
                    <ns1:MIN>{ xs:decimal($input_Parameters/MIN) }</ns1:MIN>
                    {if ($input_Parameters/METODO = "407") then
                    <ns1:PARAMETROSTRAMA>
                        <ns1:COMENTARIO></ns1:COMENTARIO>
                        <ns1:CONSECUTIVO>{ data($input_Parameters/PARAMETROSTRAMA/PARAMETRO[4]/VALOR) }</ns1:CONSECUTIVO>
                    </ns1:PARAMETROSTRAMA>
                    else
                    <ns1:PARAMETROSTRAMA>
                    	<ns1:COMENTARIO>{ data($input_Parameters/PARAMETROSTRAMA/PARAMETRO[2]/VALOR) }</ns1:COMENTARIO>
                        <ns1:CONSECUTIVO>{ data($input_Parameters/PARAMETROSTRAMA/PARAMETRO[4]/VALOR) }</ns1:CONSECUTIVO>
                    </ns1:PARAMETROSTRAMA>
                    }
                    {if ($input_Parameters/CODIGOIN <= 50) then  
                    <ns1:PARAMETROSNEGOCIO>
                        <ns1:ACREDITAONPEAK>{ if ("TRUE" = $input_Parameters/PARAMETROSNEGOCIO/PARAMETRO[1]/VALOR/text()) then "true" else "false" }</ns1:ACREDITAONPEAK>
                        <ns1:MONTOONPEAK>{ if (fn:empty($input_Parameters/PARAMETROSNEGOCIO/PARAMETRO[2]/VALOR/text())) then xs:decimal("0") else xs:decimal($input_Parameters/PARAMETROSNEGOCIO/PARAMETRO[2]/VALOR) }</ns1:MONTOONPEAK>
                        <ns1:MODIFICAVIGENCIAONEAK>{ if ("TRUE" = $input_Parameters/PARAMETROSNEGOCIO/PARAMETRO[3]/VALOR/text()) then "true" else "false" }</ns1:MODIFICAVIGENCIAONEAK>
                        <ns1:VIGENCIAONPEAK>{ if (fn:empty($input_Parameters/PARAMETROSNEGOCIO/PARAMETRO[4]/VALOR/text())) then xs:decimal("0") else xs:decimal($input_Parameters/PARAMETROSNEGOCIO/PARAMETRO[4]/VALOR) }</ns1:VIGENCIAONPEAK>
                        <ns1:ACREDITABONUS>{ if ("TRUE" = $input_Parameters/PARAMETROSNEGOCIO/PARAMETRO[5]/VALOR/text()) then "true" else "false" }</ns1:ACREDITABONUS>
                        <ns1:MONTOBONOS>{ if (fn:empty($input_Parameters/PARAMETROSNEGOCIO/PARAMETRO[8]/VALOR/text())) then xs:decimal("0") else xs:decimal($input_Parameters/PARAMETROSNEGOCIO/PARAMETRO[8]/VALOR) }</ns1:MONTOBONOS>
                        <ns1:MODIFICAVIGENCIABONOS>{ if ("TRUE" = $input_Parameters/PARAMETROSNEGOCIO/PARAMETRO[7]/VALOR/text()) then "true" else "false" }</ns1:MODIFICAVIGENCIABONOS>
                        <ns1:VIGENCIABONOS>{ if (fn:empty($input_Parameters/PARAMETROSNEGOCIO/PARAMETRO[7]/VALOR/text())) then xs:decimal("0") else xs:decimal($input_Parameters/PARAMETROSNEGOCIO/PARAMETRO[7]/VALOR) }</ns1:VIGENCIABONOS>
                        <ns1:ACREDITAMIN>{ if ("TRUE" = $input_Parameters/PARAMETROSNEGOCIO/PARAMETRO[NOMBRE="ACREDITAMIN"]/VALOR/text()) then "true" else "false" }</ns1:ACREDITAMIN>
                        <ns1:MODIFICAVIGENCIAMIN>{ if ("TRUE" = $input_Parameters/PARAMETROSNEGOCIO/PARAMETRO[NOMBRE="MODIFICAVIGENCIAMIN"]/VALOR/text()) then "true" else "false" }</ns1:MODIFICAVIGENCIAMIN>
                        <ns1:VIGENCIAMIN>{ if (fn:empty($input_Parameters/PARAMETROSNEGOCIO/PARAMETRO[NOMBRE="VIGENCIAMIN"]/VALOR/text())) then xs:decimal("0") else xs:decimal($input_Parameters/PARAMETROSNEGOCIO/PARAMETRO[NOMBRE="VIGENCIAMIN"]/VALOR) }</ns1:VIGENCIAMIN>
                        <ns1:MONTOMIN>{ if (fn:empty($input_Parameters/PARAMETROSNEGOCIO/PARAMETRO[NOMBRE="MONTOMIN"]/VALOR/text())) then xs:decimal("0") else xs:decimal($input_Parameters/PARAMETROSNEGOCIO/PARAMETRO[NOMBRE="MONTOMIN"]/VALOR) }</ns1:MONTOMIN>
                    </ns1:PARAMETROSNEGOCIO>
                    else
                      <ns1:PARAMETROSNEGOCIO>
                        <ns1:ACREDITAONPEAK>{"false"}</ns1:ACREDITAONPEAK>
                        <ns1:MONTOONPEAK>{ if (fn:empty($input_Parameters/PARAMETROSTRAMA/PARAMETRO[5]/VALOR/text())) then xs:decimal("0") else xs:decimal($input_Parameters/PARAMETROSTRAMA/PARAMETRO[5]/VALOR) }</ns1:MONTOONPEAK>
                        <ns1:MODIFICAVIGENCIAONEAK>{if (fn:empty($input_Parameters/PARAMETROSTRAMA/PARAMETRO[7]/VALOR/text())) then "false" else if (0 < xs:decimal($input_Parameters/PARAMETROSTRAMA/PARAMETRO[7]/VALOR/text())) then "true" else "false" }</ns1:MODIFICAVIGENCIAONEAK>
                        <ns1:VIGENCIAONPEAK>{xs:decimal("0")}</ns1:VIGENCIAONPEAK>
                        <ns1:ACREDITABONUS>{ if ("1" = $input_Parameters/PARAMETROSTRAMA/PARAMETRO[6]/VALOR/text()) then "true" else "false" }</ns1:ACREDITABONUS>
                        <ns1:MONTOBONOS>{xs:decimal("0")}</ns1:MONTOBONOS>
                        <ns1:MODIFICAVIGENCIABONOS>{"false"}</ns1:MODIFICAVIGENCIABONOS>
                        <ns1:VIGENCIABONOS>{xs:decimal("0")}</ns1:VIGENCIABONOS>
                        <ns1:ACREDITAMIN>{"false"}</ns1:ACREDITAMIN>
                        <ns1:MODIFICAVIGENCIAMIN>{"false"}</ns1:MODIFICAVIGENCIAMIN>
                        <ns1:VIGENCIAMIN>{xs:decimal("0")}</ns1:VIGENCIAMIN>
                        <ns1:MONTOMIN>{xs:decimal("0")}</ns1:MONTOMIN>
                    </ns1:PARAMETROSNEGOCIO> 
                    }
                    {if ($input_Parameters/CODIGOIN <= 50) then                    
                    <ns1:SUSCRIPTOR>
                        <ns1:ONPEAKEXPIRYDATE>{ data($input_Parameters/SUSCRIPTOR/*:OnPeakAccountID/*:ExpiryDate) }</ns1:ONPEAKEXPIRYDATE>
                        <ns1:ISEXPIREDONPEAK>{ xf:isExpiredOnpeak(data($input_Parameters/SUSCRIPTOR/*:OnPeakAccountID/*:ExpiryDate)) }</ns1:ISEXPIREDONPEAK>
                        <ns1:EXPIRATIONDATE>{if (xf:isExpiredOnpeak(data($input_Parameters/SUSCRIPTOR/*:OnPeakAccountID/*:ExpiryDate)) and "FALSE" = $input_Parameters/PARAMETROSNEGOCIO/PARAMETRO[5]/VALOR/text() and "TRUE" = $input_Parameters/PARAMETROSNEGOCIO/PARAMETRO[1]/VALOR/text() and "FALSE" = $input_Parameters/PARAMETROSNEGOCIO/PARAMETRO[3]/VALOR/text()) then concat(day-from-date(current-date()),".",month-from-date(current-date()),".",year-from-date(current-date())," 23:59:59") else xf:expirationDate(data($input_Parameters/SUSCRIPTOR/*:OnPeakAccountID/*:ExpiryDate), if (fn:empty($input_Parameters/PARAMETROSNEGOCIO/PARAMETRO[4]/VALOR/text())) then xs:decimal("0") else xs:decimal($input_Parameters/PARAMETROSNEGOCIO/PARAMETRO[4]/VALOR))} </ns1:EXPIRATIONDATE>
                        <ns1:EXPIRATIONDATEBONUS>{ xf:expirationDate(data($input_Parameters/SUSCRIPTOR/*:BonusAccountID/*:ExpiryDate), if (fn:empty($input_Parameters/PARAMETROSNEGOCIO/PARAMETRO[7]/VALOR/text())) then xs:decimal("0") else xs:decimal($input_Parameters/PARAMETROSNEGOCIO/PARAMETRO[7]/VALOR)) }</ns1:EXPIRATIONDATEBONUS>
                        <ns1:EXPIRATIONDATEMINUTS2>{ xf:expirationDate(data($input_Parameters/SUSCRIPTOR/*:OffPeakAccountID/*:ExpiryDate), if (fn:empty($input_Parameters/PARAMETROSNEGOCIO/PARAMETRO[NOMBRE="VIGENCIAMIN"]/VALOR/text())) then xs:decimal("0") else xs:decimal($input_Parameters/PARAMETROSNEGOCIO/PARAMETRO[NOMBRE="VIGENCIAMIN"]/VALOR)) }</ns1:EXPIRATIONDATEMINUTS2>
                        <ns1:ONPEAKBALANCE>{ xs:decimal($input_Parameters/SUSCRIPTOR/*:OnPeakAccountID/*:Balance) }</ns1:ONPEAKBALANCE>
                    </ns1:SUSCRIPTOR>
                    else
                    <ns1:SUSCRIPTOR>
                        <ns1:ONPEAKEXPIRYDATE></ns1:ONPEAKEXPIRYDATE>
                        <ns1:ISEXPIREDONPEAK>false</ns1:ISEXPIREDONPEAK>
                        <ns1:EXPIRATIONDATE></ns1:EXPIRATIONDATE>
                        <ns1:EXPIRATIONDATEBONUS></ns1:EXPIRATIONDATEBONUS>
                        <ns1:EXPIRATIONDATEMINUTS2></ns1:EXPIRATIONDATEMINUTS2>
                        <ns1:ONPEAKBALANCE>0</ns1:ONPEAKBALANCE>
                    </ns1:SUSCRIPTOR> 
                    }
                    <ns1:CODIGOPLATAFORMA>{ data($input_Parameters/CODIGOIN) }</ns1:CODIGOPLATAFORMA>
                    <ns1:SERVICIOSEJECUCION />
                    {if ($input_Parameters/CODIGOIN <= 50) then
                    	<ns1:HOSTID>{ data($input_Parameters/PARAMETROSTRAMA/PARAMETRO[3]/VALOR) }</ns1:HOSTID>
                     else
                     	if ($input_Parameters/METODO = "407") then
                    		<ns1:HOSTID>{ "IVR" }</ns1:HOSTID>
                    	else
                    		<ns1:HOSTID>{ data($input_Parameters/PARAMETROSTRAMA/PARAMETRO[3]/VALOR) }</ns1:HOSTID>
                    }
                    <ns1:ERROR>1</ns1:ERROR>
                </ns1:TRAMA_EJECUCION>
            </ns0:parameterList>
        </ns0:callFunctionStateless>
};

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

declare variable $input_Parameters as element(ns2:Input_Parameters) external;

xf:calcularProvisionTrama400_Req_calcularProvTrama400BS($input_Parameters)
xquery version "1.0" encoding "Cp1252";
(:: pragma bea:global-element-parameter parameter="$input_Parameters1" element="ns2:Input_Parameters" location="../Schemas/PS_ITEL_CALCULARPROVISIONTRAMA700.xsd" ::)
(:: pragma bea:global-element-return element="ns1:callFunctionStateless" location="../WSDLs/trama700Provision_DB.wsdl" ::)

declare namespace xf = "http://tempuri.org/ITEL/Trama700/Resources/XQueries/calcularProvisionTrama700_Req/";
declare namespace ns2 = "http://www.comcel.com.co/CalcularProvisionTrama700/";
declare namespace ns1 = "http://xmlns.oracle.com/Trama700Provision/Trama700Provision_DF_Trama700Provision";
declare namespace ns3 = "http://xmlns.oracle.com/bpel";
declare namespace ns0 = "http://www.comcel.com.co/Ejecutador/";

declare function xf:calcularProvisionTrama700_Req($input_Parameters1 as element(ns2:Input_Parameters))
    as element(ns1:callFunctionStateless) {
        <ns1:callFunctionStateless name="Trama700Provision_DF_Trama700Provision">
        	<ns1:parameterList>
	        	 <ns0:TRAMA_EJECUCION>
	                <ns0:MIN>{ xs:decimal($input_Parameters1/MIN) }</ns0:MIN>
	                <ns0:CODIGOPLATAFORMA>{ data($input_Parameters1/CODIGOIN) }</ns0:CODIGOPLATAFORMA>
	                <ns0:SERVICIOSEJECUCION />
	                <ns0:ERROR>1</ns0:ERROR>
	            </ns0:TRAMA_EJECUCION>
	        </ns1:parameterList>
        </ns1:callFunctionStateless>
};

declare variable $input_Parameters1 as element(ns2:Input_Parameters) external;

xf:calcularProvisionTrama700_Req($input_Parameters1)
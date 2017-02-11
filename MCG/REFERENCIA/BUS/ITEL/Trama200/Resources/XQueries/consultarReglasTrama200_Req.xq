(:: pragma bea:global-element-parameter parameter="$input_Parameters1" element="ns1:Input_Parameters" location="../Schemas/PS_ITEL_CONSULTARREGLASTRAMA200.xsd" ::)
(:: pragma bea:global-element-return element="ns3:callFunctionStateless" location="../WSDLs/trama200_DB.wsdl" ::)

declare namespace ns2 = "http://xmlns.oracle.com/bpel";
declare namespace ns1 = "http://www.comcel.com.co/ConsultarReglasTrama200/";
declare namespace ns3 = "http://xmlns.oracle.com/Trama200/trama200_DF_Trama200";
declare namespace ns0 = "http://www.comcel.com.co/trama200Fact/";
declare namespace xf = "http://tempuri.org/ITEL/Trama200/Resources/XQueries/consultarReglasTrama200_Req_consultarTrama200BS/";

declare function xf:consultarReglasTrama200_Req_consultarTrama200BS($input_Parameters1 as element(ns1:Input_Parameters))
    as element(ns3:callFunctionStateless) {
        <ns3:callFunctionStateless name = "trama200_DF_Trama200">
            <ns3:bpelInstance>
                <ns2:processId>0</ns2:processId>
                <ns2:processVersion>0</ns2:processVersion>
                <ns2:domainId>0</ns2:domainId>
                <ns2:processURL>0</ns2:processURL>
                <ns2:instanceId>0</ns2:instanceId>
                <ns2:conversationId>0</ns2:conversationId>
            </ns3:bpelInstance>
            <ns3:parameterList>
                <ns0:TRAMA>
                    <HEADER>
                        <METODO>{ data($input_Parameters1/HEADER/METODO) }</METODO>
                        <MIN>{ data($input_Parameters1/HEADER/MIN) }</MIN>
                    </HEADER>
                    <PARAMETERS>
                        <TIPOCONSULTA>{ data($input_Parameters1/PARAMETERS/TIPOCONSULTA) }</TIPOCONSULTA>
                        <COBRARCONSULTA>{ data($input_Parameters1/PARAMETERS/COBRARCONSULTA) }</COBRARCONSULTA>
                        <CONSULTASDIA>{ data($input_Parameters1/PARAMETERS/CONSULTASDIA) }</CONSULTASDIA>
                        <CONSULTASREALIZADAS>{ data($input_Parameters1/PARAMETERS/CONSULTASREALIZADAS) }</CONSULTASREALIZADAS>
                    </PARAMETERS>
                    <RESULTADO>
	                  <ERROR></ERROR>
	                  <CONSULTASUSCRIPTOR></CONSULTASUSCRIPTOR>
	                  <TIPOCONSULTA></TIPOCONSULTA>
	                  <CONSULTASDIA></CONSULTASDIA>
	                  <CONSULTASREALIZADAS></CONSULTASREALIZADAS>
	                  <ACREDITACUENTA></ACREDITACUENTA>
	                  <MONTOCUENTA></MONTOCUENTA>
              		</RESULTADO>
                    
                </ns0:TRAMA>
            </ns3:parameterList>
        </ns3:callFunctionStateless>
};

declare variable $input_Parameters1 as element(ns1:Input_Parameters) external;

xf:consultarReglasTrama200_Req_consultarTrama200BS($input_Parameters1)
(:: pragma bea:global-element-parameter parameter="$input_Parameters1" element="ns1:Input_Parameters" location="../Schemas/PS_ITEL_CONSULTARREGLASTRAMA601.xsd" ::)
(:: pragma bea:global-element-return element="ns3:callFunctionStateless" location="../WSDLs/trama601_DB.wsdl" ::)

declare namespace ns2 = "http://xmlns.oracle.com/bpel";
declare namespace ns1 = "http://www.comcel.com.co/ConsultarReglasTrama601/";
declare namespace ns3 = "http://xmlns.oracle.com/Trama601/trama601_DF_Trama601";
declare namespace ns0 = "http://www.comcel.com.co/trama601Fact/";
declare namespace xf = "http://tempuri.org/ITEL/Trama601/Resources/XQueries/consultarReglasTrama601_Req/";

declare function xf:consultarReglasTrama601_Req($input_Parameters1 as element(ns1:Input_Parameters))
    as element(ns3:callFunctionStateless) {
        <ns3:callFunctionStateless name="trama601_DF_Trama601">
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
                        <COBRARCAMBIO>{ data($input_Parameters1/PARAMETERS/COBRARCAMBIO) }</COBRARCAMBIO>
                        <CONTRACT>{ data($input_Parameters1/PARAMETERS/CONTRACT) }</CONTRACT>
                        <TMCODE>{ data($input_Parameters1/PARAMETERS/TMCODE) }</TMCODE>
                        <SPCODE>{ data($input_Parameters1/PARAMETERS/SPCODE) }</SPCODE>
                    </PARAMETERS>
                <RESULTADO>
                    	<ERROR/>
                    	<CONSULTASUSCRIPTOR/>
                        <ACREDITACUENTA/>
                        <MONTOCUENTA/>
                        <CONTRACT/>
                </RESULTADO>
                </ns0:TRAMA>
            </ns3:parameterList>
        </ns3:callFunctionStateless>
};

declare variable $input_Parameters1 as element(ns1:Input_Parameters) external;

xf:consultarReglasTrama601_Req($input_Parameters1)
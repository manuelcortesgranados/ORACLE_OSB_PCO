(:: pragma bea:global-element-parameter parameter="$input_Parameters1" element="ns1:Input_Parameters" location="../Schemas/PS_ITEL_CONSULTARREGLASTRAMA100.xsd" ::)
(:: pragma bea:global-element-return element="ns3:callFunctionStateless" location="../WSDLs/trama100_DB.wsdl" ::)

declare namespace ns2 = "http://xmlns.oracle.com/bpel";
declare namespace ns1 = "http://www.comcel.com.co/ConsultarReglasTrama100/";
declare namespace ns3 = "http://xmlns.oracle.com/Trama100/trama100_DF_Trama100";
declare namespace ns0 = "http://www.comcel.com.co/trama100Fact/";
declare namespace xf = "http://tempuri.org/ITEL/Trama100/Resources/XQueries/consultarReglasTrama100_Req_consultarTrama100BS/";

declare function xf:consultarReglasTrama100_Req_consultarTrama100BS($input_Parameters1 as element(ns1:Input_Parameters))
    as element(ns3:callFunctionStateless) {
        <ns3:callFunctionStateless name = "trama100_DF_Trama100">
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
                        <CATEGORIA>{ data($input_Parameters1/PARAMETERS/CATEGORIA) }</CATEGORIA>
                        <CARGAINICIAL>{ data($input_Parameters1/PARAMETERS/CARGAINICIAL) }</CARGAINICIAL>
                        <BLOQUEA>{ data($input_Parameters1/PARAMETERS/BLOQUEA) }</BLOQUEA>
                        <ESPOSTPAGO>{ data($input_Parameters1/PARAMETERS/ESPOSTPAGO) }</ESPOSTPAGO>
                        <VIGENCIA>{ data($input_Parameters1/PARAMETERS/VIGENCIA) }</VIGENCIA>
                    </PARAMETERS>
                    <RESULTADO/>
                </ns0:TRAMA>
            </ns3:parameterList>
        </ns3:callFunctionStateless>
};

declare variable $input_Parameters1 as element(ns1:Input_Parameters) external;

xf:consultarReglasTrama100_Req_consultarTrama100BS($input_Parameters1)
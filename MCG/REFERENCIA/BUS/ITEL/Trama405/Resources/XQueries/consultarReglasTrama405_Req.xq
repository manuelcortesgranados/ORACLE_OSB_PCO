(:: pragma bea:global-element-parameter parameter="$input_Parameters1" element="ns1:Input_Parameters" location="../Schemas/PS_ITEL_CONSULTARREGLASTRAMA405.xsd" ::)
(:: pragma bea:global-element-return element="ns3:callFunctionStateless" location="../WSDLs/trama405_DB.wsdl" ::)

declare namespace ns2 = "http://xmlns.oracle.com/bpel";
declare namespace ns1 = "http://www.comcel.com.co/ConsultarReglasTrama405/";
declare namespace ns3 = "http://xmlns.oracle.com/Trama405/trama405_DF_Trama405";
declare namespace ns0 = "http://www.comcel.com.co/trama405Fact/";
declare namespace xf = "http://tempuri.org/ITEL/Trama405/Resources/XQueries/consultarReglasTrama405_Req_consultarTrama405BS/";

declare function xf:consultarReglasTrama405_Req_consultarTrama405BS($input_Parameters1 as element(ns1:Input_Parameters))
    as element(ns3:callFunctionStateless) {
       <ns3:callFunctionStateless name = "trama405_DF_Trama405">
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
                        <COMENTARIO>{ data($input_Parameters1/PARAMETERS/COMENTARIO) }</COMENTARIO>
                        <HOSTID>{ data($input_Parameters1/PARAMETERS/HOSTID) }</HOSTID>
                        <CONSECUTIVO>{ data($input_Parameters1/PARAMETERS/CONSECUTIVO) }</CONSECUTIVO>
                        <CODIGOCUENTA>{ data($input_Parameters1/PARAMETERS/CODIGOCUENTA) }</CODIGOCUENTA>
                        <MONTODEBITO>{ data($input_Parameters1/PARAMETERS/MONTODEBITO) }</MONTODEBITO>
                        <DIASVIGENCIA>{ data($input_Parameters1/PARAMETERS/DIASVIGENCIA) }</DIASVIGENCIA>
                    </PARAMETERS>
                    <RESULTADO>
                    	<ERROR/>
                    	<CONSULTASUSCRIPTOR/>
                        <ACREDITACUENTA/>
                        <MONTOCUENTA/>
                        <MODIFICAVIGENCIACUENTA/>
                        <VIGENCIACUENTA/>
                    </RESULTADO>
                </ns0:TRAMA>
            </ns3:parameterList>
        </ns3:callFunctionStateless>
};

declare variable $input_Parameters1 as element(ns1:Input_Parameters) external;

xf:consultarReglasTrama405_Req_consultarTrama405BS($input_Parameters1)
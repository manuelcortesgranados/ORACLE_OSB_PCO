(:: pragma bea:global-element-parameter parameter="$input_Parameters1" element="ns1:Input_Parameters" location="../Schemas/PS_ITEL_CONSULTARREGLASTRAMA402.xsd" ::)
(:: pragma bea:global-element-return element="ns3:callFunctionStateless" location="../WSDLs/trama402_DB.wsdl" ::)

declare namespace ns2 = "http://xmlns.oracle.com/bpel";
declare namespace ns1 = "http://www.comcel.com.co/ConsultarReglasTrama402/";
declare namespace ns3 = "http://xmlns.oracle.com/Trama402/trama402_DF_Trama402";
declare namespace ns0 = "http://www.comcel.com.co/trama402Fact/";
declare namespace xf = "http://tempuri.org/ITEL/Trama402/Resources/XQueries/consultarReglasTrama402_Req_consultarTrama402BS/";

declare function xf:consultarReglasTrama402_Req_consultarTrama402BS($input_Parameters1 as element(ns1:Input_Parameters))
    as element(ns3:callFunctionStateless) {
       <ns3:callFunctionStateless name = "trama402_DF_Trama402">
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
                        <MINORIGEN>{ data($input_Parameters1/HEADER/MINORIGEN) }</MINORIGEN>
                        <MINDESTINO>{ data($input_Parameters1/HEADER/MINDESTINO) }</MINDESTINO>
                    </HEADER>
                    <PARAMETERS>
                        <COMENTARIO>{ data($input_Parameters1/PARAMETERS/COMENTARIO) }</COMENTARIO>
                        <HOSTID>{ data($input_Parameters1/PARAMETERS/HOSTID) }</HOSTID>
                        <CONSECUTIVO>{ data($input_Parameters1/PARAMETERS/CONSECUTIVO) }</CONSECUTIVO>
                        <MONTORECARGA>{ data($input_Parameters1/PARAMETERS/MONTORECARGA) }</MONTORECARGA>
                        <COBROSMS>{ data($input_Parameters1/PARAMETERS/BONIFICACION) }</COBROSMS>
                    </PARAMETERS>
                    <RESULTADO>
                    	<ERROR/>
                    	<CONSULTASUSCRIPTOR/>
                        <ACREDITAONPEAK/>
                        <MONTOONPEAK/>
                        <MODIFICAVIGENCIAONPEAK/>
                        <VIGENCIAONPEAK/>
                    </RESULTADO>
                </ns0:TRAMA>
            </ns3:parameterList>
        </ns3:callFunctionStateless>
};

declare variable $input_Parameters1 as element(ns1:Input_Parameters) external;

xf:consultarReglasTrama402_Req_consultarTrama402BS($input_Parameters1)
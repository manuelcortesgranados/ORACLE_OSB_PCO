(:: pragma bea:global-element-parameter parameter="$input_Parameters1" element="ns1:Input_Parameters" location="../Schemas/PS_ITEL_CONSULTARREGLASTRAMA400.xsd" ::)
(:: pragma bea:global-element-return element="ns3:callFunctionStateless" location="../WSDLs/trama400_DB.wsdl" ::)

declare namespace ns2 = "http://xmlns.oracle.com/bpel";
declare namespace ns1 = "http://www.comcel.com.co/ConsultarReglasTrama400/";
declare namespace ns3 = "http://xmlns.oracle.com/trama400/trama400_DF_Trama400";
declare namespace ns0 = "http://www.comcel.com.co/trama400Fact/";
declare namespace xf = "http://tempuri.org/ITEL/Trama400/Resources/XQueries/consultarReglasTrama400_Req_consultarTrama400BS/";

declare function xf:consultarReglasTrama400_Req_consultarTrama400BS($input_Parameters1 as element(ns1:Input_Parameters))
    as element(ns3:callFunctionStateless) {
        <ns3:callFunctionStateless name = "trama400_DF_Trama400">
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
                        <MONTORECARGA>{ data($input_Parameters1/PARAMETERS/MONTORECARGA) }</MONTORECARGA>
                        <BONIFICAR>{ data($input_Parameters1/PARAMETERS/BONIFICAR) }</BONIFICAR>
                        <DIASVIGENCIA>{ data($input_Parameters1/PARAMETERS/DIASVIGENCIA) }</DIASVIGENCIA>
                        <PLAN>{ data($input_Parameters1/PARAMETERS/PLAN) }</PLAN>
                        <PLANESNUEVOS>
                            {
                                for $Detail in $input_Parameters1/PARAMETERS/PLANESNUEVOS/Detail
                                return
                                    <Detail>{ data($Detail) }</Detail>
                            }
                        </PLANESNUEVOS>
                        <PLANESBONOMIN>
                            {
                                for $Detail in $input_Parameters1/PARAMETERS/PLANESBONOMIN/Detail
                                return
                                    <Detail>{ data($Detail) }</Detail>
                            }
                        </PLANESBONOMIN>
                        <HASUNLIMITEDCHOSEN>{ data($input_Parameters1/PARAMETERS/HASUNLIMITEDCHOSEN) }</HASUNLIMITEDCHOSEN>
                    </PARAMETERS>
                    <RESULTADO>
                    	<ERROR/>
                    	<CONSULTASUSCRIPTOR/>
                        <ACREDITAONPEAK/>
                        <MONTOONPEAK/>
                        <MODIFICAVIGENCIAONPEAK/>
                        <VIGENCIAONPEAK/>
                        <ACREDITABONUS/>
                        <MODIFICAVIGENCIABONUS/>
                        <VIGENCIABONOS/>
                        <MONTOBONOS/>
                        <ACREDITAMIN/>
                        <MODIFICAVIGENCIAMIN/>
                        <VIGENCIAMIN/>
                        <MONTOMIN/>
                    </RESULTADO>
                </ns0:TRAMA>
            </ns3:parameterList>
        </ns3:callFunctionStateless>
};

declare variable $input_Parameters1 as element(ns1:Input_Parameters) external;

xf:consultarReglasTrama400_Req_consultarTrama400BS($input_Parameters1)
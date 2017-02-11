(:: pragma bea:global-element-parameter parameter="$input_Parameters1" element="ns0:Input_Parameters" location="../Schemas/PS_ITEL_CONSULTARREGLASTRAMA309.xsd" ::)
(:: pragma bea:global-element-return element="ns3:callFunctionStateless" location="../WSDLs/trama309_DB.wsdl" ::)

declare namespace ns2 = "http://xmlns.oracle.com/bpel";
declare namespace ns1 = "http://www.comcel.com.co/trama309Fact/";
declare namespace ns3 = "http://xmlns.oracle.com/Trama309/trama309_DF_Trama309";
declare namespace ns0 = "http://www.comcel.com.co/ConsultarReglasTrama309/";
declare namespace xf = "http://tempuri.org/ITEL/Trama309/Resources/XQueries/consultarReglasTrama309_Req/";

declare function xf:consultarReglasTrama309_Req($input_Parameters1 as element(ns0:Input_Parameters))
    as element(ns3:callFunctionStateless) {
        <ns3:callFunctionStateless name="trama309_DF_Trama309">
            <ns3:parameterList>
                <ns1:TRAMA>
                    <HEADER>
                        <METODO>{ data($input_Parameters1/HEADER/METODO) }</METODO>
                        <MIN>{ data($input_Parameters1/HEADER/MIN) }</MIN>
                    </HEADER>
                    <PARAMETERS>
                        <CODIGO_COBRO>{ data($input_Parameters1/PARAMETERS/COBRAR) }</CODIGO_COBRO>
                        <VIGENCIA>{ data($input_Parameters1/PARAMETERS/VIGENCIA) }</VIGENCIA>
                        <FECHA_REGISTRO>{ data($input_Parameters1/PARAMETERS/FECHA_REGISTRO) }</FECHA_REGISTRO>
                    </PARAMETERS>
                    <RESULTADO>
                    	<ERROR/>
                    	<CONSULTASUSCRIPTOR/>
                    	<FECHA_REGISTRO_ILIMITADO/>
                    	<ACREDITACUENTA/>
                    	<MONTOCUENTA/>
                    	<VIGENCIA_ILIMITADO_MESES/>
                    	<VALIDA_MIN_COMCEL/>
                    </RESULTADO>
                </ns1:TRAMA>
            </ns3:parameterList>
        </ns3:callFunctionStateless>
};

declare variable $input_Parameters1 as element(ns0:Input_Parameters) external;

xf:consultarReglasTrama309_Req($input_Parameters1)
(:: pragma bea:global-element-parameter parameter="$input_Parameters1" element="ns1:Input_Parameters" location="../Schemas/PS_ITEL_CONSULTARREGLASTRAMA302.xsd" ::)
(:: pragma bea:global-element-return element="ns2:callFunctionStateless" location="../WSDLs/trama302_DB.wsdl" ::)

declare namespace ns2 = "http://xmlns.oracle.com/Trama302/trama302_DF_Trama302";
declare namespace ns1 = "http://www.comcel.com.co/ConsultarReglasTrama302/";
declare namespace ns3 = "http://xmlns.oracle.com/bpel";
declare namespace ns0 = "http://www.comcel.com.co/trama302Fact/";
declare namespace xf = "http://tempuri.org/ITEL/Trama302/Resources/XQueries/consultarReglasTrama302_Req/";

declare function xf:consultarReglasTrama302_Req($input_Parameters1 as element(ns1:Input_Parameters))
    as element(ns2:callFunctionStateless) {
        <ns2:callFunctionStateless name="trama302_DF_Trama302">
            <ns2:parameterList>
                <ns0:TRAMA>
                    <HEADER>
                        <METODO>{ data($input_Parameters1/HEADER/METODO) }</METODO>
                        <MIN>{ data($input_Parameters1/HEADER/MIN) }</MIN>
                    </HEADER>
                    <PARAMETERS>
                        <COBRAR>{ data($input_Parameters1/PARAMETERS/COBRAR) }</COBRAR>
                        <VIGENCIA>{ data($input_Parameters1/PARAMETERS/VIGENCIA) }</VIGENCIA>
                        <FECHA_REGISTRO>{ data($input_Parameters1/PARAMETERS/FECHA_REGISTRO) }</FECHA_REGISTRO>
                    </PARAMETERS>
                    <RESULTADO>
                    	<ERROR/>
                    	<CONSULTASUSCRIPTOR/>
                    	<FECHA_REGISTRO_ILIMITADO/>
                    	<ACREDITACUENTA/>
                    	<MONTOCUENTA/>
                    	<VIGENCIA_ILIMITADO/>
                    	<VALIDA_MIN_COMCEL/>
                    </RESULTADO>
                </ns0:TRAMA>
            </ns2:parameterList>
        </ns2:callFunctionStateless>
};

declare variable $input_Parameters1 as element(ns1:Input_Parameters) external;

xf:consultarReglasTrama302_Req($input_Parameters1)
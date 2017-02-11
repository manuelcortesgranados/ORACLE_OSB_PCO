(:: pragma bea:global-element-parameter parameter="$input_Parameters1" element="ns2:Input_Parameters" location="../Schemas/PS_ITEL_CONSULTARREGLASTRAMA306.xsd" ::)
(:: pragma bea:global-element-return element="ns1:callFunctionStateless" location="../WSDLs/trama306_DB.wsdl" ::)

declare namespace ns2 = "http://www.comcel.com.co/ConsultarReglasTrama306/";
declare namespace ns1 = "http://xmlns.oracle.com/Trama306/trama306_DF_Trama306";
declare namespace ns3 = "http://xmlns.oracle.com/bpel";
declare namespace ns0 = "http://www.comcel.com.co/trama306Fact/";
declare namespace xf = "http://tempuri.org/ITEL/Trama306/Resources/XQueries/consultarReglasTrama306_Req/";

declare function xf:consultarReglasTrama306_Req($input_Parameters1 as element(ns2:Input_Parameters))
    as element(ns1:callFunctionStateless) {
        <ns1:callFunctionStateless name="trama306_DF_Trama306">
            <ns1:parameterList>
                <ns0:TRAMA>
                    <HEADER>
                        <METODO>{ data($input_Parameters1/HEADER/METODO) }</METODO>
                        <MIN>{ data($input_Parameters1/HEADER/MIN) }</MIN>
                    </HEADER>
                    <PARAMETERS>
                        <CODIGO_COBRO>{ data($input_Parameters1/PARAMETERS/CODIGO_COBRO) }</CODIGO_COBRO>
                    </PARAMETERS>
                    <RESULTADO>
                    	<ERROR/>
                    	<CONSULTASUSCRIPTOR/>
                    	<ACREDITACUENTA/>
                    	<MONTOCUENTA/>
                    	<VALIDA_MIN_COMCEL/>
                    	<VIGENCIA_ILIMITADO_MESES/>
                    </RESULTADO>
                </ns0:TRAMA>
            </ns1:parameterList>
        </ns1:callFunctionStateless>
};

declare variable $input_Parameters1 as element(ns2:Input_Parameters) external;

xf:consultarReglasTrama306_Req($input_Parameters1)
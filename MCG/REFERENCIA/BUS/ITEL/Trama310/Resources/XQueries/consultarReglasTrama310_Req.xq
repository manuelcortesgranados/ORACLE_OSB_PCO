(:: pragma bea:global-element-parameter parameter="$input_Parameters1" element="ns2:Input_Parameters" location="../Schemas/PS_ITEL_CONSULTARREGLASTRAMA310.xsd" ::)
(:: pragma bea:global-element-return element="ns1:callFunctionStateless" location="../WSDLs/trama310_DB.wsdl" ::)

declare namespace ns2 = "http://www.comcel.com.co/ConsultarReglasTrama310/";
declare namespace ns1 = "http://xmlns.oracle.com/Trama310/Trama310_DF_Trama310";
declare namespace ns3 = "http://xmlns.oracle.com/bpel";
declare namespace ns0 = "http://www.comcel.com.co/trama310Fact/";
declare namespace xf = "http://tempuri.org/ITEL/Trama310/Resources/XQueries/consultarReglasTrama310_Req/";

declare function xf:consultarReglasTrama310_Req($input_Parameters1 as element(ns2:Input_Parameters))
    as element(ns1:callFunctionStateless) {
        <ns1:callFunctionStateless name="Trama310_DF_Trama310">
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

xf:consultarReglasTrama310_Req($input_Parameters1)
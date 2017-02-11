(:: pragma bea:global-element-parameter parameter="$input_Parameters1" element="ns1:Input_Parameters" location="../Schemas/PS_ITEL_CONSULTARREGLASTRAMA308.xsd" ::)
(:: pragma bea:global-element-return element="ns2:callFunctionStateless" location="../WSDLs/trama308_DB.wsdl" ::)

declare namespace ns2 = "http://xmlns.oracle.com/Trama308/trama308_DF_Trama308";
declare namespace ns1 = "http://www.comcel.com.co/ConsultarReglasTrama308/";
declare namespace ns3 = "http://xmlns.oracle.com/bpel";
declare namespace ns0 = "http://www.comcel.com.co/trama308Fact/";
declare namespace xf = "http://tempuri.org/ITEL/Trama308/Resources/XQueries/consultarReglasTrama308_Req/";

declare function xf:consultarReglasTrama308_Req($input_Parameters1 as element(ns1:Input_Parameters))
    as element(ns2:callFunctionStateless) {
        <ns2:callFunctionStateless name="trama308_DF_Trama308">
            <ns2:parameterList>
                <ns0:TRAMA>
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
                </ns0:TRAMA>
            </ns2:parameterList>
        </ns2:callFunctionStateless>
};

declare variable $input_Parameters1 as element(ns1:Input_Parameters) external;

xf:consultarReglasTrama308_Req($input_Parameters1)
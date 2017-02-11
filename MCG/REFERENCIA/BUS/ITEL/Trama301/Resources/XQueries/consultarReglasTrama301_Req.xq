(:: pragma bea:global-element-parameter parameter="$input_Parameters1" element="ns1:Input_Parameters" location="../Schemas/PS_ITEL_CONSULTARREGLASTRAMA301.xsd" ::)
(:: pragma bea:global-element-return element="ns0:callFunctionStateless" location="../WSDLs/trama301_DB.wsdl" ::)

declare namespace ns2 = "http://www.comcel.com.co/trama301Fact/";
declare namespace ns1 = "http://www.comcel.com.co/ConsultarReglasTrama301/";
declare namespace ns3 = "http://xmlns.oracle.com/bpel";
declare namespace ns0 = "http://xmlns.oracle.com/Trama301/trama301_DF_Trama301";
declare namespace xf = "http://tempuri.org/ITEL/Trama301/Resources/XQueries/calcularProvisionTrama301_Req/";

declare function xf:calcularProvisionTrama301_Req($input_Parameters1 as element(ns1:Input_Parameters))
    as element(ns0:callFunctionStateless) {
        <ns0:callFunctionStateless name="trama301_DF_Trama301">
            <ns0:parameterList>
                <ns2:TRAMA>
                    <HEADER>
                        <METODO>{ data($input_Parameters1/HEADER/METODO) }</METODO>
                        <MIN>{ data($input_Parameters1/HEADER/MIN) }</MIN>
                    </HEADER>
                    
                    <PARAMETERS>
                        <COBRARCONSULTA>{ data($input_Parameters1/PARAMETERS/COBRARCONSULTA) }</COBRARCONSULTA>
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
                </ns2:TRAMA>
            </ns0:parameterList>
        </ns0:callFunctionStateless>
};



declare variable $input_Parameters1 as element(ns1:Input_Parameters) external;

xf:calcularProvisionTrama301_Req($input_Parameters1)
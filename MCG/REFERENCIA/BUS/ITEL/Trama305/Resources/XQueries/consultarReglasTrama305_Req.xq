(:: pragma bea:global-element-parameter parameter="$input_Parameters1" element="ns2:Input_Parameters" location="../Schemas/PS_ITEL_CONSULTARREGLASTRAMA305.xsd" ::)
(:: pragma bea:global-element-return element="ns1:callFunctionStateless" location="../WSDLs/trama305_DB.wsdl" ::)

declare namespace ns2 = "http://www.comcel.com.co/ConsultarReglasTrama305/";
declare namespace ns1 = "http://xmlns.oracle.com/Trama305/trama305_DF_Trama305";
declare namespace ns3 = "http://xmlns.oracle.com/bpel";
declare namespace ns0 = "http://www.comcel.com.co/trama305Fact/";
declare namespace xf = "http://tempuri.org/ITEL/Trama305/Resources/XQueries/consultarReglasTrama305_Req/";

declare function xf:consultarReglasTrama305_Req($input_Parameters1 as element(ns2:Input_Parameters))
    as element(ns1:callFunctionStateless) {
        <ns1:callFunctionStateless>
            <ns1:parameterList>
                <ns0:TRAMA>
                    <HEADER>
                        <METODO>{ data($input_Parameters1/HEADER/METODO) }</METODO>
                        <MIN>{ data($input_Parameters1/HEADER/MIN) }</MIN>
                    </HEADER>
                    <PARAMETERS>
                        <VIGENCIA>{ data($input_Parameters1/PARAMETERS/VIGENCIA) }</VIGENCIA>
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
            </ns1:parameterList>
        </ns1:callFunctionStateless>
};

declare variable $input_Parameters1 as element(ns2:Input_Parameters) external;

xf:consultarReglasTrama305_Req($input_Parameters1)
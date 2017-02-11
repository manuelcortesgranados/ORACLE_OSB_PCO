(:: pragma bea:global-element-parameter parameter="$input_Parameters1" element="ns0:Input_Parameters" location="../Schemas/PS_ITEL_CONSULTARREGLASTRAMA307.xsd" ::)
(:: pragma bea:global-element-return element="ns1:callFunctionStateless" location="../WSDLs/trama307_DB.wsdl" ::)

declare namespace ns2 = "http://www.comcel.com.co/trama307Fact/";
declare namespace ns1 = "http://xmlns.oracle.com/Trama307/trama307_DF_Trama307";
declare namespace ns3 = "http://xmlns.oracle.com/bpel";
declare namespace ns0 = "http://www.comcel.com.co/ConsultarReglasTrama307/";
declare namespace xf = "http://tempuri.org/ITEL/Trama307/Resources/XQueries/consultarReglasTrama307_Req/";

declare function xf:consultarReglasTrama307_Req($input_Parameters1 as element(ns0:Input_Parameters))
    as element(ns1:callFunctionStateless) {
        <ns1:callFunctionStateless name="trama307_DF_Trama307">
            <ns1:parameterList>
                <ns2:TRAMA>
                    <HEADER>
                        <METODO>{ data($input_Parameters1/HEADER/METODO) }</METODO>
                        <MIN>{ data($input_Parameters1/HEADER/MIN) }</MIN>
                    </HEADER>
                    <PARAMETERS>
                        <CODIGO_COBRO>{ data($input_Parameters1/PARAMETERS/CODIGO_COBRO) }</CODIGO_COBRO>
                        <VIGENCIA>{ data($input_Parameters1/PARAMETERS/VIGENCIA) }</VIGENCIA>
                        <FECHA_REGISTRO>{ data($input_Parameters1/PARAMETERS/FECHA_REGISTRO) }</FECHA_REGISTRO>
                    </PARAMETERS>
                    <RESULTADO>
                  		<ERROR></ERROR>
                  		<CONSULTASUSCRIPTOR/>
                  		<FECHA_REGISTRO_ILIMITADO/>
                  		<ACREDITACUENTA/>
                  		<MONTOCUENTA/>
                  		<VIGENCIA_ILIMITADO_MESES/>
                  		<VALIDA_MIN_COMCEL/>
               		</RESULTADO>
                </ns2:TRAMA>
            </ns1:parameterList>
        </ns1:callFunctionStateless>
};

declare variable $input_Parameters1 as element(ns0:Input_Parameters) external;

xf:consultarReglasTrama307_Req($input_Parameters1)
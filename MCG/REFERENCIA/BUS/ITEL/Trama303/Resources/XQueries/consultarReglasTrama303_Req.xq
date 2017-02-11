(:: pragma bea:global-element-parameter parameter="$input_Parameters1" element="ns0:Input_Parameters" location="../Schemas/PS_ITEL_CONSULTARREGLASTRAMA303.xsd" ::)
(:: pragma bea:global-element-return element="ns1:callFunctionStateless" location="../WSDLs/trama303_DB.wsdl" ::)

declare namespace ns2 = "http://www.comcel.com.co/trama303Fact/";
declare namespace ns1 = "http://xmlns.oracle.com/Trama303/trama303_DF_Trama303";
declare namespace ns3 = "http://xmlns.oracle.com/bpel";
declare namespace ns0 = "http://www.comcel.com.co/ConsultarReglasTrama303/";
declare namespace xf = "http://tempuri.org/ITEL/Trama303/Resources/XQueries/consultarReglasTrama303_Req/";

declare function xf:consultarReglasTrama303_Req($input_Parameters1 as element(ns0:Input_Parameters))
    as element(ns1:callFunctionStateless) {
        <ns1:callFunctionStateless name="trama303_DF_Trama303">
            <ns1:parameterList>
                <ns2:TRAMA>
                    <HEADER>
                        <METODO>{ data($input_Parameters1/HEADER/METODO) }</METODO>
                        <MIN>{ data($input_Parameters1/HEADER/MIN) }</MIN>
                    </HEADER>
                    <PARAMETERS>
                        <COBRAR>{ data($input_Parameters1/PARAMETERS/COBRAR) }</COBRAR>
                        <VIGENCIA>{ data($input_Parameters1/PARAMETERS/VIGENCIA) }</VIGENCIA>
                        <FECHA_RENOVACION>{ data($input_Parameters1/PARAMETERS/FECHA_RENOVACION) }</FECHA_RENOVACION>
                    </PARAMETERS>
                    <RESULTADO>
                  		<ERROR></ERROR>
                  		<CONSULTASUSCRIPTOR/>
                  		<FECHA_RENOVACION_ILIMITADO/>
                  		<ACREDITACUENTA/>
                  		<MONTOCUENTA/>
                  		<VIGENCIA_ILIMITADO/>
                  		<VALIDA_MIN_COMCEL/>
               		</RESULTADO>
                </ns2:TRAMA>
            </ns1:parameterList>
        </ns1:callFunctionStateless>
};

declare variable $input_Parameters1 as element(ns0:Input_Parameters) external;

xf:consultarReglasTrama303_Req($input_Parameters1)
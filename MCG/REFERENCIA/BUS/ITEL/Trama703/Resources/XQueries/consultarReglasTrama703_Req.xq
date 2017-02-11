(:: pragma bea:global-element-parameter parameter="$input_Parameters1" element="ns0:Input_Parameters" location="../Schemas/PS_ITEL_CONSULTARREGLASTRAMA703.xsd" ::)
(:: pragma bea:global-element-return element="ns2:callFunctionStateless" location="../WSDLs/trama703_DB.wsdl" ::)

declare namespace ns2 = "http://xmlns.oracle.com/Trama703/trama703_DF_Trama703";
declare namespace ns1 = "http://www.comcel.com.co/trama703Fact/";
declare namespace ns3 = "http://xmlns.oracle.com/bpel";
declare namespace ns0 = "http://www.comcel.com.co/ConsultarReglasTrama703/";
declare namespace xf = "http://tempuri.org/ITEL/Trama703/Resources/XQueries/consultarReglasTrama703_Req/";

declare function xf:consultarReglasTrama703_Req($input_Parameters1 as element(ns0:Input_Parameters))
    as element(ns2:callFunctionStateless) {
        <ns2:callFunctionStateless>
            <ns2:parameterList>
                <ns1:TRAMA>
                    <HEADER>
                        <METODO>{ data($input_Parameters1/HEADER/METODO) }</METODO>
                        <MIN>{ data($input_Parameters1/HEADER/MIN) }</MIN>
                    </HEADER>
                    <PARAMETERS>
                        <CODIGO_COBRO>{ data($input_Parameters1/PARAMETERS/CODIGO_COBRO) }</CODIGO_COBRO>
                        <CODIGO_CUENTA>{ data($input_Parameters1/PARAMETERS/CODIGO_CUENTA) }</CODIGO_CUENTA>
                        <VIGENCIA>{ data($input_Parameters1/PARAMETERS/VIGENCIA) }</VIGENCIA>
                        <FECHA_RENOVACION>{ data($input_Parameters1/PARAMETERS/FECHA_RENOVACION) }</FECHA_RENOVACION>
                    </PARAMETERS>
                    <RESULTADO>
                  		<ERROR></ERROR>
                  		<CONSULTASUSCRIPTOR/>
                  		<FECHA_RENOVACION_ILIMITADO/>
                  		<ACREDITACUENTA/>
                  		<CODIGO_CUENTA/>
                  		<MONTOCUENTA/>
                  		<VIGENCIA_ILIMITADO/>
                  		<VALIDA_MIN_COMCEL/>
               		</RESULTADO>
                </ns1:TRAMA>
            </ns2:parameterList>
        </ns2:callFunctionStateless>
};

declare variable $input_Parameters1 as element(ns0:Input_Parameters) external;

xf:consultarReglasTrama703_Req($input_Parameters1)
(:: pragma bea:global-element-parameter parameter="$input_Parameters1" element="ns3:Input_Parameters" location="../Schemas/PS_ITEL_CONSULTARREGLASTRAMA702.xsd" ::)
(:: pragma bea:global-element-return element="ns1:callFunctionStateless" location="../WSDLs/trama702_DB.wsdl" ::)

declare namespace ns2 = "http://xmlns.oracle.com/bpel";
declare namespace ns1 = "http://xmlns.oracle.com/Trama702/Trama702_DF_Trama702";
declare namespace ns3 = "http://www.comcel.com.co/ConsultarReglasTrama702/";
declare namespace ns0 = "http://www.comcel.com.co/trama702Fact/";
declare namespace xf = "http://tempuri.org/ITEL/Trama702/Resources/XQueries/consultarReglasTrama702_Req/";

declare function xf:consultarReglasTrama702_Req($input_Parameters1 as element(ns3:Input_Parameters))
    as element(ns1:callFunctionStateless) {
        <ns1:callFunctionStateless name = "Trama702_DF_Trama702">
            <ns1:parameterList>
                <ns0:TRAMA>
                    <HEADER>
                        <METODO>{ data($input_Parameters1/HEADER/METODO) }</METODO>
                        <MIN>{ data($input_Parameters1/HEADER/MIN) }</MIN>
                    </HEADER>
                    <PARAMETERS>
                        <CODIGO_COBRO>{ data($input_Parameters1/PARAMETERS/CODIGO_COBRO) }</CODIGO_COBRO>
                        <CODIGO_CUENTA>{ data($input_Parameters1/PARAMETERS/CODIGO_CUENTA) }</CODIGO_CUENTA>
                        <VIGENCIA>{ data($input_Parameters1/PARAMETERS/VIGENCIA) }</VIGENCIA>
                        <FECHA_REGISTRO>{ data($input_Parameters1/PARAMETERS/FECHA_REGISTRO) }</FECHA_REGISTRO>
                    </PARAMETERS>
                    <RESULTADO>
                  		<ERROR></ERROR>
                  		<CONSULTASUSCRIPTOR/>
                  		<FECHA_MODIFICACION_ILIMITADO/>
                  		<ACREDITACUENTA/>
                  		<CODIGO_CUENTA/>
                  		<MONTOCUENTA/>
                  		<VIGENCIA_ILIMITADO/>
                  		<VALIDA_MIN_COMCEL/>
               		</RESULTADO>
                </ns0:TRAMA>
            </ns1:parameterList>
        </ns1:callFunctionStateless>
};

declare variable $input_Parameters1 as element(ns3:Input_Parameters) external;

xf:consultarReglasTrama702_Req($input_Parameters1)
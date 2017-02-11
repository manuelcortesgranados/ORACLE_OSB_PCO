(:: pragma bea:global-element-parameter parameter="$input_Parameters1" element="ns3:Input_Parameters" location="../Schemas/PS_ITEL_CONSULTARREGLASTRAMA701.xsd" ::)
(:: pragma bea:global-element-return element="ns1:callFunctionStateless" location="../WSDLs/trama701_DB.wsdl" ::)

declare namespace ns2 = "http://xmlns.oracle.com/bpel";
declare namespace ns1 = "http://xmlns.oracle.com/Trama701/Trama701_DF_Trama701";
declare namespace ns3 = "http://www.comcel.com.co/ConsultarReglasTrama701/";
declare namespace ns0 = "http://www.comcel.com.co/trama701Fact/";
declare namespace xf = "http://tempuri.org/ITEL/Trama701/Resources/XQueries/consultarReglasTrama701_Req/";

declare function xf:consultarReglasTrama701_Req($input_Parameters1 as element(ns3:Input_Parameters))
    as element(ns1:callFunctionStateless) {
        <ns1:callFunctionStateless>
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
                  		<FECHA_REGISTRO_ILIMITADO/>
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

xf:consultarReglasTrama701_Req($input_Parameters1)
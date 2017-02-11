(:: pragma bea:global-element-parameter parameter="$input_Parameters1" element="ns2:Input_Parameters" location="../Schemas/PS_ITEL_CONSULTARREGLASTRAMA705.xsd" ::)
(:: pragma bea:global-element-return element="ns0:callFunctionStateless" location="../WSDLs/trama705_DB.wsdl" ::)

declare namespace ns2 = "http://www.comcel.com.co/ConsultarReglasTrama705/";
declare namespace ns1 = "http://www.comcel.com.co/trama705Fact/";
declare namespace ns3 = "http://xmlns.oracle.com/bpel";
declare namespace ns0 = "http://xmlns.oracle.com/Trama705/Trama705_DF_Trama705";
declare namespace xf = "http://tempuri.org/ITEL/Trama705/Resources/XQueries/consultarReglasTrama705_Req/";

declare function xf:consultarReglasTrama705_Req($input_Parameters1 as element(ns2:Input_Parameters))
    as element(ns0:callFunctionStateless) {
        <ns0:callFunctionStateless>
            <ns0:parameterList>
                <ns1:TRAMA>
                    <HEADER>
                        <METODO>{ data($input_Parameters1/HEADER/METODO) }</METODO>
                        <MIN>{ data($input_Parameters1/HEADER/MIN) }</MIN>
                    </HEADER>
                    <PARAMETERS>
                        <CODIGO_COBRO>{ data($input_Parameters1/PARAMETERS/CODIGO_COBRO) }</CODIGO_COBRO>
                        <VIGENCIA>{ data($input_Parameters1/PARAMETERS/VIGENCIA) }</VIGENCIA>
                        <CANTIDAD_MENSAJES>{ data($input_Parameters1/PARAMETERS/CANTIDAD_MENSAJES) }</CANTIDAD_MENSAJES>
                    </PARAMETERS>
                    <RESULTADO>
                  		<ERROR></ERROR>
                  		<CONSULTASUSCRIPTOR/>
                  		<ACREDITACUENTA/>
                  		<MONTOCUENTA/>
                  		<CANTIDAD_MENSAJES/>
                  		<VIGENCIA_MENSAJES/>
                  		<VALIDA_MIN_COMCEL/>
               		</RESULTADO>
                </ns1:TRAMA>
            </ns0:parameterList>
        </ns0:callFunctionStateless>
};

declare variable $input_Parameters1 as element(ns2:Input_Parameters) external;

xf:consultarReglasTrama705_Req($input_Parameters1)
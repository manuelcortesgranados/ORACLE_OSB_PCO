xquery version "1.0" encoding "Cp1252";
(:: pragma bea:global-element-parameter parameter="$input_Parameters1" element="ns0:Input_Parameters" location="../Schemas/PS_ITEL_CONSULTAR_DETALLE_CUENTA.xsd" ::)
(:: pragma bea:global-element-return element="ns2:ConsultarBalancesRequest" location="../Schemas/DA_ITEL_OPERACION_OCS_AIR.xsd" ::)

declare namespace xf = "http://tempuri.org/ITEL/OCS/Resources/XQueries/consultarDetalleCuenta_Req/";
declare namespace ns2 = "http://www.comcel.com.co/OCS/OperacionOCS";
declare namespace ns1 = "http://www.comcel.com.co/OCS/OperacionTypes";
declare namespace ns0 = "http://www.comcel.com.co/ConsultarDetalleCuentaOCS/";

declare function xf:consultarDetalleCuenta_Req($input_Parameters1 as element(ns0:Input_Parameters))
    as element(ns2:ConsultarDetalleCuentaRequest) {
        <ns2:ConsultarDetalleCuentaRequest>
        <methodCall>
                <methodName>{ "GetAccountDetails" }</methodName>
                <params>
                    <param>
                        <value>
                            <struct>
                                <member>
                                    <name>{ "originNodeType" }</name>
                                    <value>
                                        <string>{ data($input_Parameters1/TIPO_NODO) }</string>
                                    </value>
                                </member>
                                <member>
                                    <name>{ "subscriberNumber" }</name>
                                    <value>
                                        <string>{ data($input_Parameters1/MIN) }</string>
                                    </value>
                                </member>
                                <member>
                                    <name>{ "originTransactionID" }</name>
                                    <value>
                                        <string>{ data($input_Parameters1/ID_TRANSACCION) }</string>
                                    </value>
                                </member>
                                <member>
                                    <name>{ "originHostName" }</name>
                                    <value>
                                        <string>{ data($input_Parameters1/HOST_ORIGEN) }</string>
                                    </value>
                                </member>
                                <member>
                                    <name>{ "originTimeStamp" }</name>
                                    <value>
                                        <dateTime.iso8601>{ data($input_Parameters1/FECHA_TRANSACCION) }</dateTime.iso8601>
                                    </value>
                                </member>
                                <member>
							      <name>{ "messageCapabilityFlag" }</name>     
							      <value>
							       <struct> 
							        <member> 
							         <name>{ "accountActivationFlag" }</name>
							         <value>
							           <boolean>{ data($input_Parameters1/FLAG_ACTIVACION_CUENTA) }</boolean>
							         </value>
							        </member>
							       </struct> 
							      </value>      
							     </member>                                    
                            </struct>
                        </value>
                    </param>
                </params>
            </methodCall>
        </ns2:ConsultarDetalleCuentaRequest>
};

declare variable $input_Parameters1 as element(ns0:Input_Parameters) external;

xf:consultarDetalleCuenta_Req($input_Parameters1)
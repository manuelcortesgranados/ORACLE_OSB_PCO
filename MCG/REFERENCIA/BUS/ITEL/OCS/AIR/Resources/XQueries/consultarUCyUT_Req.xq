(:: pragma bea:global-element-parameter parameter="$input_Parameters1" element="ns1:Input_Parameters" location="../Schemas/PS_ITEL_CONSULTAR_UCyUT.xsd" ::)
(:: pragma bea:global-element-return element="ns2:ConsultarUCyUTRequest" location="../Schemas/DA_ITEL_OPERACION_OCS_AIR.xsd" ::)

declare namespace ns0 = "http://www.comcel.com.co/OCS/OperacionTypes";
declare namespace ns2 = "http://www.comcel.com.co/OCS/OperacionOCS_AIR";
declare namespace ns1 = "http://www.comcel.com.co/ConsultarUCyUTOCS/";
declare namespace xf = "http://tempuri.org/ITEL/OCS/AIR/Resources/XQueries/consultarUCyUT_Req/";

declare function xf:consultarUCyUT_Req($input_Parameters1 as element(ns1:Input_Parameters))
    as element(ns2:ConsultarUCyUTRequest) {
        <ns2:ConsultarUCyUTRequest>
            <methodCall>
                <methodName>{ "GetUsageThresholdsAndCounters" }</methodName>
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
	                                    <name>{ "originHostName" }</name>
	                                    <value>
	                                        <string>{ data($input_Parameters1/HOST_ORIGEN) }</string>
	                                    </value>
	                                </member>
	                                <member>
	                                    <name>{ "originTransactionID" }</name>
	                                    <value>
	                                        <string>{ data($input_Parameters1/ID_TRANSACCION) }</string>
	                                    </value>
	                                </member>
	                                 <member>
	                                    <name>{ "originTimeStamp" }</name>
	                                    <value>
	                                        <dateTime.iso8601>{ data($input_Parameters1/FECHA_TRANSACCION) }</dateTime.iso8601>
	                                    </value>
	                                </member>
	                                <member>
	                                    <name>{ "subscriberNumber" }</name>
	                                    <value>
	                                        <string>{ data($input_Parameters1/MIN) }</string>
	                                    </value>
	                                </member>
	                            </struct>
	                        </value>
	                    </param>
	                </params>
            </methodCall>
        </ns2:ConsultarUCyUTRequest>
};

declare variable $input_Parameters1 as element(ns1:Input_Parameters) external;

xf:consultarUCyUT_Req($input_Parameters1)

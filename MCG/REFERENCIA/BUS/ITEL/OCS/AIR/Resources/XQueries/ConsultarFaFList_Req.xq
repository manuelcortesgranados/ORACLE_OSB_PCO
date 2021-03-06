xquery version "1.0" encoding "Cp1252";
(:: pragma bea:global-element-parameter parameter="$input_Parameters1" element="ns2:Input_Parameters" location="../Schemas/PS_ITEL_CONSULTAR_FAFLIST.xsd" ::)
(:: pragma bea:global-element-return element="ns0:ConsultarFaFListRequest" location="../Schemas/DA_ITEL_OPERACION_OCS_AIR.xsd" ::)

declare namespace xf = "http://tempuri.org/ITEL/OCS/AIR/Resources/XQueries/ConsultarFaFList_Req/";
declare namespace ns2 = "http://www.comcel.com.co/ConsultarFaFListOCS/";
declare namespace ns1 = "http://www.comcel.com.co/OCS/OperacionTypes";
declare namespace ns0 = "http://www.comcel.com.co/OCS/OperacionOCS_AIR";

declare function xf:ConsultarFaFList_Req($input_Parameters1 as element(ns2:Input_Parameters))
    as element(ns0:ConsultarFaFListRequest) {
        <ns0:ConsultarFaFListRequest>
	        <methodCall>
	                <methodName>{ "GetFaFList" }</methodName>
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
	                                <member>
	                                    <name>{ "requestedOwner" }</name>
	                                    <value>
	                                        <int>{ data($input_Parameters1/REQUESTED_OWNER) }</int>
	                                    </value>
	                                </member>
	                            </struct>
	                        </value>
	                    </param>
	                </params>
	            </methodCall>
        </ns0:ConsultarFaFListRequest>
};

declare variable $input_Parameters1 as element(ns2:Input_Parameters) external;

xf:ConsultarFaFList_Req($input_Parameters1)
xquery version "1.0" encoding "Cp1252";
(:: pragma bea:global-element-parameter parameter="$input_Parameters1" element="ns2:Input_Parameters" location="../Schemas/PS_ITEL_RECARGAR.xsd" ::)
(:: pragma bea:global-element-return element="ns1:RecargarRequest" location="../Schemas/DA_ITEL_OPERACION_OCS_AIR.xsd" ::)

declare namespace xf = "http://tempuri.org/ITEL/OCS/Resources/XQueries/recargar_Req/";
declare namespace ns2 = "http://www.comcel.com.co/RecargarOCS/";
declare namespace ns1 = "http://www.comcel.com.co/OCS/OperacionOCS";
declare namespace ns0 = "http://www.comcel.com.co/OCS/OperacionTypes";

declare function xf:timeStamp() as xs:string{	
	fn-bea:dateTime-to-string-with-format("yyMMddHHmmssSSS", current-dateTime())
};

declare function xf:recargar_Req($input_Parameters1 as element(ns2:Input_Parameters))
    as element(ns1:RecargarRequest) {
        <ns1:RecargarRequest>
        <methodCall>
                <methodName>{ "Refill" }</methodName>
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
                                    <name>{ "originTransactionID" }</name>
                                    <value>
                                        <string>{ concat(data($input_Parameters1/HOSTID),substring(data($input_Parameters1/MIN),12,1),xf:timeStamp()) }</string>
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
                                    <name>{ "subscriberNumber" }</name>
                                    <value>
                                        <string>{ data($input_Parameters1/MIN) }</string>
                                    </value>
                                </member>                                
                                
                                {
                                if(exists($input_Parameters1/CODIGO_VOUCHER)) then
                                <member>
                                    <name>{ "voucherActivationCode" }</name>
                                    <value>
	                                    <string>{data($input_Parameters1/CODIGO_VOUCHER) }</string>
                                    </value>
                                </member>
                                else 
                                	let $tag1 :=
                                	<member>
										<name>{ "transactionCurrency" }</name>
										<value><string>{ data($input_Parameters1/MONEDA) }</string></value>
									</member>,
									$tag2 :=                               
	                                <member>
										<name>{ "transactionAmount" }</name>
										<value><string>{ data($input_Parameters1/VALOR) }</string></value>
									</member>,
									$tag3 := 
									<member>
										<name>{ "refillProfileID" }</name>
										<value><string>{ data($input_Parameters1/PERFIL_RECARGA) }</string></value>
									</member>,
									$tag4 := 									
									<member>
										<name>{ "externalData2" }</name>
										<value><string>{ data($input_Parameters1/ID_TRANSACCION) }</string></value>
									</member>
									return ($tag1, $tag2, $tag3, $tag4)
								}
                                
                                <member>
										<name>{ "requestRefillAccountBeforeFlag" }</name>
										<value><boolean>{ "1" }</boolean></value>
									</member>
								{
								if(exists($input_Parameters1/CUENTA_LUEGO_RECARGA) and data($input_Parameters1/CUENTA_LUEGO_RECARGA) = "1") then
									<member>
										<name>{ "requestRefillAccountAfterFlag" }</name>
										<value><boolean>{ "1" }</boolean></value>
									</member>
								else	
									<member>
										<name>{ "requestRefillDetailsFlag" }</name>
										<value><boolean>{ "1" }</boolean></value>
									</member>
								}
								{
								if(exists($input_Parameters1/COMENTARIO)) then
									<member>
										<name>{ "externalData1" }</name>
										<value><string>{ data($input_Parameters1/COMENTARIO) }</string></value>
									</member>
								else	
									()
								}
                            </struct>
                        </value>
                    </param>
                </params>
            </methodCall>
            </ns1:RecargarRequest>
};

declare variable $input_Parameters1 as element(ns2:Input_Parameters) external;

xf:recargar_Req($input_Parameters1)
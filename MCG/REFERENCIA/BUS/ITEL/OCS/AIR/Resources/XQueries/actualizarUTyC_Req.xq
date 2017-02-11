xquery version "1.0" encoding "Cp1252";
(:: pragma bea:global-element-parameter parameter="$input_Parameters1" element="ns0:Input_Parameters" location="../Schemas/PS_ITEL_ACTUALIZAR_UTyC.xsd" ::)
(:: pragma bea:global-element-return element="ns2:ActualizarUTyCRequest" location="../Schemas/DA_ITEL_OPERACION_OCS_AIR.xsd" ::)

declare namespace xf = "http://tempuri.org/ITEL/OCS/AIR/Resources/XQueries/actualizarUTyC_Req/";
declare namespace ns0 = "http://www.comcel.com.co/ActualizarUTyCOCS/";
declare namespace ns2 = "http://www.comcel.com.co/OCS/OperacionOCS_AIR";
declare namespace ns1 = "http://www.comcel.com.co/OCS/OperacionTypes";

declare function xf:actualizarUTyC_Req($input_Parameters1 as element(ns0:Input_Parameters))
    as element(ns2:ActualizarUTyCRequest) {
        <ns2:ActualizarUTyCRequest>
         <methodCall>
                <methodName>{ "UpdateUsageThresholdsAndCounters" }</methodName>
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
	                                    <name>{ "originOperatorID" }</name>
	                                    <value>
	                                        <string>{ "5" }</string>
	                                    </value>
	                                </member>	                                
	                                
	                                { 
	                                  if (fn:exists($input_Parameters1/CONTADOR)) then	                                    
	                                    <member>	                                     
											<name>{"usageCounterUpdateInformation"}</name>
											<value>
												<array>
													<data>
														<value>
															<struct>
																<member>
																	<name>{"usageCounterID"}</name>
																	<value>
																		<i4>{ data($input_Parameters1/CONTADOR) }</i4>
																	</value>
																</member>
																<member>
																	<name>{"usageCounterValueNew"}</name>
																	<value>
																		<string>{ data($input_Parameters1/VALOR) }</string>
																	</value>
																</member>
															</struct>
														</value>
													</data>
												</array>
											</value>
									      </member>
	                                  else
	                                     <member>	                                     
											<name>{"usageThresholdUpdateInformation"}</name>
											<value>
												<array>
													<data>
														<value>
															<struct>
																<member>
																	<name>{"usageThresholdID"}</name>
																	<value>
																		<i4>{ data($input_Parameters1/THRESHOLD) }</i4>
																	</value>
																</member>
																<member>
																	<name>{"usageThresholdValueNew"}</name>
																	<value>
																		<string>{ data($input_Parameters1/VALOR) }</string>
																	</value>
																</member>
															</struct>
														</value>
													</data>
												</array>
											</value>
									      </member>
	                                }
	                                
	                            </struct>
	                        </value>
	                    </param>
	                </params>
            </methodCall>
        </ns2:ActualizarUTyCRequest>
};

declare variable $input_Parameters1 as element(ns0:Input_Parameters) external;

xf:actualizarUTyC_Req($input_Parameters1)

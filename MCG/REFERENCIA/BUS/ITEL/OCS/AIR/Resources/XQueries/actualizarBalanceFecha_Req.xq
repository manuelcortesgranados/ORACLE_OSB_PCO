xquery version "1.0" encoding "Cp1252";
(:: pragma bea:global-element-parameter parameter="$input_Parameters1" element="ns2:Input_Parameters" location="../Schemas/PS_ITEL_ACTUALIZAR_BALANCE_FECHA.xsd" ::)
(:: pragma bea:global-element-return element="ns1:ActualizarBalanceFechaRequest" location="../Schemas/DA_ITEL_OPERACION_OCS_AIR.xsd" ::)

declare namespace xf = "http://tempuri.org/ITEL/OCS/Resources/XQueries/actualizarBalanceFecha_Req/";
declare namespace ns2 = "http://www.comcel.com.co/ActualizarBalanceFechaOCS/";
declare namespace ns1 = "http://www.comcel.com.co/OCS/OperacionOCS";
declare namespace ns0 = "http://www.comcel.com.co/OCS/OperacionTypes";

declare function xf:timeStamp() as xs:string{	
	fn-bea:dateTime-to-string-with-format("yyMMddHHmmssSSS", current-dateTime())
};

declare function xf:actualizarBalanceFecha_Req($input_Parameters1 as element(ns2:Input_Parameters))
    as element(ns1:ActualizarBalanceFechaRequest) {
    <ns1:ActualizarBalanceFechaRequest>
        <methodCall>
                <methodName>{ "UpdateBalanceAndDate" }</methodName>
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
									<name>{ "transactionCurrency" }</name>
									<value><string>{ data($input_Parameters1/MONEDA) }</string></value>
								</member>
								<member>
									<name>{ "externalData2" }</name>
									<value><string>{ data($input_Parameters1/ID_TRANSACCION) }</string></value>
								</member>
								{
								if(exists($input_Parameters1/COMENTARIO)) then
									<member>
										<name>{ "externalData1" }</name>
										<value><string>{ data($input_Parameters1/COMENTARIO) }</string></value>
									</member>
								else	
									()
								}
								{
								if(exists($input_Parameters1/ACTIVAR_LINEA) and data($input_Parameters1/ACTIVAR_LINEA)="1") then
									<member>
										<name>messageCapabilityFlag</name>
										<value>
											<struct>
												<member>
													<name>accountActivationFlag</name>
													<value>
														<boolean>1</boolean>
													</value>
												</member>
											</struct>
										</value>
									</member>
								else
									()
								}
								
                                {
                                if(data($input_Parameters1/ID_CUENTA_DEDICADA1)="0") then
                                	let $valor :=
                                	if(exists($input_Parameters1/VALOR_RELATIVO1) and data($input_Parameters1/VALOR_RELATIVO1) != 0 ) then 
                                		<member>
											<name>{ "adjustmentAmountRelative" }</name>
											<value><string>{ data($input_Parameters1/VALOR_RELATIVO1) }</string></value>
										</member>
									else if(exists($input_Parameters1/VALOR_ABSOLUTO1) and data($input_Parameters1/VALOR_ABSOLUTO1) != 0 ) then 
                                		<member>
											<name>{ "adjustmentAmountRelative" }</name>
											<value><string>{ data($input_Parameters1/VALOR_ABSOLUTO1) }</string></value>
										</member>	
									else (),
									$valor2 :=
                                	if(exists($input_Parameters1/FECHA_EXPIRACION_RELATIVA1) and data($input_Parameters1/FECHA_EXPIRACION_RELATIVA1) != 0) then 
                                		<member>
											<name>{ "supervisionExpiryDateRelative" }</name>
											<value><int>{ data($input_Parameters1/FECHA_EXPIRACION_RELATIVA1) }</int></value>
										</member>
									else if(exists($input_Parameters1/FECHA_EXPIRACION_ABSOLUTA1) and data($input_Parameters1/FECHA_EXPIRACION_ABSOLUTA1) != "") then 
                                		<member>
											<name>{ "supervisionExpiryDate" }</name>
											<value><dateTime.iso8601>{ data($input_Parameters1/FECHA_EXPIRACION_ABSOLUTA1) }</dateTime.iso8601></value>
										</member>	
                                	else ()
									return ($valor, $valor2)
									
                                else ()
                                }
                                {
                                if(data($input_Parameters1/ID_CUENTA_DEDICADA1)!="0" or exists($input_Parameters1/ID_CUENTA_DEDICADA2)) then 
                                	<member>
										<name>{ "dedicatedAccountUpdateInformation" }</name>
										<value>
										<array>
											{
											 if(data($input_Parameters1/ID_CUENTA_DEDICADA1)!="0") then
												<data>
													<value>
													<struct>
														<member>
															<name>{ "dedicatedAccountID" }</name>
															<value><int>{ data($input_Parameters1/ID_CUENTA_DEDICADA1) }</int></value>
														</member>		
														<member>
															<name>{ "dedicatedAccountUnitType" }</name>
															<value><int>{ data($input_Parameters1/UNIT_TYPE_CUENTA_DEDICADA1) }</int></value>
														</member>										
														{
														let $valor :=
					                                	if(exists($input_Parameters1/VALOR_RELATIVO1) and data($input_Parameters1/VALOR_RELATIVO1) != 0) then 
					                                		<member>
																<name>{ "adjustmentAmountRelative" }</name>
																<value><string>{ data($input_Parameters1/VALOR_RELATIVO1) }</string></value>
															</member>
														else if(exists($input_Parameters1/VALOR_ABSOLUTO1) and data($input_Parameters1/VALOR_ABSOLUTO1) != 0) then 
					                                		<member>
																<name>{ "dedicatedAccountValueNew" }</name>
																<value><string>{ data($input_Parameters1/VALOR_ABSOLUTO1) }</string></value>
															</member>	
					                                	else (),
														$valor2 :=
					                                	if(exists($input_Parameters1/FECHA_EXPIRACION_RELATIVA1) and data($input_Parameters1/FECHA_EXPIRACION_RELATIVA1) != 0) then 
					                                		<member>
																<name>{ "adjustmentDateRelative" }</name>
																<value><int>{ data($input_Parameters1/FECHA_EXPIRACION_RELATIVA1) }</int></value>
															</member>
														else if(exists($input_Parameters1/FECHA_EXPIRACION_ABSOLUTA1) and data($input_Parameters1/FECHA_EXPIRACION_ABSOLUTA1) != "") then 
					                                		<member>
																<name>{ "expiryDate" }</name>
																<value><dateTime.iso8601>{ data($input_Parameters1/FECHA_EXPIRACION_ABSOLUTA1) }</dateTime.iso8601></value>
															</member>	
					                                	else ()
														return ($valor, $valor2)
														}
													</struct>
													</value>
												</data>
											else ()		
											}
											
											{
											 if(exists($input_Parameters1/ID_CUENTA_DEDICADA2)) then
												<data>
													<value>
													<struct>
														<member>
															<name>{ "dedicatedAccountID" }</name>
															<value><int>{ data($input_Parameters1/ID_CUENTA_DEDICADA2) }</int></value>
														</member>		
														<member>
															<name>{ "dedicatedAccountUnitType" }</name>
															<value><int>{ data($input_Parameters1/UNIT_TYPE_CUENTA_DEDICADA2) }</int></value>
														</member>										
														{
														let $valor :=
					                                	if(exists($input_Parameters1/VALOR_RELATIVO2) and data($input_Parameters1/VALOR_RELATIVO2) != 0) then 
					                                		<member>
																<name>{ "adjustmentAmountRelative" }</name>
																<value><string>{ data($input_Parameters1/VALOR_RELATIVO2) }</string></value>
															</member>
														else if(exists($input_Parameters1/VALOR_ABSOLUTO2) and data($input_Parameters1/VALOR_ABSOLUTO2) != 0) then 
					                                		<member>
																<name>{ "dedicatedAccountValueNew" }</name>
																<value><string>{ data($input_Parameters1/VALOR_ABSOLUTO2) }</string></value>
															</member>	
					                                	else (),
														$valor2 :=
					                                	if(exists($input_Parameters1/FECHA_EXPIRACION_RELATIVA2) and data($input_Parameters1/FECHA_EXPIRACION_RELATIVA2) != 0) then 
					                                		<member>
																<name>{ "adjustmentDateRelative" }</name>
																<value><int>{ data($input_Parameters1/FECHA_EXPIRACION_RELATIVA2) }</int></value>
															</member>
														else if(exists($input_Parameters1/FECHA_EXPIRACION_ABSOLUTA2) and data($input_Parameters1/FECHA_EXPIRACION_ABSOLUTA2) != "") then 
					                                		<member>
																<name>{ "expiryDate" }</name>
																<value><dateTime.iso8601>{ data($input_Parameters1/FECHA_EXPIRACION_ABSOLUTA2) }</dateTime.iso8601></value>
															</member>		
					                                	else ()
														return ($valor, $valor2)
														}
													</struct>
													</value>
												</data>
											else ()		
											}
											
											{
											 if(exists($input_Parameters1/ID_CUENTA_DEDICADA3)) then
												<data>
													<value>
													<struct>
														<member>
															<name>{ "dedicatedAccountID" }</name>
															<value><int>{ data($input_Parameters1/ID_CUENTA_DEDICADA3) }</int></value>
														</member>		
														<member>
															<name>{ "dedicatedAccountUnitType" }</name>
															<value><int>{ data($input_Parameters1/UNIT_TYPE_CUENTA_DEDICADA3) }</int></value>
														</member>										
														{
														let $valor :=
					                                	if(exists($input_Parameters1/VALOR_RELATIVO3) and data($input_Parameters1/VALOR_RELATIVO3) != 0 ) then 
					                                		<member>
																<name>{ "adjustmentAmountRelative" }</name>
																<value><string>{ data($input_Parameters1/VALOR_RELATIVO3) }</string></value>
															</member>
														else if(exists($input_Parameters1/VALOR_ABSOLUTO3) and data($input_Parameters1/VALOR_ABSOLUTO3) != 0) then 
					                                		<member>
																<name>{ "dedicatedAccountValueNew" }</name>
																<value><string>{ data($input_Parameters1/VALOR_ABSOLUTO3) }</string></value>
															</member>	
					                                	else (),
														$valor2 :=
					                                	if(exists($input_Parameters1/FECHA_EXPIRACION_RELATIVA3) and data($input_Parameters1/FECHA_EXPIRACION_RELATIVA3) != 0) then 
					                                		<member>
																<name>{ "adjustmentDateRelative" }</name>
																<value><int>{ data($input_Parameters1/FECHA_EXPIRACION_RELATIVA3) }</int></value>
															</member>
														else if(exists($input_Parameters1/FECHA_EXPIRACION_ABSOLUTA3) and data($input_Parameters1/FECHA_EXPIRACION_ABSOLUTA3) != "") then 
					                                		<member>
																<name>{ "expiryDate" }</name>
																<value><dateTime.iso8601>{ data($input_Parameters1/FECHA_EXPIRACION_ABSOLUTA3) }</dateTime.iso8601></value>
															</member>			
					                                	else ()
														return ($valor, $valor2)
														}
													</struct>
													</value>
												</data>
											else ()		
											}
											
											{
											 if(exists($input_Parameters1/ID_CUENTA_DEDICADA4)) then
												<data>
													<value>
													<struct>
														<member>
															<name>{ "dedicatedAccountID" }</name>
															<value><int>{ data($input_Parameters1/ID_CUENTA_DEDICADA4) }</int></value>
														</member>		
														<member>
															<name>{ "dedicatedAccountUnitType" }</name>
															<value><int>{ data($input_Parameters1/UNIT_TYPE_CUENTA_DEDICADA4) }</int></value>
														</member>										
														{
														let $valor :=
					                                	if(exists($input_Parameters1/VALOR_RELATIVO4) and data($input_Parameters1/VALOR_RELATIVO4) != 0) then 
					                                		<member>
																<name>{ "adjustmentAmountRelative" }</name>
																<value><string>{ data($input_Parameters1/VALOR_RELATIVO4) }</string></value>
															</member>
														else if(exists($input_Parameters1/VALOR_ABSOLUTO4) and data($input_Parameters1/VALOR_ABSOLUTO4) != 0) then 
					                                		<member>
																<name>{ "dedicatedAccountValueNew" }</name>
																<value><string>{ data($input_Parameters1/VALOR_ABSOLUTO4) }</string></value>
															</member>	
					                                	else (),
														$valor2 :=
					                                	if(exists($input_Parameters1/FECHA_EXPIRACION_RELATIVA4) and data($input_Parameters1/FECHA_EXPIRACION_RELATIVA4) != 0) then 
					                                		<member>
																<name>{ "adjustmentDateRelative" }</name>
																<value><int>{ data($input_Parameters1/FECHA_EXPIRACION_RELATIVA4) }</int></value>
															</member>
														else if(exists($input_Parameters1/FECHA_EXPIRACION_ABSOLUTA4) and data($input_Parameters1/FECHA_EXPIRACION_ABSOLUTA4) != "") then 
					                                		<member>
																<name>{ "expiryDate" }</name>
																<value><dateTime.iso8601>{ data($input_Parameters1/FECHA_EXPIRACION_ABSOLUTA4) }</dateTime.iso8601></value>
															</member>			
					                                	else ()
														return ($valor, $valor2)
														}
													</struct>
													</value>
												</data>
											else ()		
											}
											
											{
											 if(exists($input_Parameters1/ID_CUENTA_DEDICADA5)) then
												<data>
													<value>
													<struct>
														<member>
															<name>{ "dedicatedAccountID" }</name>
															<value><int>{ data($input_Parameters1/ID_CUENTA_DEDICADA5) }</int></value>
														</member>		
														<member>
															<name>{ "dedicatedAccountUnitType" }</name>
															<value><int>{ data($input_Parameters1/UNIT_TYPE_CUENTA_DEDICADA5) }</int></value>
														</member>										
														{
														let $valor :=
					                                	if(exists($input_Parameters1/VALOR_RELATIVO5) and data($input_Parameters1/VALOR_RELATIVO5) != 0) then 
					                                		<member>
																<name>{ "adjustmentAmountRelative" }</name>
																<value><string>{ data($input_Parameters1/VALOR_RELATIVO5) }</string></value>
															</member>
														else if(exists($input_Parameters1/VALOR_ABSOLUTO5) and data($input_Parameters1/VALOR_ABSOLUTO5) != 0) then 
					                                		<member>
																<name>{ "dedicatedAccountValueNew" }</name>
																<value><string>{ data($input_Parameters1/VALOR_ABSOLUTO5) }</string></value>
															</member>	
					                                	else (),
														$valor2 :=
					                                	if(exists($input_Parameters1/FECHA_EXPIRACION_RELATIVA5) and data($input_Parameters1/FECHA_EXPIRACION_RELATIVA5) != 0) then 
					                                		<member>
																<name>{ "adjustmentDateRelative" }</name>
																<value><int>{ data($input_Parameters1/FECHA_EXPIRACION_RELATIVA5) }</int></value>
															</member>
														else if(exists($input_Parameters1/FECHA_EXPIRACION_ABSOLUTA5) and data($input_Parameters1/FECHA_EXPIRACION_ABSOLUTA5) != "") then 
					                                		<member>
																<name>{ "expiryDate" }</name>
																<value><dateTime.iso8601>{ data($input_Parameters1/FECHA_EXPIRACION_ABSOLUTA5) }</dateTime.iso8601></value>
															</member>			
					                                	else ()
														return ($valor, $valor2)
														}
													</struct>
													</value>
												</data>
											else ()		
											}
											
											{
											 if(exists($input_Parameters1/ID_CUENTA_DEDICADA6)) then
												<data>
													<value>
													<struct>
														<member>
															<name>{ "dedicatedAccountID" }</name>
															<value><int>{ data($input_Parameters1/ID_CUENTA_DEDICADA6) }</int></value>
														</member>		
														<member>
															<name>{ "dedicatedAccountUnitType" }</name>
															<value><int>{ data($input_Parameters1/UNIT_TYPE_CUENTA_DEDICADA6) }</int></value>
														</member>										
														{
														let $valor :=
					                                	if(exists($input_Parameters1/VALOR_RELATIVO6) and data($input_Parameters1/VALOR_RELATIVO6) != 0) then 
					                                		<member>
																<name>{ "adjustmentAmountRelative" }</name>
																<value><string>{ data($input_Parameters1/VALOR_RELATIVO6) }</string></value>
															</member>
														else if(exists($input_Parameters1/VALOR_ABSOLUTO6) and data($input_Parameters1/VALOR_ABSOLUTO6) != 0) then 
					                                		<member>
																<name>{ "dedicatedAccountValueNew" }</name>
																<value><string>{ data($input_Parameters1/VALOR_ABSOLUTO6) }</string></value>
															</member>	
					                                	else (),
														$valor2 :=
					                                	if(exists($input_Parameters1/FECHA_EXPIRACION_RELATIVA6) and data($input_Parameters1/FECHA_EXPIRACION_RELATIVA6) != 0) then 
					                                		<member>
																<name>{ "adjustmentDateRelative" }</name>
																<value><int>{ data($input_Parameters1/FECHA_EXPIRACION_RELATIVA6) }</int></value>
															</member>
														else if(exists($input_Parameters1/FECHA_EXPIRACION_ABSOLUTA6) and data($input_Parameters1/FECHA_EXPIRACION_ABSOLUTA6) != "") then 
					                                		<member>
																<name>{ "expiryDate" }</name>
																<value><dateTime.iso8601>{ data($input_Parameters1/FECHA_EXPIRACION_ABSOLUTA6) }</dateTime.iso8601></value>
															</member>			
					                                	else ()
														return ($valor, $valor2)
														}
													</struct>
													</value>
												</data>
											else ()		
											}
											
											{
											 if(exists($input_Parameters1/ID_CUENTA_DEDICADA7)) then
												<data>
													<value>
													<struct>
														<member>
															<name>{ "dedicatedAccountID" }</name>
															<value><int>{ data($input_Parameters1/ID_CUENTA_DEDICADA7) }</int></value>
														</member>		
														<member>
															<name>{ "dedicatedAccountUnitType" }</name>
															<value><int>{ data($input_Parameters1/UNIT_TYPE_CUENTA_DEDICADA7) }</int></value>
														</member>										
														{
														let $valor :=
					                                	if(exists($input_Parameters1/VALOR_RELATIVO7) and data($input_Parameters1/VALOR_RELATIVO7) != 0) then 
					                                		<member>
																<name>{ "adjustmentAmountRelative" }</name>
																<value><string>{ data($input_Parameters1/VALOR_RELATIVO7) }</string></value>
															</member>
														else if(exists($input_Parameters1/VALOR_ABSOLUTO7) and data($input_Parameters1/VALOR_ABSOLUTO7) != 0) then 
					                                		<member>
																<name>{ "dedicatedAccountValueNew" }</name>
																<value><string>{ data($input_Parameters1/VALOR_ABSOLUTO7) }</string></value>
															</member>	
					                                	else (),
														$valor2 :=
					                                	if(exists($input_Parameters1/FECHA_EXPIRACION_RELATIVA7) and data($input_Parameters1/FECHA_EXPIRACION_RELATIVA7) != 0) then 
					                                		<member>
																<name>{ "adjustmentDateRelative" }</name>
																<value><int>{ data($input_Parameters1/FECHA_EXPIRACION_RELATIVA7) }</int></value>
															</member>
														else if(exists($input_Parameters1/FECHA_EXPIRACION_ABSOLUTA7) and data($input_Parameters1/FECHA_EXPIRACION_ABSOLUTA7) != "") then 
					                                		<member>
																<name>{ "expiryDate" }</name>
																<value><dateTime.iso8601>{ data($input_Parameters1/FECHA_EXPIRACION_ABSOLUTA7) }</dateTime.iso8601></value>
															</member>			
					                                	else ()
														return ($valor, $valor2)
														}
													</struct>
													</value>
												</data>
											else ()		
											}
											
											{
											 if(exists($input_Parameters1/ID_CUENTA_DEDICADA8)) then
												<data>
													<value>
													<struct>
														<member>
															<name>{ "dedicatedAccountID" }</name>
															<value><int>{ data($input_Parameters1/ID_CUENTA_DEDICADA8) }</int></value>
														</member>		
														<member>
															<name>{ "dedicatedAccountUnitType" }</name>
															<value><int>{ data($input_Parameters1/UNIT_TYPE_CUENTA_DEDICADA8) }</int></value>
														</member>										
														{
														let $valor :=
					                                	if(exists($input_Parameters1/VALOR_RELATIVO8) and data($input_Parameters1/VALOR_RELATIVO8) != 0) then 
					                                		<member>
																<name>{ "adjustmentAmountRelative" }</name>
																<value><string>{ data($input_Parameters1/VALOR_RELATIVO8) }</string></value>
															</member>
														else if(exists($input_Parameters1/VALOR_ABSOLUTO8) and data($input_Parameters1/VALOR_ABSOLUTO8) != 0) then 
					                                		<member>
																<name>{ "dedicatedAccountValueNew" }</name>
																<value><string>{ data($input_Parameters1/VALOR_ABSOLUTO8) }</string></value>
															</member>	
					                                	else (),
														$valor2 :=
					                                	if(exists($input_Parameters1/FECHA_EXPIRACION_RELATIVA8) and data($input_Parameters1/FECHA_EXPIRACION_RELATIVA8) != 0) then 
					                                		<member>
																<name>{ "adjustmentDateRelative" }</name>
																<value><int>{ data($input_Parameters1/FECHA_EXPIRACION_RELATIVA8) }</int></value>
															</member>
														else if(exists($input_Parameters1/FECHA_EXPIRACION_ABSOLUTA8) and data($input_Parameters1/FECHA_EXPIRACION_ABSOLUTA8) != "") then 
					                                		<member>
																<name>{ "expiryDate" }</name>
																<value><dateTime.iso8601>{ data($input_Parameters1/FECHA_EXPIRACION_ABSOLUTA8) }</dateTime.iso8601></value>
															</member>			
					                                	else ()
														return ($valor, $valor2)
														}
													</struct>
													</value>
												</data>
											else ()		
											}
											
											{
											 if(exists($input_Parameters1/ID_CUENTA_DEDICADA9)) then
												<data>
													<value>
													<struct>
														<member>
															<name>{ "dedicatedAccountID" }</name>
															<value><int>{ data($input_Parameters1/ID_CUENTA_DEDICADA9) }</int></value>
														</member>		
														<member>
															<name>{ "dedicatedAccountUnitType" }</name>
															<value><int>{ data($input_Parameters1/UNIT_TYPE_CUENTA_DEDICADA9) }</int></value>
														</member>										
														{
														let $valor :=
					                                	if(exists($input_Parameters1/VALOR_RELATIVO9) and data($input_Parameters1/VALOR_RELATIVO9) != 0) then 
					                                		<member>
																<name>{ "adjustmentAmountRelative" }</name>
																<value><string>{ data($input_Parameters1/VALOR_RELATIVO9) }</string></value>
															</member>
														else if(exists($input_Parameters1/VALOR_ABSOLUTO9) and data($input_Parameters1/VALOR_ABSOLUTO9) != 0) then 
					                                		<member>
																<name>{ "dedicatedAccountValueNew" }</name>
																<value><string>{ data($input_Parameters1/VALOR_ABSOLUTO9) }</string></value>
															</member>	
					                                	else (),
														$valor2 :=
					                                	if(exists($input_Parameters1/FECHA_EXPIRACION_RELATIVA9) and data($input_Parameters1/FECHA_EXPIRACION_RELATIVA9) != 0) then 
					                                		<member>
																<name>{ "adjustmentDateRelative" }</name>
																<value><int>{ data($input_Parameters1/FECHA_EXPIRACION_RELATIVA9) }</int></value>
															</member>
														else if(exists($input_Parameters1/FECHA_EXPIRACION_ABSOLUTA9) and data($input_Parameters1/FECHA_EXPIRACION_ABSOLUTA9) != "") then 
					                                		<member>
																<name>{ "expiryDate" }</name>
																<value><dateTime.iso8601>{ data($input_Parameters1/FECHA_EXPIRACION_ABSOLUTA9) }</dateTime.iso8601></value>
															</member>			
					                                	else ()
														return ($valor, $valor2)
														}
													</struct>
													</value>
												</data>
											else ()		
											}
											
											{
											 if(exists($input_Parameters1/ID_CUENTA_DEDICADA10)) then
												<data>
													<value>
													<struct>
														<member>
															<name>{ "dedicatedAccountID" }</name>
															<value><int>{ data($input_Parameters1/ID_CUENTA_DEDICADA10) }</int></value>
														</member>		
														<member>
															<name>{ "dedicatedAccountUnitType" }</name>
															<value><int>{ data($input_Parameters1/UNIT_TYPE_CUENTA_DEDICADA10) }</int></value>
														</member>										
														{
														let $valor :=
					                                	if(exists($input_Parameters1/VALOR_RELATIVO10) and data($input_Parameters1/VALOR_RELATIVO10) != 0) then 
					                                		<member>
																<name>{ "adjustmentAmountRelative" }</name>
																<value><string>{ data($input_Parameters1/VALOR_RELATIVO10) }</string></value>
															</member>
														else if(exists($input_Parameters1/VALOR_ABSOLUTO10) and data($input_Parameters1/VALOR_ABSOLUTO10) != 0) then 
					                                		<member>
																<name>{ "dedicatedAccountValueNew" }</name>
																<value><string>{ data($input_Parameters1/VALOR_ABSOLUTO10) }</string></value>
															</member>	
					                                	else (),
														$valor2 :=
					                                	if(exists($input_Parameters1/FECHA_EXPIRACION_RELATIVA10) and data($input_Parameters1/FECHA_EXPIRACION_RELATIVA10) != 0) then 
					                                		<member>
																<name>{ "adjustmentDateRelative" }</name>
																<value><int>{ data($input_Parameters1/FECHA_EXPIRACION_RELATIVA10) }</int></value>
															</member>
														else if(exists($input_Parameters1/FECHA_EXPIRACION_ABSOLUTA10) and data($input_Parameters1/FECHA_EXPIRACION_ABSOLUTA10) != "") then 
					                                		<member>
																<name>{ "expiryDate" }</name>
																<value><dateTime.iso8601>{ data($input_Parameters1/FECHA_EXPIRACION_ABSOLUTA10) }</dateTime.iso8601></value>
															</member>		
					                                	else ()
														return ($valor, $valor2)
														}
													</struct>
													</value>
												</data>
											else ()		
											}											
											
											{
											 if(exists($input_Parameters1/ID_CUENTA_DEDICADA11)) then
												<data>
													<value>
													<struct>
														<member>
															<name>{ "dedicatedAccountID" }</name>
															<value><int>{ data($input_Parameters1/ID_CUENTA_DEDICADA11) }</int></value>
														</member>		
														<member>
															<name>{ "dedicatedAccountUnitType" }</name>
															<value><int>{ data($input_Parameters1/UNIT_TYPE_CUENTA_DEDICADA11) }</int></value>
														</member>										
														{
														let $valor :=
					                                	if(exists($input_Parameters1/VALOR_RELATIVO11) and data($input_Parameters1/VALOR_RELATIVO11) != 0) then 
					                                		<member>
																<name>{ "adjustmentAmountRelative" }</name>
																<value><string>{ data($input_Parameters1/VALOR_RELATIVO11) }</string></value>
															</member>
														else if(exists($input_Parameters1/VALOR_ABSOLUTO11) and data($input_Parameters1/VALOR_ABSOLUTO11) != 0) then 
					                                		<member>
																<name>{ "dedicatedAccountValueNew" }</name>
																<value><string>{ data($input_Parameters1/VALOR_ABSOLUTO11) }</string></value>
															</member>	
					                                	else (),
														$valor2 :=
					                                	if(exists($input_Parameters1/FECHA_EXPIRACION_RELATIVA11) and data($input_Parameters1/FECHA_EXPIRACION_RELATIVA11) != 0) then 
					                                		<member>
																<name>{ "adjustmentDateRelative" }</name>
																<value><int>{ data($input_Parameters1/FECHA_EXPIRACION_RELATIVA11) }</int></value>
															</member>
														else if(exists($input_Parameters1/FECHA_EXPIRACION_ABSOLUTA11) and data($input_Parameters1/FECHA_EXPIRACION_ABSOLUTA11) != "") then 
					                                		<member>
																<name>{ "expiryDate" }</name>
																<value><dateTime.iso8601>{ data($input_Parameters1/FECHA_EXPIRACION_ABSOLUTA11) }</dateTime.iso8601></value>
															</member>		
					                                	else ()
														return ($valor, $valor2)
														}
													</struct>
													</value>
												</data>
											else ()		
											}						
											
											{
											 if(exists($input_Parameters1/ID_CUENTA_DEDICADA12)) then
												<data>
													<value>
													<struct>
														<member>
															<name>{ "dedicatedAccountID" }</name>
															<value><int>{ data($input_Parameters1/ID_CUENTA_DEDICADA12) }</int></value>
														</member>		
														<member>
															<name>{ "dedicatedAccountUnitType" }</name>
															<value><int>{ data($input_Parameters1/UNIT_TYPE_CUENTA_DEDICADA12) }</int></value>
														</member>										
														{
														let $valor :=
					                                	if(exists($input_Parameters1/VALOR_RELATIVO12) and data($input_Parameters1/VALOR_RELATIVO12) != 0) then 
					                                		<member>
																<name>{ "adjustmentAmountRelative" }</name>
																<value><string>{ data($input_Parameters1/VALOR_RELATIVO12) }</string></value>
															</member>
														else if(exists($input_Parameters1/VALOR_ABSOLUTO12) and data($input_Parameters1/VALOR_ABSOLUTO12) != 0) then 
					                                		<member>
																<name>{ "dedicatedAccountValueNew" }</name>
																<value><string>{ data($input_Parameters1/VALOR_ABSOLUTO12) }</string></value>
															</member>	
					                                	else (),
														$valor2 :=
					                                	if(exists($input_Parameters1/FECHA_EXPIRACION_RELATIVA12) and data($input_Parameters1/FECHA_EXPIRACION_RELATIVA12) != 0) then 
					                                		<member>
																<name>{ "adjustmentDateRelative" }</name>
																<value><int>{ data($input_Parameters1/FECHA_EXPIRACION_RELATIVA12) }</int></value>
															</member>
														else if(exists($input_Parameters1/FECHA_EXPIRACION_ABSOLUTA12) and data($input_Parameters1/FECHA_EXPIRACION_ABSOLUTA12) != "") then 
					                                		<member>
																<name>{ "expiryDate" }</name>
																<value><dateTime.iso8601>{ data($input_Parameters1/FECHA_EXPIRACION_ABSOLUTA12) }</dateTime.iso8601></value>
															</member>		
					                                	else ()
														return ($valor, $valor2)
														}
													</struct>
													</value>
												</data>
											else ()		
											}						
											
											{
											 if(exists($input_Parameters1/ID_CUENTA_DEDICADA13)) then
												<data>
													<value>
													<struct>
														<member>
															<name>{ "dedicatedAccountID" }</name>
															<value><int>{ data($input_Parameters1/ID_CUENTA_DEDICADA13) }</int></value>
														</member>		
														<member>
															<name>{ "dedicatedAccountUnitType" }</name>
															<value><int>{ data($input_Parameters1/UNIT_TYPE_CUENTA_DEDICADA13) }</int></value>
														</member>										
														{
														let $valor :=
					                                	if(exists($input_Parameters1/VALOR_RELATIVO13) and data($input_Parameters1/VALOR_RELATIVO13) != 0) then 
					                                		<member>
																<name>{ "adjustmentAmountRelative" }</name>
																<value><string>{ data($input_Parameters1/VALOR_RELATIVO13) }</string></value>
															</member>
														else if(exists($input_Parameters1/VALOR_ABSOLUTO13) and data($input_Parameters1/VALOR_ABSOLUTO13) != 0) then 
					                                		<member>
																<name>{ "dedicatedAccountValueNew" }</name>
																<value><string>{ data($input_Parameters1/VALOR_ABSOLUTO13) }</string></value>
															</member>	
					                                	else (),
														$valor2 :=
					                                	if(exists($input_Parameters1/FECHA_EXPIRACION_RELATIVA13) and data($input_Parameters1/FECHA_EXPIRACION_RELATIVA13) != 0) then 
					                                		<member>
																<name>{ "adjustmentDateRelative" }</name>
																<value><int>{ data($input_Parameters1/FECHA_EXPIRACION_RELATIVA13) }</int></value>
															</member>
														else if(exists($input_Parameters1/FECHA_EXPIRACION_ABSOLUTA13) and data($input_Parameters1/FECHA_EXPIRACION_ABSOLUTA13) != "") then 
					                                		<member>
																<name>{ "expiryDate" }</name>
																<value><dateTime.iso8601>{ data($input_Parameters1/FECHA_EXPIRACION_ABSOLUTA13) }</dateTime.iso8601></value>
															</member>		
					                                	else ()
														return ($valor, $valor2)
														}
													</struct>
													</value>
												</data>
											else ()		
											}						
											
											{
											 if(exists($input_Parameters1/ID_CUENTA_DEDICADA14)) then
												<data>
													<value>
													<struct>
														<member>
															<name>{ "dedicatedAccountID" }</name>
															<value><int>{ data($input_Parameters1/ID_CUENTA_DEDICADA14) }</int></value>
														</member>		
														<member>
															<name>{ "dedicatedAccountUnitType" }</name>
															<value><int>{ data($input_Parameters1/UNIT_TYPE_CUENTA_DEDICADA14) }</int></value>
														</member>										
														{
														let $valor :=
					                                	if(exists($input_Parameters1/VALOR_RELATIVO14) and data($input_Parameters1/VALOR_RELATIVO14) != 0) then 
					                                		<member>
																<name>{ "adjustmentAmountRelative" }</name>
																<value><string>{ data($input_Parameters1/VALOR_RELATIVO14) }</string></value>
															</member>
														else if(exists($input_Parameters1/VALOR_ABSOLUTO14) and data($input_Parameters1/VALOR_ABSOLUTO14) != 0) then 
					                                		<member>
																<name>{ "dedicatedAccountValueNew" }</name>
																<value><string>{ data($input_Parameters1/VALOR_ABSOLUTO14) }</string></value>
															</member>	
					                                	else (),
														$valor2 :=
					                                	if(exists($input_Parameters1/FECHA_EXPIRACION_RELATIVA14) and data($input_Parameters1/FECHA_EXPIRACION_RELATIVA14) != 0) then 
					                                		<member>
																<name>{ "adjustmentDateRelative" }</name>
																<value><int>{ data($input_Parameters1/FECHA_EXPIRACION_RELATIVA14) }</int></value>
															</member>
														else if(exists($input_Parameters1/FECHA_EXPIRACION_ABSOLUTA14) and data($input_Parameters1/FECHA_EXPIRACION_ABSOLUTA14) != "") then 
					                                		<member>
																<name>{ "expiryDate" }</name>
																<value><dateTime.iso8601>{ data($input_Parameters1/FECHA_EXPIRACION_ABSOLUTA14) }</dateTime.iso8601></value>
															</member>		
					                                	else ()
														return ($valor, $valor2)
														}
													</struct>
													</value>
												</data>
											else ()		
											}						
											
											{
											 if(exists($input_Parameters1/ID_CUENTA_DEDICADA15)) then
												<data>
													<value>
													<struct>
														<member>
															<name>{ "dedicatedAccountID" }</name>
															<value><int>{ data($input_Parameters1/ID_CUENTA_DEDICADA15) }</int></value>
														</member>		
														<member>
															<name>{ "dedicatedAccountUnitType" }</name>
															<value><int>{ data($input_Parameters1/UNIT_TYPE_CUENTA_DEDICADA15) }</int></value>
														</member>										
														{
														let $valor :=
					                                	if(exists($input_Parameters1/VALOR_RELATIVO15) and data($input_Parameters1/VALOR_RELATIVO15) != 0) then 
					                                		<member>
																<name>{ "adjustmentAmountRelative" }</name>
																<value><string>{ data($input_Parameters1/VALOR_RELATIVO15) }</string></value>
															</member>
														else if(exists($input_Parameters1/VALOR_ABSOLUTO15) and data($input_Parameters1/VALOR_ABSOLUTO15) != 0) then 
					                                		<member>
																<name>{ "dedicatedAccountValueNew" }</name>
																<value><string>{ data($input_Parameters1/VALOR_ABSOLUTO15) }</string></value>
															</member>	
					                                	else (),
														$valor2 :=
					                                	if(exists($input_Parameters1/FECHA_EXPIRACION_RELATIVA15) and data($input_Parameters1/FECHA_EXPIRACION_RELATIVA15) != 0) then 
					                                		<member>
																<name>{ "adjustmentDateRelative" }</name>
																<value><int>{ data($input_Parameters1/FECHA_EXPIRACION_RELATIVA15) }</int></value>
															</member>
														else if(exists($input_Parameters1/FECHA_EXPIRACION_ABSOLUTA15) and data($input_Parameters1/FECHA_EXPIRACION_ABSOLUTA15) != "") then 
					                                		<member>
																<name>{ "expiryDate" }</name>
																<value><dateTime.iso8601>{ data($input_Parameters1/FECHA_EXPIRACION_ABSOLUTA15) }</dateTime.iso8601></value>
															</member>		
					                                	else ()
														return ($valor, $valor2)
														}
													</struct>
													</value>
												</data>
											else ()		
											}						
											
											{
											 if(exists($input_Parameters1/ID_CUENTA_DEDICADA16)) then
												<data>
													<value>
													<struct>
														<member>
															<name>{ "dedicatedAccountID" }</name>
															<value><int>{ data($input_Parameters1/ID_CUENTA_DEDICADA16) }</int></value>
														</member>		
														<member>
															<name>{ "dedicatedAccountUnitType" }</name>
															<value><int>{ data($input_Parameters1/UNIT_TYPE_CUENTA_DEDICADA16) }</int></value>
														</member>										
														{
														let $valor :=
					                                	if(exists($input_Parameters1/VALOR_RELATIVO16) and data($input_Parameters1/VALOR_RELATIVO16) != 0) then 
					                                		<member>
																<name>{ "adjustmentAmountRelative" }</name>
																<value><string>{ data($input_Parameters1/VALOR_RELATIVO16) }</string></value>
															</member>
														else if(exists($input_Parameters1/VALOR_ABSOLUTO16) and data($input_Parameters1/VALOR_ABSOLUTO16) != 0) then 
					                                		<member>
																<name>{ "dedicatedAccountValueNew" }</name>
																<value><string>{ data($input_Parameters1/VALOR_ABSOLUTO16) }</string></value>
															</member>	
					                                	else (),
														$valor2 :=
					                                	if(exists($input_Parameters1/FECHA_EXPIRACION_RELATIVA16) and data($input_Parameters1/FECHA_EXPIRACION_RELATIVA16) != 0) then 
					                                		<member>
																<name>{ "adjustmentDateRelative" }</name>
																<value><int>{ data($input_Parameters1/FECHA_EXPIRACION_RELATIVA16) }</int></value>
															</member>
														else if(exists($input_Parameters1/FECHA_EXPIRACION_ABSOLUTA16) and data($input_Parameters1/FECHA_EXPIRACION_ABSOLUTA16) != "") then 
					                                		<member>
																<name>{ "expiryDate" }</name>
																<value><dateTime.iso8601>{ data($input_Parameters1/FECHA_EXPIRACION_ABSOLUTA16) }</dateTime.iso8601></value>
															</member>		
					                                	else ()
														return ($valor, $valor2)
														}
													</struct>
													</value>
												</data>
											else ()		
											}						
											
											{
											 if(exists($input_Parameters1/ID_CUENTA_DEDICADA17)) then
												<data>
													<value>
													<struct>
														<member>
															<name>{ "dedicatedAccountID" }</name>
															<value><int>{ data($input_Parameters1/ID_CUENTA_DEDICADA17) }</int></value>
														</member>		
														<member>
															<name>{ "dedicatedAccountUnitType" }</name>
															<value><int>{ data($input_Parameters1/UNIT_TYPE_CUENTA_DEDICADA17) }</int></value>
														</member>										
														{
														let $valor :=
					                                	if(exists($input_Parameters1/VALOR_RELATIVO17) and data($input_Parameters1/VALOR_RELATIVO17) != 0) then 
					                                		<member>
																<name>{ "adjustmentAmountRelative" }</name>
																<value><string>{ data($input_Parameters1/VALOR_RELATIVO17) }</string></value>
															</member>
														else if(exists($input_Parameters1/VALOR_ABSOLUTO17) and data($input_Parameters1/VALOR_ABSOLUTO17) != 0) then 
					                                		<member>
																<name>{ "dedicatedAccountValueNew" }</name>
																<value><string>{ data($input_Parameters1/VALOR_ABSOLUTO17) }</string></value>
															</member>	
					                                	else (),
														$valor2 :=
					                                	if(exists($input_Parameters1/FECHA_EXPIRACION_RELATIVA17) and data($input_Parameters1/FECHA_EXPIRACION_RELATIVA17) != 0) then 
					                                		<member>
																<name>{ "adjustmentDateRelative" }</name>
																<value><int>{ data($input_Parameters1/FECHA_EXPIRACION_RELATIVA17) }</int></value>
															</member>
														else if(exists($input_Parameters1/FECHA_EXPIRACION_ABSOLUTA17) and data($input_Parameters1/FECHA_EXPIRACION_ABSOLUTA17) != "") then 
					                                		<member>
																<name>{ "expiryDate" }</name>
																<value><dateTime.iso8601>{ data($input_Parameters1/FECHA_EXPIRACION_ABSOLUTA17) }</dateTime.iso8601></value>
															</member>		
					                                	else ()
														return ($valor, $valor2)
														}
													</struct>
													</value>
												</data>
											else ()		
											}						
											
											{
											 if(exists($input_Parameters1/ID_CUENTA_DEDICADA18)) then
												<data>
													<value>
													<struct>
														<member>
															<name>{ "dedicatedAccountID" }</name>
															<value><int>{ data($input_Parameters1/ID_CUENTA_DEDICADA18) }</int></value>
														</member>		
														<member>
															<name>{ "dedicatedAccountUnitType" }</name>
															<value><int>{ data($input_Parameters1/UNIT_TYPE_CUENTA_DEDICADA18) }</int></value>
														</member>										
														{
														let $valor :=
					                                	if(exists($input_Parameters1/VALOR_RELATIVO18) and data($input_Parameters1/VALOR_RELATIVO18) != 0) then 
					                                		<member>
																<name>{ "adjustmentAmountRelative" }</name>
																<value><string>{ data($input_Parameters1/VALOR_RELATIVO18) }</string></value>
															</member>
														else if(exists($input_Parameters1/VALOR_ABSOLUTO18) and data($input_Parameters1/VALOR_ABSOLUTO18) != 0) then 
					                                		<member>
																<name>{ "dedicatedAccountValueNew" }</name>
																<value><string>{ data($input_Parameters1/VALOR_ABSOLUTO18) }</string></value>
															</member>	
					                                	else (),
														$valor2 :=
					                                	if(exists($input_Parameters1/FECHA_EXPIRACION_RELATIVA18) and data($input_Parameters1/FECHA_EXPIRACION_RELATIVA18) != 0) then 
					                                		<member>
																<name>{ "adjustmentDateRelative" }</name>
																<value><int>{ data($input_Parameters1/FECHA_EXPIRACION_RELATIVA18) }</int></value>
															</member>
														else if(exists($input_Parameters1/FECHA_EXPIRACION_ABSOLUTA18) and data($input_Parameters1/FECHA_EXPIRACION_ABSOLUTA18) != "") then 
					                                		<member>
																<name>{ "expiryDate" }</name>
																<value><dateTime.iso8601>{ data($input_Parameters1/FECHA_EXPIRACION_ABSOLUTA18) }</dateTime.iso8601></value>
															</member>		
					                                	else ()
														return ($valor, $valor2)
														}
													</struct>
													</value>
												</data>
											else ()		
											}						
											
											{
											 if(exists($input_Parameters1/ID_CUENTA_DEDICADA19)) then
												<data>
													<value>
													<struct>
														<member>
															<name>{ "dedicatedAccountID" }</name>
															<value><int>{ data($input_Parameters1/ID_CUENTA_DEDICADA19) }</int></value>
														</member>		
														<member>
															<name>{ "dedicatedAccountUnitType" }</name>
															<value><int>{ data($input_Parameters1/UNIT_TYPE_CUENTA_DEDICADA19) }</int></value>
														</member>										
														{
														let $valor :=
					                                	if(exists($input_Parameters1/VALOR_RELATIVO19) and data($input_Parameters1/VALOR_RELATIVO19) != 0) then 
					                                		<member>
																<name>{ "adjustmentAmountRelative" }</name>
																<value><string>{ data($input_Parameters1/VALOR_RELATIVO19) }</string></value>
															</member>
														else if(exists($input_Parameters1/VALOR_ABSOLUTO19) and data($input_Parameters1/VALOR_ABSOLUTO19) != 0) then 
					                                		<member>
																<name>{ "dedicatedAccountValueNew" }</name>
																<value><string>{ data($input_Parameters1/VALOR_ABSOLUTO19) }</string></value>
															</member>	
					                                	else (),
														$valor2 :=
					                                	if(exists($input_Parameters1/FECHA_EXPIRACION_RELATIVA19) and data($input_Parameters1/FECHA_EXPIRACION_RELATIVA19) != 0) then 
					                                		<member>
																<name>{ "adjustmentDateRelative" }</name>
																<value><int>{ data($input_Parameters1/FECHA_EXPIRACION_RELATIVA19) }</int></value>
															</member>
														else if(exists($input_Parameters1/FECHA_EXPIRACION_ABSOLUTA19) and data($input_Parameters1/FECHA_EXPIRACION_ABSOLUTA19) != "") then 
					                                		<member>
																<name>{ "expiryDate" }</name>
																<value><dateTime.iso8601>{ data($input_Parameters1/FECHA_EXPIRACION_ABSOLUTA19) }</dateTime.iso8601></value>
															</member>		
					                                	else ()
														return ($valor, $valor2)
														}
													</struct>
													</value>
												</data>
											else ()		
											}						
											
											{
											 if(exists($input_Parameters1/ID_CUENTA_DEDICADA20)) then
												<data>
													<value>
													<struct>
														<member>
															<name>{ "dedicatedAccountID" }</name>
															<value><int>{ data($input_Parameters1/ID_CUENTA_DEDICADA20) }</int></value>
														</member>		
														<member>
															<name>{ "dedicatedAccountUnitType" }</name>
															<value><int>{ data($input_Parameters1/UNIT_TYPE_CUENTA_DEDICADA20) }</int></value>
														</member>										
														{
														let $valor :=
					                                	if(exists($input_Parameters1/VALOR_RELATIVO20) and data($input_Parameters1/VALOR_RELATIVO20) != 0) then 
					                                		<member>
																<name>{ "adjustmentAmountRelative" }</name>
																<value><string>{ data($input_Parameters1/VALOR_RELATIVO20) }</string></value>
															</member>
														else if(exists($input_Parameters1/VALOR_ABSOLUTO20) and data($input_Parameters1/VALOR_ABSOLUTO20) != 0) then 
					                                		<member>
																<name>{ "dedicatedAccountValueNew" }</name>
																<value><string>{ data($input_Parameters1/VALOR_ABSOLUTO20) }</string></value>
															</member>	
					                                	else (),
														$valor2 :=
					                                	if(exists($input_Parameters1/FECHA_EXPIRACION_RELATIVA20) and data($input_Parameters1/FECHA_EXPIRACION_RELATIVA20) != 0) then 
					                                		<member>
																<name>{ "adjustmentDateRelative" }</name>
																<value><int>{ data($input_Parameters1/FECHA_EXPIRACION_RELATIVA20) }</int></value>
															</member>
														else if(exists($input_Parameters1/FECHA_EXPIRACION_ABSOLUTA20) and data($input_Parameters1/FECHA_EXPIRACION_ABSOLUTA20) != "") then 
					                                		<member>
																<name>{ "expiryDate" }</name>
																<value><dateTime.iso8601>{ data($input_Parameters1/FECHA_EXPIRACION_ABSOLUTA20) }</dateTime.iso8601></value>
															</member>		
					                                	else ()
														return ($valor, $valor2)
														}
													</struct>
													</value>
												</data>
											else ()		
											}						
											
											{
											 if(exists($input_Parameters1/ID_CUENTA_DEDICADA21)) then
												<data>
													<value>
													<struct>
														<member>
															<name>{ "dedicatedAccountID" }</name>
															<value><int>{ data($input_Parameters1/ID_CUENTA_DEDICADA21) }</int></value>
														</member>		
														<member>
															<name>{ "dedicatedAccountUnitType" }</name>
															<value><int>{ data($input_Parameters1/UNIT_TYPE_CUENTA_DEDICADA21) }</int></value>
														</member>										
														{
														let $valor :=
					                                	if(exists($input_Parameters1/VALOR_RELATIVO21) and data($input_Parameters1/VALOR_RELATIVO21) != 0) then 
					                                		<member>
																<name>{ "adjustmentAmountRelative" }</name>
																<value><string>{ data($input_Parameters1/VALOR_RELATIVO21) }</string></value>
															</member>
														else if(exists($input_Parameters1/VALOR_ABSOLUTO21) and data($input_Parameters1/VALOR_ABSOLUTO21) != 0) then 
					                                		<member>
																<name>{ "dedicatedAccountValueNew" }</name>
																<value><string>{ data($input_Parameters1/VALOR_ABSOLUTO21) }</string></value>
															</member>	
					                                	else (),
														$valor2 :=
					                                	if(exists($input_Parameters1/FECHA_EXPIRACION_RELATIVA21) and data($input_Parameters1/FECHA_EXPIRACION_RELATIVA21) != 0) then 
					                                		<member>
																<name>{ "adjustmentDateRelative" }</name>
																<value><int>{ data($input_Parameters1/FECHA_EXPIRACION_RELATIVA21) }</int></value>
															</member>
														else if(exists($input_Parameters1/FECHA_EXPIRACION_ABSOLUTA21) and data($input_Parameters1/FECHA_EXPIRACION_ABSOLUTA21) != "") then 
					                                		<member>
																<name>{ "expiryDate" }</name>
																<value><dateTime.iso8601>{ data($input_Parameters1/FECHA_EXPIRACION_ABSOLUTA21) }</dateTime.iso8601></value>
															</member>		
					                                	else ()
														return ($valor, $valor2)
														}
													</struct>
													</value>
												</data>
											else ()		
											}						
											
											{
											 if(exists($input_Parameters1/ID_CUENTA_DEDICADA22)) then
												<data>
													<value>
													<struct>
														<member>
															<name>{ "dedicatedAccountID" }</name>
															<value><int>{ data($input_Parameters1/ID_CUENTA_DEDICADA22) }</int></value>
														</member>		
														<member>
															<name>{ "dedicatedAccountUnitType" }</name>
															<value><int>{ data($input_Parameters1/UNIT_TYPE_CUENTA_DEDICADA22) }</int></value>
														</member>										
														{
														let $valor :=
					                                	if(exists($input_Parameters1/VALOR_RELATIVO22) and data($input_Parameters1/VALOR_RELATIVO22) != 0) then 
					                                		<member>
																<name>{ "adjustmentAmountRelative" }</name>
																<value><string>{ data($input_Parameters1/VALOR_RELATIVO22) }</string></value>
															</member>
														else if(exists($input_Parameters1/VALOR_ABSOLUTO22) and data($input_Parameters1/VALOR_ABSOLUTO22) != 0) then 
					                                		<member>
																<name>{ "dedicatedAccountValueNew" }</name>
																<value><string>{ data($input_Parameters1/VALOR_ABSOLUTO22) }</string></value>
															</member>	
					                                	else (),
														$valor2 :=
					                                	if(exists($input_Parameters1/FECHA_EXPIRACION_RELATIVA22) and data($input_Parameters1/FECHA_EXPIRACION_RELATIVA22) != 0) then 
					                                		<member>
																<name>{ "adjustmentDateRelative" }</name>
																<value><int>{ data($input_Parameters1/FECHA_EXPIRACION_RELATIVA22) }</int></value>
															</member>
														else if(exists($input_Parameters1/FECHA_EXPIRACION_ABSOLUTA22) and data($input_Parameters1/FECHA_EXPIRACION_ABSOLUTA22) != "") then 
					                                		<member>
																<name>{ "expiryDate" }</name>
																<value><dateTime.iso8601>{ data($input_Parameters1/FECHA_EXPIRACION_ABSOLUTA22) }</dateTime.iso8601></value>
															</member>		
					                                	else ()
														return ($valor, $valor2)
														}
													</struct>
													</value>
												</data>
											else ()		
											}																																																																																																																																								
											
{
											 if(exists($input_Parameters1/ID_CUENTA_DEDICADA23)) then
												<data>
													<value>
													<struct>
														<member>
															<name>{ "dedicatedAccountID" }</name>
															<value><int>{ data($input_Parameters1/ID_CUENTA_DEDICADA23) }</int></value>
														</member>		
														<member>
															<name>{ "dedicatedAccountUnitType" }</name>
															<value><int>{ data($input_Parameters1/UNIT_TYPE_CUENTA_DEDICADA23) }</int></value>
														</member>										
														{
														let $valor :=
					                                	if(exists($input_Parameters1/VALOR_RELATIVO23) and data($input_Parameters1/VALOR_RELATIVO23) != 0) then 
					                                		<member>
																<name>{ "adjustmentAmountRelative" }</name>
																<value><string>{ data($input_Parameters1/VALOR_RELATIVO23) }</string></value>
															</member>
														else if(exists($input_Parameters1/VALOR_ABSOLUTO23) and data($input_Parameters1/VALOR_ABSOLUTO23) != 0) then 
					                                		<member>
																<name>{ "dedicatedAccountValueNew" }</name>
																<value><string>{ data($input_Parameters1/VALOR_ABSOLUTO23) }</string></value>
															</member>	
					                                	else (),
														$valor2 :=
					                                	if(exists($input_Parameters1/FECHA_EXPIRACION_RELATIVA23) and data($input_Parameters1/FECHA_EXPIRACION_RELATIVA23) != 0) then 
					                                		<member>
																<name>{ "adjustmentDateRelative" }</name>
																<value><int>{ data($input_Parameters1/FECHA_EXPIRACION_RELATIVA23) }</int></value>
															</member>
														else if(exists($input_Parameters1/FECHA_EXPIRACION_ABSOLUTA23) and data($input_Parameters1/FECHA_EXPIRACION_ABSOLUTA23) != "") then 
					                                		<member>
																<name>{ "expiryDate" }</name>
																<value><dateTime.iso8601>{ data($input_Parameters1/FECHA_EXPIRACION_ABSOLUTA23) }</dateTime.iso8601></value>
															</member>		
					                                	else ()
														return ($valor, $valor2)
														}
													</struct>
													</value>
												</data>
											else ()		
											}																																																																																																																																								
											
{
											 if(exists($input_Parameters1/ID_CUENTA_DEDICADA24)) then
												<data>
													<value>
													<struct>
														<member>
															<name>{ "dedicatedAccountID" }</name>
															<value><int>{ data($input_Parameters1/ID_CUENTA_DEDICADA24) }</int></value>
														</member>		
														<member>
															<name>{ "dedicatedAccountUnitType" }</name>
															<value><int>{ data($input_Parameters1/UNIT_TYPE_CUENTA_DEDICADA24) }</int></value>
														</member>										
														{
														let $valor :=
					                                	if(exists($input_Parameters1/VALOR_RELATIVO24) and data($input_Parameters1/VALOR_RELATIVO24) != 0) then 
					                                		<member>
																<name>{ "adjustmentAmountRelative" }</name>
																<value><string>{ data($input_Parameters1/VALOR_RELATIVO24) }</string></value>
															</member>
														else if(exists($input_Parameters1/VALOR_ABSOLUTO24) and data($input_Parameters1/VALOR_ABSOLUTO24) != 0) then 
					                                		<member>
																<name>{ "dedicatedAccountValueNew" }</name>
																<value><string>{ data($input_Parameters1/VALOR_ABSOLUTO24) }</string></value>
															</member>	
					                                	else (),
														$valor2 :=
					                                	if(exists($input_Parameters1/FECHA_EXPIRACION_RELATIVA24) and data($input_Parameters1/FECHA_EXPIRACION_RELATIVA24) != 0) then 
					                                		<member>
																<name>{ "adjustmentDateRelative" }</name>
																<value><int>{ data($input_Parameters1/FECHA_EXPIRACION_RELATIVA24) }</int></value>
															</member>
														else if(exists($input_Parameters1/FECHA_EXPIRACION_ABSOLUTA24) and data($input_Parameters1/FECHA_EXPIRACION_ABSOLUTA24) != "") then 
					                                		<member>
																<name>{ "expiryDate" }</name>
																<value><dateTime.iso8601>{ data($input_Parameters1/FECHA_EXPIRACION_ABSOLUTA24) }</dateTime.iso8601></value>
															</member>		
					                                	else ()
														return ($valor, $valor2)
														}
													</struct>
													</value>
												</data>
											else ()		
											}																																																																																																																																								
											
{
											 if(exists($input_Parameters1/ID_CUENTA_DEDICADA25)) then
												<data>
													<value>
													<struct>
														<member>
															<name>{ "dedicatedAccountID" }</name>
															<value><int>{ data($input_Parameters1/ID_CUENTA_DEDICADA25) }</int></value>
														</member>		
														<member>
															<name>{ "dedicatedAccountUnitType" }</name>
															<value><int>{ data($input_Parameters1/UNIT_TYPE_CUENTA_DEDICADA25) }</int></value>
														</member>										
														{
														let $valor :=
					                                	if(exists($input_Parameters1/VALOR_RELATIVO25) and data($input_Parameters1/VALOR_RELATIVO25) != 0) then 
					                                		<member>
																<name>{ "adjustmentAmountRelative" }</name>
																<value><string>{ data($input_Parameters1/VALOR_RELATIVO25) }</string></value>
															</member>
														else if(exists($input_Parameters1/VALOR_ABSOLUTO25) and data($input_Parameters1/VALOR_ABSOLUTO25) != 0) then 
					                                		<member>
																<name>{ "dedicatedAccountValueNew" }</name>
																<value><string>{ data($input_Parameters1/VALOR_ABSOLUTO25) }</string></value>
															</member>	
					                                	else (),
														$valor2 :=
					                                	if(exists($input_Parameters1/FECHA_EXPIRACION_RELATIVA25) and data($input_Parameters1/FECHA_EXPIRACION_RELATIVA25) != 0) then 
					                                		<member>
																<name>{ "adjustmentDateRelative" }</name>
																<value><int>{ data($input_Parameters1/FECHA_EXPIRACION_RELATIVA25) }</int></value>
															</member>
														else if(exists($input_Parameters1/FECHA_EXPIRACION_ABSOLUTA25) and data($input_Parameters1/FECHA_EXPIRACION_ABSOLUTA25) != "") then 
					                                		<member>
																<name>{ "expiryDate" }</name>
																<value><dateTime.iso8601>{ data($input_Parameters1/FECHA_EXPIRACION_ABSOLUTA25) }</dateTime.iso8601></value>
															</member>		
					                                	else ()
														return ($valor, $valor2)
														}
													</struct>
													</value>
												</data>
											else ()		
											}																																																																																																																																								
											
{
											 if(exists($input_Parameters1/ID_CUENTA_DEDICADA26)) then
												<data>
													<value>
													<struct>
														<member>
															<name>{ "dedicatedAccountID" }</name>
															<value><int>{ data($input_Parameters1/ID_CUENTA_DEDICADA26) }</int></value>
														</member>		
														<member>
															<name>{ "dedicatedAccountUnitType" }</name>
															<value><int>{ data($input_Parameters1/UNIT_TYPE_CUENTA_DEDICADA26) }</int></value>
														</member>										
														{
														let $valor :=
					                                	if(exists($input_Parameters1/VALOR_RELATIVO26) and data($input_Parameters1/VALOR_RELATIVO26) != 0) then 
					                                		<member>
																<name>{ "adjustmentAmountRelative" }</name>
																<value><string>{ data($input_Parameters1/VALOR_RELATIVO26) }</string></value>
															</member>
														else if(exists($input_Parameters1/VALOR_ABSOLUTO26) and data($input_Parameters1/VALOR_ABSOLUTO26) != 0) then 
					                                		<member>
																<name>{ "dedicatedAccountValueNew" }</name>
																<value><string>{ data($input_Parameters1/VALOR_ABSOLUTO26) }</string></value>
															</member>	
					                                	else (),
														$valor2 :=
					                                	if(exists($input_Parameters1/FECHA_EXPIRACION_RELATIVA26) and data($input_Parameters1/FECHA_EXPIRACION_RELATIVA26) != 0) then 
					                                		<member>
																<name>{ "adjustmentDateRelative" }</name>
																<value><int>{ data($input_Parameters1/FECHA_EXPIRACION_RELATIVA26) }</int></value>
															</member>
														else if(exists($input_Parameters1/FECHA_EXPIRACION_ABSOLUTA26) and data($input_Parameters1/FECHA_EXPIRACION_ABSOLUTA26) != "") then 
					                                		<member>
																<name>{ "expiryDate" }</name>
																<value><dateTime.iso8601>{ data($input_Parameters1/FECHA_EXPIRACION_ABSOLUTA26) }</dateTime.iso8601></value>
															</member>		
					                                	else ()
														return ($valor, $valor2)
														}
													</struct>
													</value>
												</data>
											else ()		
											}																																																																																																																																								
											
{
											 if(exists($input_Parameters1/ID_CUENTA_DEDICADA27)) then
												<data>
													<value>
													<struct>
														<member>
															<name>{ "dedicatedAccountID" }</name>
															<value><int>{ data($input_Parameters1/ID_CUENTA_DEDICADA27) }</int></value>
														</member>		
														<member>
															<name>{ "dedicatedAccountUnitType" }</name>
															<value><int>{ data($input_Parameters1/UNIT_TYPE_CUENTA_DEDICADA27) }</int></value>
														</member>										
														{
														let $valor :=
					                                	if(exists($input_Parameters1/VALOR_RELATIVO27) and data($input_Parameters1/VALOR_RELATIVO27) != 0) then 
					                                		<member>
																<name>{ "adjustmentAmountRelative" }</name>
																<value><string>{ data($input_Parameters1/VALOR_RELATIVO27) }</string></value>
															</member>
														else if(exists($input_Parameters1/VALOR_ABSOLUTO27) and data($input_Parameters1/VALOR_ABSOLUTO27) != 0) then 
					                                		<member>
																<name>{ "dedicatedAccountValueNew" }</name>
																<value><string>{ data($input_Parameters1/VALOR_ABSOLUTO27) }</string></value>
															</member>	
					                                	else (),
														$valor2 :=
					                                	if(exists($input_Parameters1/FECHA_EXPIRACION_RELATIVA27) and data($input_Parameters1/FECHA_EXPIRACION_RELATIVA27) != 0) then 
					                                		<member>
																<name>{ "adjustmentDateRelative" }</name>
																<value><int>{ data($input_Parameters1/FECHA_EXPIRACION_RELATIVA27) }</int></value>
															</member>
														else if(exists($input_Parameters1/FECHA_EXPIRACION_ABSOLUTA27) and data($input_Parameters1/FECHA_EXPIRACION_ABSOLUTA27) != "") then 
					                                		<member>
																<name>{ "expiryDate" }</name>
																<value><dateTime.iso8601>{ data($input_Parameters1/FECHA_EXPIRACION_ABSOLUTA27) }</dateTime.iso8601></value>
															</member>		
					                                	else ()
														return ($valor, $valor2)
														}
													</struct>
													</value>
												</data>
											else ()		
											}																																																																																																																																								
											
{
											 if(exists($input_Parameters1/ID_CUENTA_DEDICADA28)) then
												<data>
													<value>
													<struct>
														<member>
															<name>{ "dedicatedAccountID" }</name>
															<value><int>{ data($input_Parameters1/ID_CUENTA_DEDICADA28) }</int></value>
														</member>		
														<member>
															<name>{ "dedicatedAccountUnitType" }</name>
															<value><int>{ data($input_Parameters1/UNIT_TYPE_CUENTA_DEDICADA28) }</int></value>
														</member>										
														{
														let $valor :=
					                                	if(exists($input_Parameters1/VALOR_RELATIVO28) and data($input_Parameters1/VALOR_RELATIVO28) != 0) then 
					                                		<member>
																<name>{ "adjustmentAmountRelative" }</name>
																<value><string>{ data($input_Parameters1/VALOR_RELATIVO28) }</string></value>
															</member>
														else if(exists($input_Parameters1/VALOR_ABSOLUTO28) and data($input_Parameters1/VALOR_ABSOLUTO28) != 0) then 
					                                		<member>
																<name>{ "dedicatedAccountValueNew" }</name>
																<value><string>{ data($input_Parameters1/VALOR_ABSOLUTO28) }</string></value>
															</member>	
					                                	else (),
														$valor2 :=
					                                	if(exists($input_Parameters1/FECHA_EXPIRACION_RELATIVA28) and data($input_Parameters1/FECHA_EXPIRACION_RELATIVA28) != 0) then 
					                                		<member>
																<name>{ "adjustmentDateRelative" }</name>
																<value><int>{ data($input_Parameters1/FECHA_EXPIRACION_RELATIVA28) }</int></value>
															</member>
														else if(exists($input_Parameters1/FECHA_EXPIRACION_ABSOLUTA28) and data($input_Parameters1/FECHA_EXPIRACION_ABSOLUTA28) != "") then 
					                                		<member>
																<name>{ "expiryDate" }</name>
																<value><dateTime.iso8601>{ data($input_Parameters1/FECHA_EXPIRACION_ABSOLUTA28) }</dateTime.iso8601></value>
															</member>		
					                                	else ()
														return ($valor, $valor2)
														}
													</struct>
													</value>
												</data>
											else ()		
											}																																																																																																																																								
											
																						{
											 if(exists($input_Parameters1/ID_CUENTA_DEDICADA29)) then
												<data>
													<value>
													<struct>
														<member>
															<name>{ "dedicatedAccountID" }</name>
															<value><int>{ data($input_Parameters1/ID_CUENTA_DEDICADA29) }</int></value>
														</member>		
														<member>
															<name>{ "dedicatedAccountUnitType" }</name>
															<value><int>{ data($input_Parameters1/UNIT_TYPE_CUENTA_DEDICADA29) }</int></value>
														</member>										
														{
														let $valor :=
					                                	if(exists($input_Parameters1/VALOR_RELATIVO29) and data($input_Parameters1/VALOR_RELATIVO29) != 0) then 
					                                		<member>
																<name>{ "adjustmentAmountRelative" }</name>
																<value><string>{ data($input_Parameters1/VALOR_RELATIVO29) }</string></value>
															</member>
														else if(exists($input_Parameters1/VALOR_ABSOLUTO29) and data($input_Parameters1/VALOR_ABSOLUTO29) != 0) then 
					                                		<member>
																<name>{ "dedicatedAccountValueNew" }</name>
																<value><string>{ data($input_Parameters1/VALOR_ABSOLUTO29) }</string></value>
															</member>	
					                                	else (),
														$valor2 :=
					                                	if(exists($input_Parameters1/FECHA_EXPIRACION_RELATIVA29) and data($input_Parameters1/FECHA_EXPIRACION_RELATIVA29) != 0) then 
					                                		<member>
																<name>{ "adjustmentDateRelative" }</name>
																<value><int>{ data($input_Parameters1/FECHA_EXPIRACION_RELATIVA29) }</int></value>
															</member>
														else if(exists($input_Parameters1/FECHA_EXPIRACION_ABSOLUTA29) and data($input_Parameters1/FECHA_EXPIRACION_ABSOLUTA29) != "") then 
					                                		<member>
																<name>{ "expiryDate" }</name>
																<value><dateTime.iso8601>{ data($input_Parameters1/FECHA_EXPIRACION_ABSOLUTA29) }</dateTime.iso8601></value>
															</member>		
					                                	else ()
														return ($valor, $valor2)
														}
													</struct>
													</value>
												</data>
											else ()		
											}																																																																																																																																								
											
											{
											 if(exists($input_Parameters1/ID_CUENTA_DEDICADA30)) then
												<data>
													<value>
													<struct>
														<member>
															<name>{ "dedicatedAccountID" }</name>
															<value><int>{ data($input_Parameters1/ID_CUENTA_DEDICADA30) }</int></value>
														</member>		
														<member>
															<name>{ "dedicatedAccountUnitType" }</name>
															<value><int>{ data($input_Parameters1/UNIT_TYPE_CUENTA_DEDICADA30) }</int></value>
														</member>										
														{
														let $valor :=
					                                	if(exists($input_Parameters1/VALOR_RELATIVO30) and data($input_Parameters1/VALOR_RELATIVO30) != 0) then 
					                                		<member>
																<name>{ "adjustmentAmountRelative" }</name>
																<value><string>{ data($input_Parameters1/VALOR_RELATIVO30) }</string></value>
															</member>
														else if(exists($input_Parameters1/VALOR_ABSOLUTO30) and data($input_Parameters1/VALOR_ABSOLUTO30) != 0) then 
					                                		<member>
																<name>{ "dedicatedAccountValueNew" }</name>
																<value><string>{ data($input_Parameters1/VALOR_ABSOLUTO30) }</string></value>
															</member>	
					                                	else (),
														$valor2 :=
					                                	if(exists($input_Parameters1/FECHA_EXPIRACION_RELATIVA30) and data($input_Parameters1/FECHA_EXPIRACION_RELATIVA30) != 0) then 
					                                		<member>
																<name>{ "adjustmentDateRelative" }</name>
																<value><int>{ data($input_Parameters1/FECHA_EXPIRACION_RELATIVA30) }</int></value>
															</member>
														else if(exists($input_Parameters1/FECHA_EXPIRACION_ABSOLUTA30) and data($input_Parameters1/FECHA_EXPIRACION_ABSOLUTA30) != "") then 
					                                		<member>
																<name>{ "expiryDate" }</name>
																<value><dateTime.iso8601>{ data($input_Parameters1/FECHA_EXPIRACION_ABSOLUTA30) }</dateTime.iso8601></value>
															</member>		
					                                	else ()
														return ($valor, $valor2)
														}
													</struct>
													</value>
												</data>
											else ()		
											}																																																																																																																																								
																																																																	
										</array>
										</value>
									</member>
								else ()	
                                }
                            </struct>
                        </value>
                    </param>
                </params>
            </methodCall>
            </ns1:ActualizarBalanceFechaRequest>
};

declare variable $input_Parameters1 as element(ns2:Input_Parameters) external;

xf:actualizarBalanceFecha_Req($input_Parameters1)
xquery version "1.0" encoding "Cp1252";
(:: pragma bea:global-element-parameter parameter="$input_Parameters1" element="ns1:Input_Parameters" location="../Schemas/PS_ITEL_MODIFICAR_ELEGIDOS.xsd" ::)
(:: pragma bea:global-element-return element="ns0:dsmnRequest" location="../Schemas/DA_ITEL_OPERACION_PROVISION_OLM.xsd" ::)

declare namespace xf = "http://tempuri.org/ITEL/OCS/OLM/Resources/XQueries/modificarElegidosOCS_Req/";
declare namespace ns1 = "http://www.comcel.com.co/ModificarElegidosOCS/";
declare namespace ns0 = "http://webapps.online.ericsson.com";

declare function xf:modificarElegidosOCS_Req($input_Parameters1 as element(ns1:Input_Parameters))
    as element(ns0:dsmnRequest) {
        <ns0:dsmnRequest>
	           <ns0:request>                                
			   <ns0:requestID>{ data($input_Parameters1/REQUESTID) }</ns0:requestID>
			   <!-- modifyMultiplesElegido -->
			   <ns0:operation>{ data($input_Parameters1/OPERATION) }</ns0:operation>
			   <ns0:productName>{ data($input_Parameters1/PRODUCTNAME) }</ns0:productName>
				   {   
					   for $Detail at $index in $input_Parameters1/MSISDNELEGIDOTOREGISTER/*:Detail					   					   		      
						  return	                  
						   <ns0:subscriber>
								<ns0:subscriberID>{
								  let $auto := $index -1
								  return
								  $auto
								}</ns0:subscriberID>
								<ns0:item>
									<ns0:key>{"MSISDN"}</ns0:key>
									<ns0:value>{ data($input_Parameters1/MSISDN) }</ns0:value>
								</ns0:item>
								<ns0:item>
									<ns0:key>{"MSISDNElegidoToReplace"}</ns0:key> (:MSISDNElegidoToReplace:)
									<ns0:value>{
									        let $numero := for $Detail_Register at $index_register in $input_Parameters1/MSISDNELEGIDOTOREPLACE/*:Detail
				                            where $index_register = $index
				                            return data($Detail_Register)
				                            return $numero						         
									 }</ns0:value>
								</ns0:item>
								<ns0:item>
									<ns0:key>{"MSISDNElegidoToRegister"}</ns0:key> (:MSISDNElegidoToRegister:)
									<ns0:value>{  data($Detail)}</ns0:value>
								</ns0:item>
								<ns0:item>
									<ns0:key>{"originatingNodeInfo"}</ns0:key>
									<ns0:value>{ data($input_Parameters1/ORIGINATINGNODEINFO) }</ns0:value>
								</ns0:item>
								<ns0:item>
									<ns0:key>{"externalData"}</ns0:key>
									<ns0:value>{ data($input_Parameters1/EXTERNALDATA) }</ns0:value>
								</ns0:item>
								<ns0:item>
									<ns0:key>{"charged"}</ns0:key>
									<ns0:value>{ data($input_Parameters1/CHARGED) }</ns0:value>
								</ns0:item>
								<ns0:item>
									<ns0:key>{"FaFIdList"}</ns0:key>
									<ns0:value>{ data($input_Parameters1/FAFIDLIST) }</ns0:value>
								</ns0:item>						
						   </ns0:subscriber>
					 }			   
		        </ns0:request>
        </ns0:dsmnRequest>
};

declare variable $input_Parameters1 as element(ns1:Input_Parameters) external;

xf:modificarElegidosOCS_Req($input_Parameters1)
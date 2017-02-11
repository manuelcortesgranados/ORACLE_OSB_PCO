(:: pragma bea:global-element-parameter parameter="$input_Parameters1" element="ns0:Input_Parameters" location="../Schemas/PS_ITEL_REGISTRAR_ELEGIDOS.xsd" ::)
(:: pragma bea:global-element-return element="ns1:dsmnRequest" location="../Schemas/DA_ITEL_OPERACION_PROVISION_OLM.xsd" ::)

declare namespace ns1 = "http://webapps.online.ericsson.com";
declare namespace ns0 = "http://www.comcel.com.co/RegistrarElegidosOCS/";
declare namespace xf = "http://tempuri.org/ITEL/OCS/OLM/Resources/XQueries/registrarElegidosOCS_Req/";

declare function xf:registrarElegidosOCS_Req($input_Parameters1 as element(ns0:Input_Parameters))
    as element(ns1:dsmnRequest) {
       <ns1:dsmnRequest>
		<ns1:request>                                
			   <ns1:requestID>{ data($input_Parameters1/REQUESTID) }</ns1:requestID>
			   <!-- registerMultiplesElegido -->
			   <ns1:operation>{ data($input_Parameters1/OPERATION) }</ns1:operation>
			   <ns1:productName>{ data($input_Parameters1/PRODUCTNAME) }</ns1:productName>
			   {   
				   for $Detail at $index in $input_Parameters1/MSISDNELEGIDOTOREGISTER/*:Detail					   					   		      
	                  return	                  
					   <ns1:subscriber>
							<ns1:subscriberID>{
							  let $auto := $index -1
							  return
							  $auto
							}</ns1:subscriberID>
							<ns1:item>
								<ns1:key>{"MSISDN"}</ns1:key>
								<ns1:value>{ data($input_Parameters1/MSISDN) }</ns1:value>
							</ns1:item>
							<ns1:item>
								<ns1:key>{"MSISDNElegidoToRegister"}</ns1:key>
								<ns1:value>{  data($Detail)}</ns1:value>
							</ns1:item>
							<ns1:item>
								<ns1:key>{"originatingNodeInfo"}</ns1:key>
								<ns1:value>{ data($input_Parameters1/ORIGINATINGNODEINFO) }</ns1:value>
							</ns1:item>
							<ns1:item>
								<ns1:key>{"externalData"}</ns1:key>
								<ns1:value>{ data($input_Parameters1/EXTERNALDATA) }</ns1:value>
							</ns1:item>
							<ns1:item>
								<ns1:key>{"charged"}</ns1:key>
								<ns1:value>{ data($input_Parameters1/CHARGED) }</ns1:value>
							</ns1:item>
							<ns1:item>
								<ns1:key>{"FaFIdList"}</ns1:key>
								<ns1:value>{ data($input_Parameters1/FAFIDLIST) }</ns1:value>
							</ns1:item>						
					   </ns1:subscriber>
				 }			   
		</ns1:request>
	</ns1:dsmnRequest>
};

declare variable $input_Parameters1 as element(ns0:Input_Parameters) external;

xf:registrarElegidosOCS_Req($input_Parameters1)
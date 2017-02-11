(:: pragma bea:global-element-parameter parameter="$input_Parameters1" element="ns0:Input_Parameters" location="../Schemas/PS_ITEL_ELIMINAR_SUSCRIPCION.xsd" ::)
(:: pragma bea:global-element-return element="ns1:dsmnRequest" location="../Schemas/DA_ITEL_OPERACION_PROVISION_OLM.xsd" ::)

declare namespace ns1 = "http://webapps.online.ericsson.com";
declare namespace ns0 = "http://www.comcel.com.co/EliminarSuscripcionOCS/";
declare namespace xf = "http://tempuri.org/ITEL/OCS/OLM/Resources/XQueries/eliminarSuscripcionOCS_Req/";

declare function xf:eliminarSuscripcionOCS_Req($input_Parameters1 as element(ns0:Input_Parameters))
    as element(ns1:dsmnRequest) {
        <ns1:dsmnRequest>
	<ns1:request>
		<ns1:requestID>{ data($input_Parameters1/REQUESTID) }</ns1:requestID>
		<!-- cancelSubscription -->
		<ns1:operation>{ data($input_Parameters1/OPERATION) }</ns1:operation>
		<ns1:productName>{ data($input_Parameters1/PRODUCTNAME) }</ns1:productName>
		<!--1 or more repetitions:-->
		<ns1:subscriber>
			<ns1:subscriberID>{ data($input_Parameters1/SUBSCRIBERID) }</ns1:subscriberID>
			<!--1 or more repetitions:-->
		<ns1:item>
			<ns1:key>{"MSISDN"}</ns1:key>
			<ns1:value>{ data($input_Parameters1/MSISDN) }</ns1:value>
		</ns1:item>
		<ns1:item>  
			<ns1:key>{"cancelType"}</ns1:key>  
			<ns1:value>{ data($input_Parameters1/CANCELTYPE) }</ns1:value>  
		</ns1:item>  
		<ns1:item>  
			<ns1:key>{"originatingNodeInfo"}</ns1:key>  
			<ns1:value>{ data($input_Parameters1/ORIGINATINGNODEINFO) }</ns1:value>  
		</ns1:item>  
		<ns1:item>  
			<ns1:key>{"externalData"}</ns1:key>  
			<ns1:value>{ data($input_Parameters1/EXTERNALDATA) }</ns1:value>  
	   </ns1:item>  
		</ns1:subscriber>
	</ns1:request> 
</ns1:dsmnRequest>
};

declare variable $input_Parameters1 as element(ns0:Input_Parameters) external;

xf:eliminarSuscripcionOCS_Req($input_Parameters1)
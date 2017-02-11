(:: pragma bea:global-element-parameter parameter="$input_Parameters1" element="ns1:Input_Parameters" location="../Schemas/PS_ITEL_MODIFICAR_SUSCRIPCION.xsd" ::)
(:: pragma bea:global-element-return element="ns0:dsmnRequest" location="../Schemas/DA_ITEL_OPERACION_SERVICE_OLM.xsd" ::)

declare namespace ns1 = "http://www.comcel.com.co/OCS/ModificarSuscripcionOCS/";
declare namespace ns0 = "http://webapps.online.ericsson.com";
declare namespace xf = "http://tempuri.org/ITEL/OCS/OLM/Resources/XQueries/modificarSuscripcionOCS_Req/";

declare function xf:modificarSuscripcionOCS_Req($input_Parameters1 as element(ns1:Input_Parameters))
    as element(ns0:dsmnRequest) {
       <ns0:dsmnRequest>
            <ns0:request>
		        <ns0:requestID>{ data($input_Parameters1/REQUESTID) }</ns0:requestID>
		        <ns0:operation>{"changeSubscriberDetails"}</ns0:operation>
		        <ns0:productName>{ data($input_Parameters1/PRODUCTNAME) }</ns0:productName>
		        <!--1 or more repetitions:-->
		        <ns0:subscriber>
		            <ns0:subscriberID>{ data($input_Parameters1/SUBSCRIBERID) }</ns0:subscriberID>
		            <!--1 or more repetitions:-->
				<ns0:item>
					<ns0:key>{"MSISDN"}</ns0:key>
					<ns0:value>{ data($input_Parameters1/MSISDN) }</ns0:value>
				</ns0:item>
		        <ns0:item>  
					<ns0:key>{"IMSI"}</ns0:key>  
					<ns0:value>{ data($input_Parameters1/IMSI) }</ns0:value>  
			    </ns0:item>  
			    <ns0:item>  
					<ns0:key>{"IMEI"}</ns0:key>  
					<ns0:value>{ data($input_Parameters1/IMEI) }</ns0:value>  
			    </ns0:item>  
			    <ns0:item>  
					<ns0:key>{"ICCID"}</ns0:key>  
					<ns0:value>{ data($input_Parameters1/ICCID) }</ns0:value>  
			   </ns0:item>  
			   <ns0:item>  
					<ns0:key>{"EMAIL"}</ns0:key>  
					<ns0:value>{ data($input_Parameters1/EMAIL) }</ns0:value>  
			   </ns0:item>  
			   <ns0:item>
					<ns0:key>{"subscriberType"}</ns0:key>
					<ns0:value>{ data($input_Parameters1/SUBSCRIBERTYPE) }</ns0:value>
				</ns0:item>
			   <ns0:item>
					<ns0:key>{"deviceType"}</ns0:key>
					<ns0:value>{ data($input_Parameters1/DEVICETYPE) }</ns0:value>
				</ns0:item>
				<ns0:item>
					<ns0:key>{"subscriberPaymentStatus"}</ns0:key>
					<ns0:value>{ data($input_Parameters1/SUBSCRIBERPAYMENTSTATUS) }</ns0:value>
				</ns0:item>
				<ns0:item>
					<ns0:key>{"registeredSubscriber"}</ns0:key>
					<ns0:value>{ data($input_Parameters1/REGISTEREDSUBSCRIBER) }</ns0:value>
				</ns0:item>
				<ns0:item>
					<ns0:key>{"originatingNodeInfo"}</ns0:key>
					<ns0:value>{ data($input_Parameters1/ORIGINATINGNODEINFO) }</ns0:value>
				</ns0:item>
			    <ns0:item>
					<ns0:key>{"externalData"}</ns0:key>
					<ns0:value>{ data($input_Parameters1/EXTERNALDATA) }</ns0:value>
				</ns0:item>
		        </ns0:subscriber>
		    </ns0:request> 
        </ns0:dsmnRequest>
};

declare variable $input_Parameters1 as element(ns1:Input_Parameters) external;

xf:modificarSuscripcionOCS_Req($input_Parameters1)
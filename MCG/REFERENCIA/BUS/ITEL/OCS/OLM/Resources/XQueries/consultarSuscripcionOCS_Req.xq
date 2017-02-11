(:: pragma bea:global-element-parameter parameter="$input_Parameters1" element="ns0:Input_Parameters" location="../Schemas/PS_ITEL_CONSULTAR_SUSCRIPCION.xsd" ::)
(:: pragma bea:global-element-return element="ns1:dsmnRequest" location="../Schemas/DA_ITEL_OPERACION_SERVICE_OLM.xsd" ::)

declare namespace ns1 = "http://webapps.online.ericsson.com";
declare namespace ns0 = "http://www.comcel.com.co/ConsultarSuscripcionOCS/";
declare namespace xf = "http://tempuri.org/ITEL/OCS/OLM/Resources/XQueries/consultarSuscripcionOCS_Req/";

declare function xf:consultarSuscripcionOCS_Req($input_Parameters1 as element(ns0:Input_Parameters))
    as element(ns1:dsmnRequest) {
       <ns1:dsmnRequest>
            <ns1:request>
		        <ns1:requestID>{ data($input_Parameters1/REQUESTID) }</ns1:requestID>
		        <!-- getSubscriptions -->
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
					<ns1:key>{"subscriptionStatus"}</ns1:key>  
					<ns1:value>{ data($input_Parameters1/SUBSCRIPTIONSTATUS) }</ns1:value>  
			    </ns1:item>  
			    <ns1:item>  
					<ns1:key>{"fromDate"}</ns1:key>  
					<ns1:value>{ data($input_Parameters1/FROMDATE) }</ns1:value>  
			    </ns1:item>  
			    <ns1:item>  
					<ns1:key>{"toDate"}</ns1:key>  
					<ns1:value>{ data($input_Parameters1/TODATE) }</ns1:value>  
			   </ns1:item>  
			   <ns1:item>  
					<ns1:key>{"getVolume"}</ns1:key>  
					<ns1:value>{ data($input_Parameters1/GETVOLUME) }</ns1:value>  
			   </ns1:item>  
		        </ns1:subscriber>
		    </ns1:request> 
        </ns1:dsmnRequest>       
};

declare variable $input_Parameters1 as element(ns0:Input_Parameters) external;

xf:consultarSuscripcionOCS_Req($input_Parameters1)
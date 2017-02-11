(:: pragma bea:global-element-return element="ns0:addSubscriptionToSubscriberResponse" location="../WSDLs/BRMSWebService.wsdl" ::)

declare namespace ns0 = "http://axis.brms.hp.com";
declare namespace ns1 = "http://axis.brms.hp.com/xsd";
declare namespace xf = "http://tempuri.org/ITEL/Core/Resources/XQueries/BRMStoItel_Res/";

declare function xf:BRMStoItel_Res($codigo as xs:string)
    as element(ns0:addSubscriptionToSubscriberResponse) {
        <ns0:addSubscriptionToSubscriberResponse>
                {
                if ($codigo = '1') then 
		            <ns0:return>
	                	<ns1:billingId>3101467825191403</ns1:billingId>                
		                <ns1:errorCode>{ "0" }</ns1:errorCode>
		                <ns1:errorDescription>{ "Success" }</ns1:errorDescription>
		                <ns1:statusCode>{ "0" }</ns1:statusCode> 
		            </ns0:return>	                
	             else if ($codigo='900') then
		            <ns0:return>
	                	<ns1:billingId>3101467825191403</ns1:billingId>     	             
	                	<ns1:errorCode>{ "007" }</ns1:errorCode>
	                	<ns1:errorDescription>{ "Unable to get Subscriber Information" }</ns1:errorDescription>
	                	<ns1:statusCode>{ "007" }</ns1:statusCode>	  
		            </ns0:return>	
	             else if ($codigo='919') then
		            <ns0:return>
	                	<ns1:billingId>3101467825191403</ns1:billingId>     	             
	                	<ns1:errorCode>{ "039" }</ns1:errorCode>
	                	<ns1:errorDescription>{ "Not enough balance" }</ns1:errorDescription>
	                	<ns1:statusCode>{ "039" }</ns1:statusCode>	  
		            </ns0:return>
	             else if ($codigo='944') then
		            <ns0:return>
	                	<ns1:billingId>3101467825191403</ns1:billingId>     	             
	                	<ns1:errorCode>{ "039" }</ns1:errorCode>
	                	<ns1:errorDescription>{ "Not enough balance" }</ns1:errorDescription>
	                	<ns1:statusCode>{ "039" }</ns1:statusCode>	  
		            </ns0:return>
	             else if ($codigo='20') then
		            <ns0:return>
	                	<ns1:billingId>3101467825191403</ns1:billingId>     	             
	                	<ns1:errorCode>{ "052" }</ns1:errorCode>
	                	<ns1:errorDescription>{ "The msisdn parameter can't be null" }</ns1:errorDescription>
	                	<ns1:statusCode>{ "052" }</ns1:statusCode>	  
		            </ns0:return>
	             else if ($codigo='21') then
		            <ns0:return>
	                	<ns1:billingId>3101467825191403</ns1:billingId>     	             
	                	<ns1:errorCode>{ "053" }</ns1:errorCode>
	                	<ns1:errorDescription>{ "The activationRequest parameter can't be null" }</ns1:errorDescription>
	                	<ns1:statusCode>{ "053" }</ns1:statusCode>	  
		            </ns0:return>
	             else if ($codigo='22' or $codigo='41') then
		            <ns0:return>
	                	<ns1:billingId>3101467825191403</ns1:billingId>     	             
	                	<ns1:errorCode>{ "012" }</ns1:errorCode>
	                	<ns1:errorDescription>{ "The product does not Exist" }</ns1:errorDescription>
	                	<ns1:statusCode>{ "012" }</ns1:statusCode>	  
		            </ns0:return>		            		            		            		            		                            	
	             else 
		            <ns0:return>
	                	<ns1:billingId>3101467825191403</ns1:billingId>     	             
		                <ns1:errorCode>{ "051" }</ns1:errorCode>
		                <ns1:errorDescription>{ "Internal HP SM error, ERROR" }</ns1:errorDescription>
		                <ns1:statusCode>{ "051" }</ns1:statusCode>
		            </ns0:return>	                	 
                }
        </ns0:addSubscriptionToSubscriberResponse>
};

declare variable $codigo as xs:string external;

xf:BRMStoItel_Res($codigo)

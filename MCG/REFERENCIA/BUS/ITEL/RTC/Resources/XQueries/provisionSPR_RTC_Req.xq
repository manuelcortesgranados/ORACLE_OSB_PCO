(:: pragma bea:global-element-parameter parameter="$input_Parameters1" element="ns1:Input_Parameters" location="../Schemas/PS_PROVISION_SPR_RTC.xsd" ::)
(:: pragma bea:global-element-return element="ns0:submitSubscriberRequest" location="../Schemas/BS_PROVISION_SPR_RTC.xsd" ::)

declare namespace ns1 = "http://www.comcel.com.co/ITEL/provisionSPR_RTC/";
declare namespace ns0 = "http:///www.comcel.com.co/BS_PROVISION_SPR_RTC";
declare namespace xf = "http://tempuri.org/ITEL/RTC/Resources/XQueries/provisionSPR_RTC_Req/";

declare function xf:provisionSPR_RTC_Req($input_Parameters1 as element(ns1:Input_Parameters), $operacion as xs:string)
    as element(ns0:submitSubscriberRequest) {
        <ns0:submitSubscriberRequest>{
                    
                for $xmlSubscriberRequest in $input_Parameters1/xmlSubscriberRequest
                return(
                 if(data($operacion) = "update") then                     	                             
                           fn-bea:serialize(<request>  
                                <subscribers>
                                   <subscriber>
                                       <operation>update</operation>
                                       <msisdn>{ concat("57" , data($xmlSubscriberRequest/msisdn)) }</msisdn>
                                       <imsi>0</imsi>
                                       <imei>0</imei>
                                       <pin>0</pin>
                                       <subscriberTypeId>4</subscriberTypeId>
                                       <regionId>0</regionId>
                                       <statusId>0</statusId>
                                       <taxValue>0</taxValue>
                                       <subscriberSubtypeId>{ data($xmlSubscriberRequest/spr_type) }</subscriberSubtypeId>
                                       <email>mail</email>
                                       <emailNotifications>0</emailNotifications>
                                       <cutOffDate>2010-10-28 00:00:00.000000</cutOffDate>
                                       <localCreditLimit>0</localCreditLimit>
                                       <roamingCreditLimit>0</roamingCreditLimit>     
                                    </subscriber>
                                </subscribers>
                           </request>)                                
				
            	else (
           		 if(data($operacion) = "insert") then
                		fn-bea:serialize(<request>  
                                <subscribers>
                                   <subscriber>
                                       <operation>insert</operation>
                                       <msisdn>{ concat("57" , data($xmlSubscriberRequest/msisdn)) }</msisdn>
                                       <imsi>0</imsi>
                                       <imei>0</imei>
                                       <pin>0</pin>
                                       <subscriberTypeId>4</subscriberTypeId>
                                       <regionId>0</regionId>
                                       <statusId>0</statusId>
                                       <taxValue>0</taxValue>
                                       <subscriberSubtypeId>{ data($xmlSubscriberRequest/spr_type) }</subscriberSubtypeId>
                                       <email>mail</email>
                                       <emailNotifications>0</emailNotifications>
                                       <cutOffDate>2010-10-28 00:00:00.000000</cutOffDate>
                                       <localCreditLimit>0</localCreditLimit>
                                       <roamingCreditLimit>0</roamingCreditLimit>     
                                    </subscriber>
                                </subscribers>
                           </request>
                           )
                        else
                        
                        fn-bea:serialize(<request>  
                                <subscribers>
                                   <subscriber>
                                       <operation>delete</operation>
                                       <msisdn>{ concat("57" , data($xmlSubscriberRequest/msisdn)) }</msisdn>                                            
                                    </subscriber>
                                </subscribers>
                           </request>)
                        
                           )
            
        )}</ns0:submitSubscriberRequest>
};

declare variable $input_Parameters1 as element(ns1:Input_Parameters) external;
declare variable $operacion as xs:string external;

xf:provisionSPR_RTC_Req($input_Parameters1, $operacion)
(:: pragma bea:global-element-parameter parameter="$retrieveLineStatisticsResponse1" element="ns5:RetrieveLineStatisticsResponse" location="../Schemas/BS_GET_CLIENTSTATISTICSLINES.xsd" ::)
(:: pragma bea:local-element-parameter parameter="$customer1" type="ns4:Input_Parameters/customer" location="../Schemas/PS_GET_CLIENTSTATISTICSLINES.xsd" ::)
(:: pragma bea:global-element-return element="ns4:WS_Result" location="../Schemas/PS_GET_CLIENTSTATISTICSLINES.xsd" ::)

declare namespace ns2 = "http://www.claro.com.co/rulesEngine/canonicalModel/CommonBusinessEntities";
declare namespace ns1 = "http://www.claro.com.co/rulesEngine/canonicalModel/SupplierDomain";
declare namespace ns4 = "http://www.claro.com.co/rulesEngine/getClientStatisticsLines";
declare namespace ns3 = "http://www.claro.com.co/rulesEngine/canonicalModel/ProductDomain";
declare namespace ns0 = "http://www.claro.com.co/rulesEngine/canonicalModel/CustomerDomain";
declare namespace ns5 = "http://retrievelinestatistics.performancemanagement.schema.amx.com";
declare namespace xf = "http://tempuri.org/RulesEngine/Amdocs/Resources/XQueries/getClientStatisticsLines_Res/";

declare function xf:getClientStatisticsLines_Res($retrieveLineStatisticsResponse1 as element(ns5:RetrieveLineStatisticsResponse),
    $customer1 as element())
    as element(ns4:WS_Result) {
        <ns4:WS_Result>
        	<code>1</code>	
            <message>
                {
                    let $customer := $customer1
                    return
                        <customer>
                            <id>{ data($customer/id) }</id>
                            <code>{ data($customer/code) }</code>
                            <description>{ data($customer/description) }</description>
                            <firstName>{ data($customer/firstName) }</firstName>
                            <secondName>{ data($customer/secondName) }</secondName>
                            <lastName>{ data($customer/lastName) }</lastName>
                            <secondLastName>{ data($customer/secondLastName) }</secondLastName>
                            <ageRange>{ data($customer/ageRange) }</ageRange>
                            {
                                for $document in $customer/document
                                return
                                    <document>{ $document/@* , $document/node() }</document>
                            }
                            {
                                for $type in $customer/type
                                return
                                    <type>{ $type/@* , $type/node() }</type>
                            }
                            <issueDateOfID>{ data($customer/issueDateOfID) }</issueDateOfID>
                            {
                                for $location in $customer/location
                                return
                                    <location>{ $location/@* , $location/node() }</location>
                            }
                            <phoneNumber>{ data($customer/phoneNumber) }</phoneNumber>
                            <dateOfBirth>{ data($customer/dateOfBirth) }</dateOfBirth>
                            <nuncaIndicator>{ data($customer/nuncaIndicator) }</nuncaIndicator>
                            <vipIndicator>{ data($customer/vipIndicator) }</vipIndicator>
                            {
                                for $order in $customer/order
                                return
                                    <order>
                                        {
                                            for $id in $order/id
                                            return
                                                <id>{ data($id) }</id>
                                        }
                                        {
                                            for $code in $order/code
                                            return
                                                <code>{ data($code) }</code>
                                        }
                                        {
                                            for $description in $order/description
                                            return
                                                <description>{ concat($description) }</description>
                                        }
                                        {
                                            for $orderType in $order/orderType
                                            return
                                                <orderType>{ $orderType/@* , $orderType/node() }</orderType>
                                        }
                                        {
                                            for $causal in $order/causal
                                            return
                                                <causal>{ data($causal) }</causal>
                                        }
                                    </order>
                            }
                            {
	                            for $RetentionCase in $retrieveLineStatisticsResponse1/ns5:CustomerLineStatistics/ns5:RetentionCase
	                                return
	                                <order>
	                                   		{
	                                            for $retentionCaseId in $RetentionCase/ns5:retentionCaseId
	                                            return
	                                                <code>{ data($retentionCaseId) }</code>
	                                        }
	                                        {
	                                            for $retentionMSISDN in $RetentionCase/ns5:retentionMSISDN
	                                            return
	                                                <description>{ data( $retentionMSISDN) }</description>
	                                        }
	                                        <orderType>
	                                        	<description>{"RetentionCase"}</description>
	                                        </orderType>
	                                </order>
                                
                            }
                            {
                            
                            if ((string-length(data($retrieveLineStatisticsResponse1/ns5:CustomerLineStatistics/ns5:OrderActionAndProductsStatistics/ns5:totalPendingCeaseLines)) gt 0 ))
                            then
                            <order>     
                                		<code>{ data($retrieveLineStatisticsResponse1/ns5:CustomerLineStatistics/ns5:OrderActionAndProductsStatistics/ns5:totalPendingCeaseLines) }</code>                              		
                                        <description>{ "totalPendingCeaseLines" }</description>
                            </order>
                            else ()
                            }
                            {
                                for $product in $customer/product
                                return
                                    <product>{ $product/@* , $product/node() }</product>
                            }
                            {
                               
                            	for $DisactiveProductsInfo in $retrieveLineStatisticsResponse1/ns5:CustomerLineStatistics/ns5:OrderActionAndProductsStatistics/ns5:DisactiveProductsInfo
                            		return
                            		for $DisactivationInfo in $DisactiveProductsInfo/ns5:DisactivationInfo
                               		 return 	
			                                   <product>
			                                                <number>{ data($DisactivationInfo/ns5:msisdn) }</number>
			                                              
			                                                <status>
			                                                	<description>
			                                                	{ data($DisactiveProductsInfo/ns5:productStatus) } 
			                                                	</description>
			                                                	<status>
				                                                	<description>
				                                                	{ data($DisactivationInfo/ns5:reason) } 
				                                                	</description>
			                                                	</status>
			                                                </status>
			                                </product>
			                                
			                }                
			                            
                            {
                                for $bankingAccount in $customer/bankingAccount
                                return
                                    <bankingAccount>{ $bankingAccount/@* , $bankingAccount/node() }</bankingAccount>
                            }
                            {
                                for $internalAccountBehavior in $customer/internalAccountBehavior
                                return
                                    <internalAccountBehavior>{ $internalAccountBehavior/@* , $internalAccountBehavior/node() }</internalAccountBehavior>
                            }
                            {
                                for $billingBehavior in $customer/billingBehavior
                                return
                                    <billingBehavior>{ $billingBehavior/@* , $billingBehavior/node() }</billingBehavior>
                            }
                        </customer>
                }
                 {
                    for $GamaStatistics in $retrieveLineStatisticsResponse1/ns5:CustomerLineStatistics/ns5:GamaStatistics
                    return
                       for $PlanCategoryLines in $GamaStatistics/ns5:PlanCategoryLines
                       return
                        <salesMatrixResult>
                            <gama>{ data($GamaStatistics/ns5:gamaType) }</gama>
                            <plan>{ data($PlanCategoryLines/ns5:planCategory) }</plan>
                            <linesNumber>{ data($PlanCategoryLines/ns5:totalLines) }</linesNumber>
                        </salesMatrixResult>
                }
            </message>
        </ns4:WS_Result>
};

declare variable $retrieveLineStatisticsResponse1 as element(ns5:RetrieveLineStatisticsResponse) external;
declare variable $customer1 as element() external;

xf:getClientStatisticsLines_Res($retrieveLineStatisticsResponse1,
    $customer1)

(:: pragma bea:global-element-parameter parameter="$getCreditScoreByCustomerRequest" element="ns1:GetCreditScoreByCustomerRequest" location="../Schemas/PS_GET_CREDITSCOREBYCUSTOMER.xsd" ::)
(:: pragma bea:global-element-return element="ns2:Input_Parameters" location="../../../Framework/Resources/Schemas/PS_RULES_ENGINE_MANAGER.xsd" ::)

declare namespace ns2 = "http://www.claro.com.co/rulesEngine/manager";
declare namespace ns1 = "http://getcreditscorebycustomer.performancemanagement.schema.amx.com";
declare namespace xf = "http://tempuri.org/RulesEngine/Core/Resources/XQueries/getCreditScoreByCustomer_Req_RulesManager/";

declare function xf:getCreditScoreByCustomer_Req_RulesManager($getCreditScoreByCustomerRequest as element(ns1:GetCreditScoreByCustomerRequest))
    as element(ns2:Input_Parameters) {
    	let $creditScoreInformation := $getCreditScoreByCustomerRequest/ns1:CreditScoreInformation,
    	    $addressInfoDetails := $creditScoreInformation/ns1:AddressInfoDetails
    	return
        <ns2:Input_Parameters>
            <process>{ data($creditScoreInformation/ns1:oaType) }</process>
            <operation>getCreditScoreByCustomer</operation>
            <entities>
	           	<customer>
		        	<id>{ data($creditScoreInformation/ns1:customerId) }</id>
		            <description>{ data($creditScoreInformation/ns1:userId) }</description>
		            <firstName>{ data($creditScoreInformation/ns1:firstName) }</firstName>
		            <lastName>{ data($creditScoreInformation/ns1:lastName) }</lastName>
		        	<document>
						<identifierNumber>{ data($creditScoreInformation/ns1:identifierNumber) }</identifierNumber>		                	
		        		<type>
		        			<code>{data($creditScoreInformation/ns1:identifierType)}</code>
		        		</type>
		        	</document>
		        	<type>
		        		<description>{data($creditScoreInformation/ns1:customerType)}</description>
		        	</type>
		            <location>
			            <addressText>{ data($addressInfoDetails/ns1:addressText) }</addressText>
			            
			            <city>
		                    <description>{ data($addressInfoDetails/ns1:city) }</description>
		                </city>
		                <district>{ data($addressInfoDetails/ns1:district) }</district>
		                <state>
		                    <description>{ data($addressInfoDetails/ns1:state) }</description>
		                </state>
		                <costCenterRegion>
		                    <description>{ concat($creditScoreInformation/ns1:region , $addressInfoDetails/ns1:costCenterRegion) }</description>
		                </costCenterRegion>
		                <country>
		                    <description>{ data($addressInfoDetails/ns1:country) }</description>
		                </country>
			            <area>{ data($addressInfoDetails/ns1:area) }</area>
			            <quarter>{ data($addressInfoDetails/ns1:quarter) }</quarter>
		        		<streetType>{ data($addressInfoDetails/ns1:streetType) }</streetType>
			            <streetName>{ data($addressInfoDetails/ns1:streetName) }</streetName>
			            <streetPrefix>{ data($addressInfoDetails/ns1:streetPrefix) }</streetPrefix>
			            <streetNumber>{ data($addressInfoDetails/ns1:streetNumber) }</streetNumber>
			            <streetSuffix>{ data($addressInfoDetails/ns1:streetSuffix) }</streetSuffix>
			            <streetIntersection>{ data($addressInfoDetails/ns1:streetIntersection) }</streetIntersection>
			            <streetIntersectionSuffix>{ data($addressInfoDetails/ns1:streetIntersectionSuffix) }</streetIntersectionSuffix>
			            <additionalInfo>{ data($addressInfoDetails/ns1:additionalInfo) }</additionalInfo>
			            <buildingType>{ data($addressInfoDetails/ns1:buildingType) }</buildingType>
			            <buildingNumber>{ data($addressInfoDetails/ns1:buildingNumber) }</buildingNumber>
			            <internalBuildingNumber>{ data($addressInfoDetails/ns1:internalBuildingNumber) }</internalBuildingNumber>
			            <internalBuildingNumberSuffix>{ data($addressInfoDetails/ns1:internalBuildingNumberSuffix) }</internalBuildingNumberSuffix>
			            <apartmentNumber>{ data($addressInfoDetails/ns1:apartmentNumber) }</apartmentNumber>
			            <totalNumOfFloors>{ data($addressInfoDetails/ns1:totalNumOfFloors) }</totalNumOfFloors>
			            <neighborhood>{ data($addressInfoDetails/ns1:neighborhood) }</neighborhood>
			            <pOBox>{ data($addressInfoDetails/ns1:poBox) }</pOBox>
			            <postalCode>{ data($addressInfoDetails/ns1:postalCode) }</postalCode>
			            <socioEconomicalRank>{ data($addressInfoDetails/ns1:socioEconomicalRank) }</socioEconomicalRank>
			        </location>
		            <phoneNumber>{ data($creditScoreInformation/ns1:phoneNumber) }</phoneNumber>
		            <dateOfBirth>{ data($creditScoreInformation/ns1:dateOfBirth) }</dateOfBirth>
		            <nuncaIndicator>{ data($creditScoreInformation/ns1:nuncaIndication) }</nuncaIndicator>
		            <vipIndicator>{ data($creditScoreInformation/ns1:vipIndication) }</vipIndicator>
		            <order>
			            <id>{ data($creditScoreInformation/ns1:orderId) }</id>
			            <orderType>
		        			<description>{ data($creditScoreInformation/ns1:oaType) }</description>
		    			</orderType>
			        </order>
			        <product>
			        	<supplier>
				            <id>{ data($creditScoreInformation/ns1:dealerId) }</id>
				            <description>{ data($creditScoreInformation/ns1:dealerOnBehalf) }</description>
				        </supplier>
		    		</product>
		    		<billingBehavior>
		            	<creditCheckApproved>{ data($creditScoreInformation/ns1:creditCheckApproved) }</creditCheckApproved>
		        	</billingBehavior>
		            
		        </customer>
	        	<creditReference>
		            <creditRefNumber>{ data($creditScoreInformation/ns1:creditRefNumber) }</creditRefNumber>
		        </creditReference>
			    <salesChannel>
		            <description>{ data($creditScoreInformation/ns1:salesChannel) }</description>
		        </salesChannel>
		        <affiliateInformation>
		            <id>{ data($getCreditScoreByCustomerRequest/ns1:AffiliateInformation/ns1:market) }</id>
		            <description>{ data($getCreditScoreByCustomerRequest/ns1:AffiliateInformation/ns1:affiliate) }</description>
		        </affiliateInformation>
	        </entities>
	              
        </ns2:Input_Parameters>
};

declare variable $getCreditScoreByCustomerRequest as element(ns1:GetCreditScoreByCustomerRequest) external;

xf:getCreditScoreByCustomer_Req_RulesManager($getCreditScoreByCustomerRequest)
(:: pragma bea:global-element-parameter parameter="$performFullCreditEvaluationRequest1" element="ns4:PerformFullCreditEvaluationRequest" location="../Schemas/PS_PERFORMFULLCREDITEVALUATION.xsd" ::)
(:: pragma bea:global-element-return element="ns3:Input_Parameters" location="../../../Framework/Resources/Schemas/PS_RULES_ENGINE_MANAGER.xsd" ::)

declare namespace ns2 = "http://www.claro.com.co/rulesEngine/canonicalModel/ProductDomain";
declare namespace ns1 = "http://www.claro.com.co/rulesEngine/canonicalModel/CommonBusinessEntities";
declare namespace ns4 = "http://performfullcreditevaluation.creditcalculation.schema.amx.com";
declare namespace ns3 = "http://www.claro.com.co/rulesEngine/manager";
declare namespace ns0 = "http://www.claro.com.co/rulesEngine/canonicalModel/SupplierDomain";
declare namespace xf = "http://tempuri.org/RulesEngine/Core/Resources/XQueries/performFullCreditEvaluation_Req_RulesManager/";

declare function xf:performFullCreditEvaluation_Req_RulesManager($performFullCreditEvaluationRequest1 as element(ns4:PerformFullCreditEvaluationRequest))
    as element(ns3:Input_Parameters) {
       
       let $creditScoreInformation := $performFullCreditEvaluationRequest1/CreditScoreInformation,
              $addressInfoDetails := $creditScoreInformation/AddressInfoDetails,
              $AffiliateInformation := $performFullCreditEvaluationRequest1/AffiliateInformation
            return 
            
            
        <ns3:Input_Parameters>
           <process>{ data($creditScoreInformation/oaType) }</process>
           <operation>performFullCreditEvaluation</operation>
           <entities>
               <customer>
		        	<id>{ data($creditScoreInformation/customerId) }</id>
		            <description>{ data($creditScoreInformation/userId) }</description>
		            <firstName>{ data($creditScoreInformation/firstName) }</firstName>
		            <lastName>{ data($creditScoreInformation/lastName) }</lastName>
		        	<document>
						<identifierNumber>{ data($creditScoreInformation/identifierNumber) }</identifierNumber>		                	
		        		<type>
		        			<code>{data($creditScoreInformation/identifierType)}</code>
		        		</type>
		        	</document>
		        	<type>
		        		<description>{data($creditScoreInformation/customerType)}</description>
		        	</type>
		            <location>
			            <addressText>{ data($addressInfoDetails/addressText) }</addressText>
			            
			            <city>
		                    <description>{ data($addressInfoDetails/city) }</description>
		                </city>
		                <district>{ data($addressInfoDetails/district) }</district>
		                <state>
		                    <description>{ data($addressInfoDetails/state) }</description>
		                </state>
		                <costCenterRegion>
		                    <description>{ concat($creditScoreInformation/region , $addressInfoDetails/ns1:costCenterRegion) }</description>
		                </costCenterRegion>
		                <country>
		                    <description>{ data($addressInfoDetails/country) }</description>
		                </country>
			            <area>{ data($addressInfoDetails/area) }</area>
			            <quarter>{ data($addressInfoDetails/quarter) }</quarter>
		        		<streetType>{ data($addressInfoDetails/streetType) }</streetType>
			            <streetName>{ data($addressInfoDetails/streetName) }</streetName>
			            <streetPrefix>{ data($addressInfoDetails/streetPrefix) }</streetPrefix>
			            <streetNumber>{ data($addressInfoDetails/streetNumber) }</streetNumber>
			            <streetSuffix>{ data($addressInfoDetails/streetSuffix) }</streetSuffix>
			            <streetIntersection>{ data($addressInfoDetails/streetIntersection) }</streetIntersection>
			            <streetIntersectionSuffix>{ data($addressInfoDetails/streetIntersectionSuffix) }</streetIntersectionSuffix>
			            <additionalInfo>{ data($addressInfoDetails/additionalInfo) }</additionalInfo>
			            <buildingType>{ data($addressInfoDetails/buildingType) }</buildingType>
			            <buildingNumber>{ data($addressInfoDetails/buildingNumber) }</buildingNumber>
			            <internalBuildingNumber>{ data($addressInfoDetails/internalBuildingNumber) }</internalBuildingNumber>
			            <internalBuildingNumberSuffix>{ data($addressInfoDetails/internalBuildingNumberSuffix) }</internalBuildingNumberSuffix>
			            <apartmentNumber>{ data($addressInfoDetails/apartmentNumber) }</apartmentNumber>
			            <totalNumOfFloors>{ data($addressInfoDetails/totalNumOfFloors) }</totalNumOfFloors>
			            <neighborhood>{ data($addressInfoDetails/neighborhood) }</neighborhood>
			            <pOBox>{ data($addressInfoDetails/poBox) }</pOBox>
			            <postalCode>{ data($addressInfoDetails/postalCode) }</postalCode>
			            <socioEconomicalRank>{ data($addressInfoDetails/socioEconomicalRank) }</socioEconomicalRank>
			        </location>
		            <phoneNumber>{ data($creditScoreInformation/phoneNumber) }</phoneNumber>
		            <dateOfBirth>{ data($creditScoreInformation/dateOfBirth) }</dateOfBirth>
		            <nuncaIndicator>{ data($creditScoreInformation/nuncaIndication) }</nuncaIndicator>
		            <vipIndicator>{ data($creditScoreInformation/vipIndication) }</vipIndicator>
		            <order>
			            <id>{ data($creditScoreInformation/orderId) }</id>
			            <orderType>
		        			<description>{ data($creditScoreInformation/oaType) }</description>
		    			</orderType>
			        </order>
			        <product>
		                {
		                    for $ProductDiffInfo in $performFullCreditEvaluationRequest1/ProductDiffInfo
		                    return
		                        <productDiffInfo>
		                            {
		                                for $ComponentDiffInfoList in $ProductDiffInfo/ComponentDiffInfoList
		                                return
		                                    <componentDiffInfoList>
		                                        <componentName>{ data($ComponentDiffInfoList/componentName) }</componentName>
		                                        <componentCID>{ data($ComponentDiffInfoList/componentCID) }</componentCID>
		                                        {
		                                            for $SubComponents in $ComponentDiffInfoList/SubComponents
		                                            return
		                                                <subComponents>
		                                                  {$SubComponents/node()}
		                                                </subComponents>
		                                        }
		                                        {
		                                            for $AttributeDiffInfoList in $ComponentDiffInfoList/AttributeDiffInfoList
		                                            return
		                                                <attributeDiffInfo>
		                                                    <attributeName>{ data($AttributeDiffInfoList/attributeName) }</attributeName>
		                                                    <attributePropertyID>{ data($AttributeDiffInfoList/attributePropertyId) }</attributePropertyID>
		                                                    <attributeValue>{ data($AttributeDiffInfoList/attributeValue) }</attributeValue>
		                                                    {
		                                                        for $attributeOldValue in $AttributeDiffInfoList/attributeOldValue
		                                                        return
		                                                            <attributeOldValue>{ data($attributeOldValue) }</attributeOldValue>
		                                                    }
		                                                </attributeDiffInfo>
		                                        }
		                                        {
		                                            for $ChargesInfo in $ComponentDiffInfoList/ChargesInfo
		                                            return
		                                                <chargesInfo>
		                                                    <actualAmount>{ data($ChargesInfo/actualAmount) }</actualAmount>
		                                                    <chargeType>{ data($ChargesInfo/chargeType) }</chargeType>
		                                                    <aPID>{ data($ChargesInfo/apId) }</aPID>
		                                                    <isWaived>{ data($ChargesInfo/isWaived) }</isWaived>
		                                                </chargesInfo>
		                                        }
		                                    </componentDiffInfoList>
		                            }
		                            <offerName>{ data($ProductDiffInfo/offerName) }</offerName>
		                            {
		                                let $result :=
		                                    for $OrderActionInfo in $ProductDiffInfo/OrderActionInfo
		                                    return
		                                        <orderActionInfo>
		                                            <orderActionID>{ data($OrderActionInfo/orderActionId) }</orderActionID>
		                                            <orderActionType>{ data($OrderActionInfo/orderActionType) }</orderActionType>
		                                            <oASRD>{ data($OrderActionInfo/oasrd) }</oASRD>
		                                        </orderActionInfo>
		                                return
		                                    $result[1]
		                            }
		                            <sumOfOC>{ data($ProductDiffInfo/sumOfOC) }</sumOfOC>
		                            <sumOfCurrentRC>{ data($ProductDiffInfo/sumCurrentRC) }</sumOfCurrentRC>
		                            {
		                                for $campaignId in $ProductDiffInfo/campaignId
		                                return
		                                    <campaignId>{ data($campaignId) }</campaignId>
		                            }
		                            {
		                                for $campaignDescription in $ProductDiffInfo/campaignDescription
		                                return
		                                    <campaignDescription>{ data($campaignDescription) }</campaignDescription>
		                            }
		                        </productDiffInfo>
		                }
		                	    <supplier>
						            <id>{ data($creditScoreInformation/dealerId) }</id>
						            <description>{ data($creditScoreInformation/dealerOnBehalf) }</description>
						        </supplier>
		            </product>
		    		<billingBehavior>
		            	<creditCheckApproved>{ data($creditScoreInformation/creditCheckApproved) }</creditCheckApproved>
		        	</billingBehavior>
			    </customer>
	            <salesChannel>
			            <description>{ data($creditScoreInformation/salesChannel) }</description>
			    </salesChannel>
	            <affiliateInformation>
	                        <affiliate>{ data($AffiliateInformation/affiliate) }</affiliate>
	                        <market>{ data($AffiliateInformation/market) }</market>
	            </affiliateInformation>
            
           </entities>
        </ns3:Input_Parameters>
};

declare variable $performFullCreditEvaluationRequest1 as element(ns4:PerformFullCreditEvaluationRequest) external;

xf:performFullCreditEvaluation_Req_RulesManager($performFullCreditEvaluationRequest1)

xquery version "1.0" encoding "Cp1252";
(:: pragma bea:global-element-parameter parameter="$validateEquipmentRequest" element="ns0:ValidateEquipmentRequest" location="../Schemas/PS_VALIDATE_EQUIPMENT.xsd" ::)
(:: pragma  type="xs:anyType" ::)

declare namespace xf = "http://tempuri.org/RulesEngine/Core/Resources/XQueries/validateEquipmentToCanonicalModel/";
declare namespace ns0 = "http://validateequipment.equipmentmanagement.schema.amx.com";

declare function xf:validateEquipmentToCanonicalModel($validateEquipmentRequest as element(ns0:ValidateEquipmentRequest))
    as element(*) {
    	 let $affiliateInformation := $validateEquipmentRequest/ns0:affiliateInformation
    	 return
         <entities>
         	{ 
     		for $equipment in $validateEquipmentRequest/ns0:Equipment
     	  	return
     	  	<customerOrder>
	            <orderActionType>{ data($equipment/ns0:orderActionType) }</orderActionType>
	            <acquisitionType>{ data($equipment/ns0:acquisitionType) }</acquisitionType>
		        <reasonCode>{ data($equipment/ns0:reasonCode) }</reasonCode>
	         	<product>
		            <code>{ data($equipment/ns0:equipmentIdentifier) }</code>
		            <description>{ data($equipment/ns0:materialCode) }</description>
		            
		            <status>
		            	<description></description>
		            </status>	
		            <type>
			            <description>
			            	{data($equipment/ns0:equipmentType)}
			            </description>
		            </type>
		            <validationMessage></validationMessage>
		            <supplier>
		            	<description>{data($validateEquipmentRequest/ns0:dealerId)}</description>
		            </supplier>
		        </product>
	        </customerOrder>
        	}
        	<customerDocument>
				<identifierNumber>{data($validateEquipmentRequest/ns0:FlexibleAttribute[ns0:attributeName='IDDocumentNumber']/ns0:attributeValue)}</identifierNumber>		                	
        		<type>
        			<code>{data($validateEquipmentRequest/ns0:FlexibleAttribute[ns0:attributeName='IDDocumentType']/ns0:attributeValue)}</code>
        		</type>
        	</customerDocument>
        	<salesChannel>
        		<description>{data($validateEquipmentRequest/ns0:salesChannel)}</description>
        	</salesChannel>
        	<zone>
        		<description>{data($validateEquipmentRequest/ns0:region)}</description>
        	</zone>
        	
        	<affiliateInformation>
            	<affiliate>{ data($affiliateInformation/ns0:affiliate) }</affiliate>
            	<market>{ data($affiliateInformation/ns0:market) }</market>
            </affiliateInformation>
         </entities>
};

declare variable $validateEquipmentRequest as element(ns0:ValidateEquipmentRequest) external;

xf:validateEquipmentToCanonicalModel($validateEquipmentRequest)

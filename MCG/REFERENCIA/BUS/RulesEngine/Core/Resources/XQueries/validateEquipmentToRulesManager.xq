(:: pragma  parameter="$customerOrder" type="anyType" ::)
(:: pragma  parameter="$zone" type="anyType" ::)
(:: pragma  parameter="$affiliateInformation" type="anyType" ::)
(:: pragma  parameter="$customerDocument" type="anyType" ::)
(:: pragma bea:global-element-return element="ns0:Input_Parameters" location="../../../Framework/Resources/Schemas/PS_RULES_ENGINE_MANAGER.xsd" ::)

declare namespace ns0 = "http://www.claro.com.co/rulesEngine/manager";
declare namespace xf = "http://tempuri.org/RulesEngine/Core/Resources/XQueries/validateEquipmentToRulesManager/";

declare function xf:validateEquipmentToRulesManager($customerOrder as element(*),
    $salesChannel as element(*),
    $zone as element(*),
    $affiliateInformation as element(*),
    $customerDocument as element(*))
    as element(ns0:Input_Parameters) {
        <ns0:Input_Parameters>
            <process>{data($customerOrder/orderActionType)}</process>
            <operation>validateEquipment</operation>
            <entities>{ $customerOrder,$salesChannel,$zone,$affiliateInformation,$customerDocument }</entities>
        </ns0:Input_Parameters>
};

declare variable $customerOrder as element(*) external;
declare variable $zone as element(*) external;
declare variable $salesChannel as element(*) external;
declare variable $affiliateInformation as element(*) external;
declare variable $customerDocument as element(*) external;

xf:validateEquipmentToRulesManager($customerOrder,
	$salesChannel,
    $zone,
    $affiliateInformation,
    $customerDocument)

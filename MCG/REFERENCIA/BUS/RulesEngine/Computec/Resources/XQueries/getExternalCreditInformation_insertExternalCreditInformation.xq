(:: pragma  parameter="$input" type="anyType" ::)
(:: pragma bea:global-element-return element="ns0:Input_Parameters" location="../../../Core/Resources/Schemas/PS_INSERT_EXTERNALCREDITINFORMATION.xsd" ::)

declare namespace ns0 = "http://www.claro.com.co/rulesEngine/insertExternalCreditInformation";
declare namespace xf = "http://tempuri.org/RulesEngine/Computec/Resources/XQueries/getExternalCreditInformation_insertExternalCreditInformation/";

declare function xf:getExternalCreditInformation_insertExternalCreditInformation($input as element(*))
    as element(ns0:Input_Parameters) {
        <ns0:Input_Parameters>
            <P_REPORT>{ $input }</P_REPORT>
        </ns0:Input_Parameters>
};

declare variable $input as element(*) external;

xf:getExternalCreditInformation_insertExternalCreditInformation($input)

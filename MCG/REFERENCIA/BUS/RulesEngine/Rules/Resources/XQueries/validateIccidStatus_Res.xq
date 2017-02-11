(:: pragma bea:global-element-parameter parameter="$callFunctionStatelessDecision1" element="ns1:callFunctionStatelessDecision" location="../Schemas/BR_VALIDATEICCIDSTATUS_MESSAGETYPES.xsd" ::)
(:: pragma bea:global-element-return element="ns0:WS_Result" location="../Schemas/PS_VALIDATEICCIDSTATUS.xsd" ::)

declare namespace ns2 = "http://www.claro.com.co/rulesEngine/canonicalModel/SupplierDomain";
declare namespace ns1 = "http://xmlns.oracle.com/ValidateICCIDStatus/DS_ValidateICCIDStatus";
declare namespace ns4 = "http://www.claro.com.co/rulesEngine/ValidateICCIDStatusFact/";
declare namespace ns3 = "http://www.claro.com.co/rulesEngine/canonicalModel/CommonBusinessEntities";
declare namespace ns0 = "http://www.claro.com.co/rulesEngine/validateIccidStatus";
declare namespace ns5 = "http://www.claro.com.co/rulesEngine/canonicalModel/ProductDomain";
declare namespace xf = "http://tempuri.org/RulesEngine/Rules/Resources/XQueries/validateIccidStatus_Res/";

declare function xf:validateIccidStatus_Res($callFunctionStatelessDecision1 as element(ns1:callFunctionStatelessDecision))
    as element(ns0:WS_Result) {
        <ns0:WS_Result>
            <code>1</code>
            <message>
                {
                    for $Product in $callFunctionStatelessDecision1/ns1:resultList/ns4:ValidateICCIDStatusFactResponse/Product
                    return
                        <product>{ $Product/@* , $Product/node() }</product>
                }
            </message>
            <description>Operacion Ejecutada</description>
        </ns0:WS_Result>
};

declare variable $callFunctionStatelessDecision1 as element(ns1:callFunctionStatelessDecision) external;

xf:validateIccidStatus_Res($callFunctionStatelessDecision1)

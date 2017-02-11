(:: pragma bea:global-element-parameter parameter="$input_Parameters1" element="ns2:Input_Parameters" location="../Schemas/PS_EQUIPMENTTYPE.xsd" ::)
(:: pragma bea:global-element-return element="ns6:callFunctionStateless" location="../Schemas/BR_EQUIPMENTTYPE_MESSAGETYPES.xsd" ::)

declare namespace ns2 = "http://www.claro.com.co/rulesEngine/equipmentType";
declare namespace ns1 = "http://www.claro.com.co/rulesEngine/canonicalModel/CommonBusinessEntities";
declare namespace ns4 = "http://www.claro.com.co/rulesEngine/canonicalModel/ProductDomain";
declare namespace ns3 = "http://www.claro.com.co/rulesEngine/EquipmentTypeFact";
declare namespace ns0 = "http://www.claro.com.co/rulesEngine/canonicalModel/SupplierDomain";
declare namespace ns5 = "http://xmlns.oracle.com/bpel";
declare namespace xf = "http://tempuri.org/RulesEngine/Rules/Resources/XQueries/equipmentType_Req/";
declare namespace ns6 = "http://xmlns.oracle.com/EquipmentType/DS_EquipmentType";

declare function xf:equipmentType_Req($input_Parameters1 as element(ns2:Input_Parameters))
    as element(ns6:callFunctionStateless) {
        <ns6:callFunctionStateless>
            <ns6:parameterList>
                <ns3:EquipmentTypeFactRequest>
                    <Product>{ $input_Parameters1/product/@* , $input_Parameters1/product/node() }</Product>
                </ns3:EquipmentTypeFactRequest>
            </ns6:parameterList>
        </ns6:callFunctionStateless>
};

declare variable $input_Parameters1 as element(ns2:Input_Parameters) external;

xf:equipmentType_Req($input_Parameters1)

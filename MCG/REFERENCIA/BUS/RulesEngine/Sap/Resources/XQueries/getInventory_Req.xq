(:: pragma bea:global-element-parameter parameter="$input_Parameters1" element="ns0:Input_Parameters" location="../Schemas/PS_GET_INVENTORY.xsd" ::)
(:: pragma bea:global-element-return element="ns2:ZMM_VALIDAR_SERIAL" location="../Schemas/BS_VALIDATE_SERIAL_REQ.xsd" ::)

declare namespace ns2 = "urn:sap-com:document:sap:rfc:functions";
declare namespace ns1 = "http://www.claro.com.co/rulesEngine/canonicalModel/ProductDomain";
declare namespace ns0 = "http://www.claro.com.co/rulesEngine/getInventory";
declare namespace xf = "http://tempuri.org/RulesEngine/Sap/Resources/XQueries/getInventory_Req/";

declare function xf:getInventory_Req($input_Parameters1 as element(ns0:Input_Parameters))
    as element(ns2:ZMM_VALIDAR_SERIAL) {
        <ns2:ZMM_VALIDAR_SERIAL>
            <ns2:I_CANAL>{ data($input_Parameters1/salesChannel/description) }</ns2:I_CANAL>
            <ns2:I_DEALER>{ data($input_Parameters1/product/supplier/description) }</ns2:I_DEALER>
            <ns2:I_SERNR>{ data($input_Parameters1/product/code) }</ns2:I_SERNR>
        </ns2:ZMM_VALIDAR_SERIAL>
};

declare variable $input_Parameters1 as element(ns0:Input_Parameters) external;

xf:getInventory_Req($input_Parameters1)

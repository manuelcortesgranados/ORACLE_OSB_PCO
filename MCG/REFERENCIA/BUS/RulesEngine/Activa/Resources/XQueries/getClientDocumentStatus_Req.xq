(:: pragma bea:global-element-parameter parameter="$input_Parameters1" element="ns3:Input_Parameters" location="../Schemas/PS_GET_CLIENTDOCUMENTSTATUS.xsd" ::)
(:: pragma bea:global-element-return element="ns2:InputParameters" location="../Schemas/BD_GET_CLIENTDOCUMENTSTATUS.xsd" ::)

declare namespace ns2 = "http://xmlns.oracle.com/pcbpel/adapter/db/sp/getClientDocumentStatus";
declare namespace ns1 = "http://www.claro.com.co/rulesEngine/canonicalModel/CommonBusinessEntities";
declare namespace ns3 = "http://www.claro.com.co/rulesEngine/getClientDocumentStatus";
declare namespace ns0 = "http://www.claro.com.co/rulesEngine/canonicalModel/CustomerDomain";
declare namespace xf = "http://tempuri.org/RulesEngine/Activa/Resources/XQueries/getDocumentStatus_Req/";

declare function xf:getDocumentStatus_Req($input_Parameters1 as element(ns3:Input_Parameters))
    as element(ns2:InputParameters) {
        <ns2:InputParameters>
            {
                for $identifierNumber in $input_Parameters1/customer/document/identifierNumber
                return
                    <ns2:P_DOCUMENTO>{ data($identifierNumber) }</ns2:P_DOCUMENTO>
            }
        </ns2:InputParameters>
};

declare variable $input_Parameters1 as element(ns3:Input_Parameters) external;

xf:getDocumentStatus_Req($input_Parameters1)

(:: pragma bea:global-element-parameter parameter="$input_Parameters" element="ns2:Input_Parameters" location="../Schemas/PS_REQUIREDDOCUMENTS.xsd" ::)
(:: pragma bea:global-element-return element="ns0:callFunctionStateless" location="../Schemas/BR_REQUIREDDOCUMENTS_MESSAGETYPES.xsd" ::)

declare namespace ns2 = "http://www.claro.com.co/rulesEngine/requiredDocuments";
declare namespace ns1 = "http://www.claro.com.co/rulesEngine/canonicalModel/CustomerDomain";
declare namespace ns4 = "http://www.claro.com.co/rulesEngine/RequiredDocumentsFact";
declare namespace ns3 = "http://www.claro.com.co/rulesEngine/canonicalModel/CommonBusinessEntities";
declare namespace ns0 = "http://xmlns.oracle.com/RequiredDocuments/DS_RequiredDocuments";
declare namespace ns5 = "http://xmlns.oracle.com/bpel";
declare namespace xf = "http://tempuri.org/RulesEngine/Rules/Resources/XQueries/requiredDocuments_Req/";
declare namespace ns6 = "http://www.claro.com.co/rulesEngine/canonicalModel/MarketSalesDomain";

declare function xf:requiredDocuments_Req($input_Parameters as element(ns2:Input_Parameters))
    as element(ns0:callFunctionStateless) {
        <ns0:callFunctionStateless name = "DS_RequiredDocuments">
            <ns0:parameterList>
                <ns4:RequiredDocumentsFactRequest>
                    <Zone>{ $input_Parameters/zone/@* , $input_Parameters/zone/node() }</Zone>
                    <Customer>{ $input_Parameters/customer/@* , $input_Parameters/customer/node() }</Customer>
                    <SalesChannel>{ $input_Parameters/salesChannel/@* , $input_Parameters/salesChannel/node() }</SalesChannel>
                </ns4:RequiredDocumentsFactRequest>
            </ns0:parameterList>
        </ns0:callFunctionStateless>
};

declare variable $input_Parameters as element(ns2:Input_Parameters) external;

xf:requiredDocuments_Req($input_Parameters)

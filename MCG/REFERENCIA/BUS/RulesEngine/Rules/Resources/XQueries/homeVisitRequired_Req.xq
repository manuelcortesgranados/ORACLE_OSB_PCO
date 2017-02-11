(:: pragma bea:global-element-parameter parameter="$input_Parameters1" element="ns3:Input_Parameters" location="../Schemas/PS_HOMEVISITREQUIRED.xsd" ::)
(:: pragma bea:global-element-return element="ns1:callFunctionStateless" location="../Schemas/BR_HOMEVISITREQUIRED_MESSAGETYPES.xsd" ::)

declare namespace ns2 = "http://www.claro.com.co/rulesEngine/canonicalModel/CustomerDomain";
declare namespace ns1 = "http://xmlns.oracle.com/HomeVisitRequired/DS_HomeVisitRequired";
declare namespace ns4 = "http://www.claro.com.co/rulesEngine/canonicalModel/SupplierDomain";
declare namespace ns3 = "http://www.claro.com.co/rulesEngine/homeVisitRequired";
declare namespace ns0 = "http://www.claro.com.co/rulesEngine/HomeVisitRequiredFact";
declare namespace ns5 = "http://www.claro.com.co/rulesEngine/canonicalModel/CommonBusinessEntities";
declare namespace xf = "http://tempuri.org/RulesEngine/Rules/Resources/XQueries/homeVisitRequired_Req/";
declare namespace ns6 = "http://www.claro.com.co/rulesEngine/canonicalModel/ProductDomain";
declare namespace ns7 = "http://xmlns.oracle.com/bpel";

declare function xf:homeVisitRequired_Req($input_Parameters1 as element(ns3:Input_Parameters))
    as element(ns1:callFunctionStateless) {
        <ns1:callFunctionStateless name="DS_HomeVisitRequired">
            <ns1:parameterList>
                <ns0:HomeVisitRequiredFactRequest>
                    <Zone>{ $input_Parameters1/customer/location/costCenterRegion/@* , $input_Parameters1/customer/location/costCenterRegion/node() }</Zone>
                    <Customer>{ $input_Parameters1/customer/@* , $input_Parameters1/customer/node() }</Customer>
                    <ProductClassification>{ $input_Parameters1/customer/product[1]/classification/@* , $input_Parameters1/customer/product[1]/classification/node() }</ProductClassification>
                </ns0:HomeVisitRequiredFactRequest>
            </ns1:parameterList>
        </ns1:callFunctionStateless>
};

declare variable $input_Parameters1 as element(ns3:Input_Parameters) external;

xf:homeVisitRequired_Req($input_Parameters1)

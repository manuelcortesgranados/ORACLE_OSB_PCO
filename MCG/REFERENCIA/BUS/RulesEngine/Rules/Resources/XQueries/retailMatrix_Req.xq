(:: pragma bea:global-element-parameter parameter="$input_Parameters" element="ns4:Input_Parameters" location="../Schemas/PS_RETAILMATRIX.xsd" ::)
(:: pragma bea:global-element-return element="ns6:callFunctionStateless" location="../Schemas/BR_RETAILMATRIX_MESSAGETYPES.xsd" ::)

declare namespace ns2 = "http://www.claro.com.co/rulesEngine/canonicalModel/ProductDomain";
declare namespace ns1 = "http://www.claro.com.co/rulesEngine/canonicalModel/CommonBusinessEntities";
declare namespace ns4 = "http://www.claro.com.co/rulesEngine/retailMatrix";
declare namespace ns3 = "http://www.claro.com.co/rulesEngine/RetailMatrixFact";
declare namespace ns0 = "http://www.claro.com.co/rulesEngine/canonicalModel/CustomerDomain";
declare namespace ns5 = "http://xmlns.oracle.com/bpel";
declare namespace xf = "http://tempuri.org/RulesEngine/Rules/Resources/XQueries/retailMatrix_Req/";
declare namespace ns6 = "http://xmlns.oracle.com/RetailMatrix/DS_RetailMatrix";

declare function xf:retailMatrix_Req($input_Parameters as element(ns4:Input_Parameters))
    as element(ns6:callFunctionStateless) {
        <ns6:callFunctionStateless name = "DS_RetailMatrix">
            <ns6:parameterList>
                <ns3:RetailMatrixFactRequest>
                    <Customer>{ $input_Parameters/customer/@* , $input_Parameters/customer/node() }</Customer>
                    <Zone>{ $input_Parameters/zone/@* , $input_Parameters/zone/node() }</Zone>
                </ns3:RetailMatrixFactRequest>
            </ns6:parameterList>
        </ns6:callFunctionStateless>
};

declare variable $input_Parameters as element(ns4:Input_Parameters) external;

xf:retailMatrix_Req($input_Parameters)

(:: pragma bea:global-element-parameter parameter="$input_Parameters1" element="ns0:Input_Parameters" location="../Schemas/PS_DUALMATRIX.xsd" ::)
(:: pragma bea:global-element-return element="ns1:callFunctionStateless" location="../Schemas/BR_DUALMATRIX_MESSAGETYPES.xsd" ::)

declare namespace ns2 = "http://www.claro.com.co/rulesEngine/canonicalModel/CustomerDomain";
declare namespace ns1 = "http://xmlns.oracle.com/DualMatrix/DS_DualMatrix";
declare namespace ns4 = "http://www.claro.com.co/rulesEngine/canonicalModel/ProductDomain";
declare namespace ns3 = "http://www.claro.com.co/rulesEngine/canonicalModel/CommonBusinessEntities";
declare namespace ns0 = "http://www.claro.com.co/rulesEngine/dualMatrix";
declare namespace ns5 = "http://xmlns.oracle.com/bpel";
declare namespace ns6 = "http://www.claro.com.co/rulesEngine/DualMatrixFact";
declare namespace xf = "http://tempuri.org/RulesEngine/Rules/Resources/XQueries/dualMatrix_Req/";

declare function xf:dualMatrix_Req($input_Parameters1 as element(ns0:Input_Parameters))
    as element(ns1:callFunctionStateless) {
        <ns1:callFunctionStateless name = "DS_DualMatrix">
            <ns1:parameterList>
                <ns6:DualMatrixFactRequest>
                    <Customer>{ $input_Parameters1/customer/@* , $input_Parameters1/customer/node() }</Customer>
                    <Zone>{ $input_Parameters1/zone/@* , $input_Parameters1/zone/node() }</Zone>
                </ns6:DualMatrixFactRequest>
            </ns1:parameterList>
        </ns1:callFunctionStateless>
};

declare variable $input_Parameters1 as element(ns0:Input_Parameters) external;

xf:dualMatrix_Req($input_Parameters1)

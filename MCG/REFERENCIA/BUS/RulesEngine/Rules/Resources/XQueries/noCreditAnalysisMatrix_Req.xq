(:: pragma bea:global-element-parameter parameter="$input_Parameters1" element="ns2:Input_Parameters" location="../Schemas/PS_NOCREDITANALYSISMATRIX.xsd" ::)
(:: pragma bea:global-element-return element="ns0:callFunctionStateless" location="../Schemas/BR_NOCREDITANALYSISMATRIX_MESSAGETYPES.xsd" ::)

declare namespace ns2 = "http://www.claro.com.co/rulesEngine/noCreditAnalysisMatrix";
declare namespace ns1 = "http://www.claro.com.co/rulesEngine/canonicalModel/CustomerDomain";
declare namespace ns4 = "http://www.claro.com.co/rulesEngine/canonicalModel/CommonBusinessEntities";
declare namespace ns3 = "http://www.claro.com.co/rulesEngine/canonicalModel/SupplierDomain";
declare namespace ns0 = "http://xmlns.oracle.com/NoCreditAnalysisMatrix/DS_NoCreditAnalysisMatrix";
declare namespace ns5 = "http://www.claro.com.co/rulesEngine/NoCreditAnalysisMatrixFact/";
declare namespace ns6 = "http://www.claro.com.co/rulesEngine/canonicalModel/ProductDomain";
declare namespace xf = "http://tempuri.org/RulesEngine/Rules/Resources/XQueries/noCreditAnalysisMatrix_Req/";
declare namespace ns7 = "http://xmlns.oracle.com/bpel";

declare function xf:noCreditAnalysisMatrix_Req($input_Parameters1 as element(ns2:Input_Parameters))
    as element(ns0:callFunctionStateless) {
        <ns0:callFunctionStateless name = "DS_NoCreditAnalysisMatrix">
            <ns0:parameterList>
                <ns5:NoCreditAnalysisMatrixFactFactRequest>
                    <Customer>{ $input_Parameters1/customer/@* , $input_Parameters1/customer/node() }</Customer>
                    <Zone>{ $input_Parameters1/zone/@* , $input_Parameters1/zone/node() }</Zone>
                </ns5:NoCreditAnalysisMatrixFactFactRequest>
            </ns0:parameterList>
        </ns0:callFunctionStateless>
};

declare variable $input_Parameters1 as element(ns2:Input_Parameters) external;

xf:noCreditAnalysisMatrix_Req($input_Parameters1)

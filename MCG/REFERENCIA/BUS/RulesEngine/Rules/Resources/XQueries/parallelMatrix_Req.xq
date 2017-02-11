(:: pragma bea:global-element-parameter parameter="$input_Parameters1" element="ns2:Input_Parameters" location="../Schemas/PS_PARALLELMATRIX.xsd" ::)
(:: pragma bea:global-element-return element="ns4:callFunctionStateless" location="../Schemas/BR_PARALLELMATRIX_MESSAGETYPES.xsd" ::)

declare namespace ns2 = "http://www.claro.com.co/rulesEngine/parallelMatrix";
declare namespace ns1 = "http://www.claro.com.co/rulesEngine/ParallelMatrixFact/";
declare namespace ns4 = "http://xmlns.oracle.com/ParallelMatrix/DS_ParallelMatrix";
declare namespace ns3 = "http://xmlns.oracle.com/bpel";
declare namespace ns0 = "http://www.claro.com.co/rulesEngine/canonicalModel/CustomerDomain";
declare namespace xf = "http://tempuri.org/RulesEngine/Rules/Resources/XQueries/parallelMatrix_Req/";

declare function xf:parallelMatrix_Req($input_Parameters1 as element(ns2:Input_Parameters))
    as element(ns4:callFunctionStateless) {
        <ns4:callFunctionStateless>
            <ns4:parameterList>
                <ns1:ParallelMatrixFactRequest>
                    <InternalAccountBehavior>{ $input_Parameters1/internalAccountBehavior/@* , $input_Parameters1/internalAccountBehavior/node() }</InternalAccountBehavior>
                    <CustomerOrder>{ $input_Parameters1/customerOrder/@* , $input_Parameters1/customerOrder/node() }</CustomerOrder>
                    <ExceptionBusinessCollection>{ $input_Parameters1/exceptionBusinessCollection/@* , $input_Parameters1/exceptionBusinessCollection/node() }</ExceptionBusinessCollection>
                </ns1:ParallelMatrixFactRequest>
            </ns4:parameterList>
        </ns4:callFunctionStateless>
};

declare variable $input_Parameters1 as element(ns2:Input_Parameters) external;

xf:parallelMatrix_Req($input_Parameters1)

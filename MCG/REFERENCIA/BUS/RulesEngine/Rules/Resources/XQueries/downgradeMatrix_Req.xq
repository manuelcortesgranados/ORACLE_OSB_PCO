(:: pragma bea:global-element-parameter parameter="$input_Parameters1" element="ns2:Input_Parameters" location="../Schemas/PS_DOWNGRADEMATRIX.xsd" ::)
(:: pragma bea:global-element-return element="ns3:callFunctionStateless" location="../Schemas/BR_DOWNGRADEMATRIX_MESSAGETYPES.xsd" ::)

declare namespace ns2 = "http://www.claro.com.co/rulesEngine/downgradeMatrix";
declare namespace ns1 = "http://www.claro.com.co/rulesEngine/DowngradeMatrixFact/";
declare namespace ns4 = "http://xmlns.oracle.com/bpel";
declare namespace ns3 = "http://xmlns.oracle.com/DowngardeMatrix/DowngardeMatrix_DecisionService_1";
declare namespace ns0 = "http://www.claro.com.co/rulesEngine/canonicalModel/CustomerDomain";
declare namespace xf = "http://tempuri.org/RulesEngine/Rules/Resources/XQueries/downgradeMatrix_Req/";

declare function xf:downgradeMatrix_Req($input_Parameters1 as element(ns2:Input_Parameters))
    as element(ns3:callFunctionStateless) {
        <ns3:callFunctionStateless name = "DowngardeMatrix_DecisionService_1">
            <ns3:parameterList>
                <ns1:DowngradeMatrixFactRequest>
                    {
                        for $internalAccountBehavior in $input_Parameters1/internalAccountBehavior
                        return
                            <internalAccountBehavior>{ $internalAccountBehavior/@* , $internalAccountBehavior/node() }</internalAccountBehavior>
                    }
                    <ExceptionBusinessCollection>{ $input_Parameters1/exceptionBusinessCollection/@* , $input_Parameters1/exceptionBusinessCollection/node() }</ExceptionBusinessCollection>
                </ns1:DowngradeMatrixFactRequest>
            </ns3:parameterList>
        </ns3:callFunctionStateless>
};

declare variable $input_Parameters1 as element(ns2:Input_Parameters) external;

xf:downgradeMatrix_Req($input_Parameters1)

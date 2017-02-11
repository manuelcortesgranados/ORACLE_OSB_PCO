(:: pragma bea:global-element-parameter parameter="$input_Parameters1" element="ns3:Input_Parameters" location="../Schemas/PS_CREDITEXCEPTIONS.xsd" ::)
(:: pragma bea:global-element-return element="ns1:callFunctionStateless" location="../Schemas/BR_CREDITEXCEPTIONS_MESSAGETYPES.xsd" ::)

declare namespace ns2 = "http://www.claro.com.co/rulesEngine/canonicalModel/CommonBusinessEntities";
declare namespace ns1 = "http://xmlns.oracle.com/CreditExceptions/DS_CreditExceptions";
declare namespace ns4 = "http://xmlns.oracle.com/bpel";
declare namespace ns3 = "http://www.claro.com.co/rulesEngine/creditExceptions";
declare namespace ns0 = "http://www.claro.com.co/rulesEngine/CreditExceptionssFact/";
declare namespace xf = "http://tempuri.org/RulesEngine/Rules/Resources/XQueries/creditExceptions_Req/";

declare function xf:creditExceptions_Req($input_Parameters1 as element(ns3:Input_Parameters))
    as element(ns1:callFunctionStateless) {
        <ns1:callFunctionStateless name = "DS_CreditExceptions">
            <ns1:parameterList>
                <ns0:CreditExceptionsFactRequest>
                    <ExceptionBusinessCollection>{ $input_Parameters1/exceptionBusinessCollection/@* , $input_Parameters1/exceptionBusinessCollection/node() }</ExceptionBusinessCollection>
                </ns0:CreditExceptionsFactRequest>
            </ns1:parameterList>
        </ns1:callFunctionStateless>
};

declare variable $input_Parameters1 as element(ns3:Input_Parameters) external;

xf:creditExceptions_Req($input_Parameters1)

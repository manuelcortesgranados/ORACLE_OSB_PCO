(:: pragma bea:global-element-parameter parameter="$input_Parameters1" element="ns1:Input_Parameters" location="../Schemas/PS_INSERT_CREDIT_EXCEPTION_INTER.xsd" ::)
(:: pragma bea:global-element-return element="ns0:InputParameters" location="../Schemas/BD_INSERT_CREDIT_EXCEPTION.xsd" ::)

declare namespace ns2 = "http://www.claro.com.co/rulesEngine/canonicalModel/CommonBusinessEntities";
declare namespace ns1 = "http://www.claro.com.co/rulesEngine/insertCreditExceptions";
declare namespace ns0 = "http://xmlns.oracle.com/pcbpel/adapter/db/sp/insertCreditException";
declare namespace xf = "http://tempuri.org/RulesEngine/Core/Resources/XQueries/insertCreditExceptions_Req/";

declare function xf:insertCreditExceptions_Req($input_Parameters1 as element(ns1:Input_Parameters))
    as element(ns0:InputParameters) {
        <ns0:InputParameters>
            {
                
                    <ns0:P_CREDIT_EXCEPTION>{ $input_Parameters1/node() }</ns0:P_CREDIT_EXCEPTION>
            }
        </ns0:InputParameters>
}; 

declare variable $input_Parameters1 as element(ns1:Input_Parameters) external;

xf:insertCreditExceptions_Req($input_Parameters1)
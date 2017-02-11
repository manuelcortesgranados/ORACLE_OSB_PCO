(:: pragma bea:global-element-parameter parameter="$outputParameters1" element="ns1:OutputParameters" location="../Schemas/BD_INSERT_CREDIT_EXCEPTION.xsd" ::)
(:: pragma bea:global-element-return element="ns0:WS_Result" location="../Schemas/PS_INSERT_CREDIT_EXCEPTION.xsd" ::)

declare namespace ns1 = "http://xmlns.oracle.com/pcbpel/adapter/db/sp/insertCreditException";
declare namespace ns0 = "http://www.claro.com.co/rulesEngine/insertCreditExceptions";
declare namespace xf = "http://tempuri.org/RulesEngine/Core/Resources/XQueries/insertCreditException_Res/";

declare function xf:insertCreditException_Res($outputParameters1 as element(ns1:OutputParameters))
    as element(ns0:WS_Result) {
        <ns0:WS_Result>
            <code>1</code>
            <message>
            </message>
            <description>Operacion ejecutada</description>
        </ns0:WS_Result>
};

declare variable $outputParameters1 as element(ns1:OutputParameters) external;

xf:insertCreditException_Res($outputParameters1)
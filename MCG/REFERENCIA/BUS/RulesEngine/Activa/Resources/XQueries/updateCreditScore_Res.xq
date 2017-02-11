(:: pragma bea:global-element-parameter parameter="$outputParameters1" element="ns0:OutputParameters" location="../Schemas/BD_UPDATE_CREDITSCORE.xsd" ::)
(:: pragma bea:global-element-return element="ns1:WS_Result" location="../Schemas/PS_UPDATE_CREDITSCORE.xsd" ::)

declare namespace ns1 = "http://www.claro.com.co/rulesEngine/updateCreditScore";
declare namespace ns0 = "http://xmlns.oracle.com/pcbpel/adapter/db/sp/bd_updateCreditScore";
declare namespace xf = "http://tempuri.org/RulesEngine/Activa/Resources/XQueries/updateCreditScore_Res/";

declare function xf:updateCreditScore_Res($outputParameters1 as element(ns0:OutputParameters))
    as element(ns1:WS_Result) {
        <ns1:WS_Result>
            <code>1</code>
            <description>Operacion Ejecutada</description>
        </ns1:WS_Result>
};

declare variable $outputParameters1 as element(ns0:OutputParameters) external;

xf:updateCreditScore_Res($outputParameters1)

(:: pragma bea:global-element-parameter parameter="$outputParameters1" element="ns1:OutputParameters" location="../Schemas/BD_INSERT_EXTERNALCREDITINFORMATION.xsd" ::)
(:: pragma bea:global-element-return element="ns0:WS_Result" location="../Schemas/PS_INSERT_EXTERNALCREDITINFORMATION.xsd" ::)

declare namespace ns1 = "http://xmlns.oracle.com/pcbpel/adapter/db/RULESENGINEDEV/PKG_RULESENGINE/PRC_INSERT_EXT_CREDIT_INFO_XML/";
declare namespace ns0 = "http://www.claro.com.co/rulesEngine/insertExternalCreditInformation";
declare namespace xf = "http://tempuri.org/RulesEngine/Core/Resources/XQueries/insertExternalCreditInformation_Res/";

declare function xf:insertExternalCreditInformation_Res($outputParameters1 as element(ns1:OutputParameters))
    as element(ns0:WS_Result) {
        <ns0:WS_Result>
            <code>1</code>
            <message>
                <P_SUCCESS>{ data($outputParameters1/ns1:P_SUCCESS) }</P_SUCCESS>
            </message>
            <description>Operacion Ejecutada</description>
        </ns0:WS_Result>
};

declare variable $outputParameters1 as element(ns1:OutputParameters) external;

xf:insertExternalCreditInformation_Res($outputParameters1)

(:: pragma bea:global-element-parameter parameter="$outputParameters1" element="ns2:OutputParameters" location="../Schemas/BD_GET_INTERNALINFOEVIDENT.xsd" ::)
(:: pragma bea:global-element-return element="ns0:WS_Result" location="../Schemas/PS_GET_INTERNALEVIDENTINFORMATION.xsd" ::)

declare namespace ns2 = "http://xmlns.oracle.com/pcbpel/adapter/db/INH_MOTORREGLAS/PKG_RULESENGINE_ACTIVA/PRC_GET_INTERNALINFOEVIDENT/";
declare namespace ns1 = "http://www.claro.com.co/rulesEngine/canonicalModel/CustomerDomain";
declare namespace ns0 = "http://www.claro.com.co/rulesEngine/getInternalEvidentInformation";
declare namespace xf = "http://tempuri.org/RulesEngine/Activa/Resources/XQueries/getInternalEvidentInformation_Res/";

declare function xf:getInternalEvidentInformation_Res($outputParameters1 as element(ns2:OutputParameters))
    as element(ns0:WS_Result) {
        <ns0:WS_Result>
          	<code>1</code>
            <message>
                <customerType>
                    <description>{ data($outputParameters1/ns2:P_EVIDENT_RESPONSE) }</description>
                </customerType>
            </message>
            <description>Operacion Ejecutada</description>
        </ns0:WS_Result>
};

declare variable $outputParameters1 as element(ns2:OutputParameters) external;

xf:getInternalEvidentInformation_Res($outputParameters1)
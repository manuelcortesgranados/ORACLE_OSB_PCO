(:: pragma bea:global-element-return element="ns2:WS_Result" location="../../../../../RulesEngine/Computec/Resources/Schemas/PS_GET_EXTERNALCREDITINFORMATION.xsd" ::)

declare namespace ns2 = "http://www.claro.com.co/rulesEngine/getExternalCreditInformation";
declare namespace ns1 = "http://www.claro.com.co/rulesEngine/canonicalModel/CommonBusinessEntities";
declare namespace ns0 = "http://www.claro.com.co/rulesEngine/canonicalModel/CustomerDomain";
declare namespace xf = "http://tempuri.org/RulesEngine/Dummies/Resources/XQueries/getExternalCreditInformation_Res/";

declare function xf:getExternalCreditInformation_Res($string1 as xs:string)
    as element(ns2:WS_Result) {
        <ns2:WS_Result>
            <code>1</code>
            <message>
                <customerBillingBehavior>
                    <id>1</id>
                    <code>23</code>
                    <description>Descripcion</description>
                    <creditCheckApproved>true</creditCheckApproved>
                    <scoreExpiryDate>2013-07-09</scoreExpiryDate>
                    <dateCreditBureauConsulted>2013-05-04</dateCreditBureauConsulted>
                    <creditRefNumber>8889</creditRefNumber>
                    <evidentaAlreadyValid>true</evidentaAlreadyValid>
                    <creditScoreCode>666</creditScoreCode>
                    <creditScoreDescription>Score description</creditScoreDescription>
                    <status>
                        <id>1</id>
                        <code>23</code>
                        <description>Desc</description>
                        <statusType>
                            <id>7</id>
                            <code>8887</code>
                            <description>des</description>
                        </statusType>
                    </status>
                    <highestDelayValue>1000000</highestDelayValue>
                    <timeDelayValue>5</timeDelayValue>
                    <delayValue>500000</delayValue>
                </customerBillingBehavior>
            </message>
            <description>Operacion ejecutada</description>
        </ns2:WS_Result>
};

declare variable $string1 as xs:string external;

xf:getExternalCreditInformation_Res($string1)

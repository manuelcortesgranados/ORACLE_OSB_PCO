(:: pragma bea:global-element-parameter parameter="$outputParameters1" element="ns1:OutputParameters" location="../Schemas/BD_GET_CREDIT_EXCEPTION.xsd" ::)
(:: pragma bea:global-element-return element="ns2:WS_Result" location="../Schemas/PS_GET_CREDIT_EXCEPTION.xsd" ::)

declare namespace ns2 = "http://www.claro.com.co/rulesEngine/getCreditException";
declare namespace ns1 = "http://xmlns.oracle.com/pcbpel/adapter/db/sp/getCreditExceptions";
declare namespace ns0 = "http://www.claro.com.co/rulesEngine/canonicalModel/CommonBusinessEntities";
declare namespace xf = "http://tempuri.org/RulesEngine/Core/Resources/XQueries/getCreditExceptions_Res/";

declare function xf:getCreditExceptions_Res($outputParameters1 as element(ns1:OutputParameters))
    as element(ns2:WS_Result) {
        <ns2:WS_Result>
            <code>1</code>
            <message>
            {
                 for $Column in $outputParameters1/ns1:P_LIST_EXCEPTIONS/ns1:Row/ns1:Column
                    return
                        <approvedException>
	                        <exceptionBusinessType>
                        		<description>{data($Column)}</description>
                    		</exceptionBusinessType>
                        </approvedException>
            }
            </message>
            <description>Operacion Ejecutada</description>
        </ns2:WS_Result>
};

declare variable $outputParameters1 as element(ns1:OutputParameters) external;

xf:getCreditExceptions_Res($outputParameters1)
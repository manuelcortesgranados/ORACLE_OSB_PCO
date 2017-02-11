(:: pragma bea:global-element-parameter parameter="$input_Parameters" element="ns0:Input_Parameters" location="../Schemas/PS_VALIDATE_SALESMATRIXCONDITIONS.xsd" ::)
(:: pragma bea:global-element-return element="ns0:WS_Result" location="../Schemas/PS_VALIDATE_SALESMATRIXCONDITIONS.xsd" ::)

declare namespace ns1 = "http://www.claro.com.co/rulesEngine/canonicalModel/ProductDomain";
declare namespace ns0 = "http://www.claro.com.co/rulesEngine/validateSalesMatrixConditions";
declare namespace xf = "http://tempuri.org/RulesEngine/Core/Resources/XQueries/validateSalesMatrixConditions_Res/";

declare function xf:validateSalesMatrixConditions_Res($input_Parameters as element(ns0:Input_Parameters))
    as element(ns0:WS_Result) {
        <ns0:WS_Result>
            <code>1</code>
            <message>
                <salesMatrixResult>{ $input_Parameters/salesMatrixResult/@* , $input_Parameters/salesMatrixResult/node() }</salesMatrixResult>
            </message>
            <description></description>
        </ns0:WS_Result>
};

declare variable $input_Parameters as element(ns0:Input_Parameters) external;

xf:validateSalesMatrixConditions_Res($input_Parameters)

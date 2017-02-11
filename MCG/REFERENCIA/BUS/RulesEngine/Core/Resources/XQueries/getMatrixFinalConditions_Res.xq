(:: pragma bea:global-element-parameter parameter="$input_Parameters" element="ns0:Input_Parameters" location="../Schemas/PS_GET_MATRIXFINALCONDITIONS.xsd" ::)
(:: pragma bea:global-element-return element="ns0:WS_Result" location="../Schemas/PS_GET_MATRIXFINALCONDITIONS.xsd" ::)

declare namespace ns1 = "http://www.claro.com.co/rulesEngine/canonicalModel/ProductDomain";
declare namespace ns0 = "http://www.claro.com.co/rulesEngine/getMatrixFinalConditions";
declare namespace xf = "http://tempuri.org/RulesEngine/Core/Resources/XQueries/getMatrixFinalConditions_Res/";

declare function xf:getMatrixFinalConditions_Res($input_Parameters as element(ns0:Input_Parameters))
    as element(ns0:WS_Result) {
        <ns0:WS_Result>
            <message>
                <salesMatrixResult>{ $input_Parameters/salesMatrixResult[1]/@* , $input_Parameters/salesMatrixResult[1]/node() }</salesMatrixResult>
            </message>
        </ns0:WS_Result>
};

declare variable $input_Parameters as element(ns0:Input_Parameters) external;

xf:getMatrixFinalConditions_Res($input_Parameters)

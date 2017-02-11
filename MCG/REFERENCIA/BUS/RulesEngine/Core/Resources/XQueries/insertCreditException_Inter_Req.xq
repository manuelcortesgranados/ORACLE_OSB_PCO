(:: pragma bea:global-element-parameter parameter="$input_Parameters1" element="ns0:Input_Parameters" location="../Schemas/PS_INSERT_CREDIT_EXCEPTION.xsd" ::)
(:: pragma bea:global-element-return element="ns0:Input_Parameters" location="../Schemas/PS_INSERT_CREDIT_EXCEPTION_INTER.xsd" ::)

declare namespace ns1 = "http://www.claro.com.co/rulesEngine/canonicalModel/CommonBusinessEntities";
declare namespace ns0 = "http://www.claro.com.co/rulesEngine/insertCreditExceptions";
declare namespace xf = "http://tempuri.org/RulesEngine/Core/Resources/XQueries/insertCreditException_Inter_Req/";

declare function xf:insertCreditException_Inter_Req($input_Parameters1 as element(ns0:Input_Parameters))
    as element(ns0:Input_Parameters) {
        <ns0:Input_Parameters>
            <creditException>
                <orderId>{ data($input_Parameters1/exceptionBusiness/flexibleAttributes[flexAttrName = 'orderId']/flexAttriValue) }</orderId>
                <typeException>{ data($input_Parameters1/exceptionBusiness/flexibleAttributes[flexAttrName = 'exceptionType']/flexAttriValue) }</typeException>
                {
                    for $caseId in $input_Parameters1/exceptionBusiness/caseId
                    return
                        <caseId>{ data($caseId) }</caseId>
                }
                {
                    for $cBPId in $input_Parameters1/exceptionBusiness/cBPId
                    return
                        <cBPId>{ data($cBPId) }</cBPId>
                }
                {
                    for $caseTypeLevels in $input_Parameters1/exceptionBusiness/caseTypeLevels
                    return
                        <caseTypeLevels>{ data($caseTypeLevels) }</caseTypeLevels>
                }
                {
                    for $resolutionCode1 in $input_Parameters1/exceptionBusiness/resolutionCode1
                    return
                        <resolutionCode1>{ data($resolutionCode1) }</resolutionCode1>
                }
                {
                    for $resolutionCode2 in $input_Parameters1/exceptionBusiness/resolutionCode2
                    return
                        <resolutionCode2>{ data($resolutionCode2) }</resolutionCode2>
                }
                {
                    for $description in $input_Parameters1/exceptionBusiness/closeStatus/description
                    return
                        <closeStatus>{ data($description) }</closeStatus>
                }
                {
                    for $agentId in $input_Parameters1/exceptionBusiness/agentId
                    return
                        <agentId>{ data($agentId) }</agentId>
                }
                {
                    for $flexibleAttributes in $input_Parameters1/exceptionBusiness/flexibleAttributes
                    where ($flexibleAttributes/flexAttrName != "orderId"
                           and $flexibleAttributes/flexAttrName != "exceptionType")
                    return
                        <flexibleAttributes>{ $flexibleAttributes/node() }</flexibleAttributes>
                }
                {
                    for $closeDate in $input_Parameters1/exceptionBusiness/closeDate
                    where $closeDate !=''
                    return
                        <closeDate>{ fn-bea:date-to-string-with-format("dd/MM/yyyy", xs:date(substring($closeDate, 1, 10))  ) }</closeDate>
                }
            </creditException>
        </ns0:Input_Parameters>
};

declare variable $input_Parameters1 as element(ns0:Input_Parameters) external;

xf:insertCreditException_Inter_Req($input_Parameters1)
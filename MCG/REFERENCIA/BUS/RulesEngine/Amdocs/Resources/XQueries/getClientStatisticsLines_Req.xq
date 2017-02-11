(:: pragma bea:global-element-parameter parameter="$input_Parameters1" element="ns2:Input_Parameters" location="../Schemas/PS_GET_CLIENTSTATISTICSLINES.xsd" ::)
(:: pragma bea:global-element-return element="ns3:RetrieveLineStatisticsRequest" location="../Schemas/BS_GET_CLIENTSTATISTICSLINES.xsd" ::)

declare namespace ns2 = "http://www.claro.com.co/rulesEngine/getClientStatisticsLines";
declare namespace ns1 = "http://www.claro.com.co/rulesEngine/canonicalModel/CommonBusinessEntities";
declare namespace ns3 = "http://retrievelinestatistics.performancemanagement.schema.amx.com";
declare namespace ns0 = "http://www.claro.com.co/rulesEngine/canonicalModel/CustomerDomain";
declare namespace xf = "http://tempuri.org/RulesEngine/Amdocs/Resources/XQueries/getClientStatisticsLines_Req/";

declare function xf:getClientStatisticsLines_Req($input_Parameters1 as element(ns2:Input_Parameters))
    as element(ns3:RetrieveLineStatisticsRequest) {
        <ns3:RetrieveLineStatisticsRequest>
            <ns3:RetrieveLineStatistics>
                {
                    for $identifierNumber in $input_Parameters1/customer/document/identifierNumber
                    return
                        <ns3:customerId>{ data($identifierNumber) }</ns3:customerId>
                }
            </ns3:RetrieveLineStatistics>
        </ns3:RetrieveLineStatisticsRequest>
};

declare variable $input_Parameters1 as element(ns2:Input_Parameters) external;

xf:getClientStatisticsLines_Req($input_Parameters1)

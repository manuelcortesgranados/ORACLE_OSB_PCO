(:: pragma bea:global-element-parameter parameter="$contractsSearchResponse1" element="ns2:contractsSearchResponse" location="../Schemas/PS_ITEL_ECMS_CONTRACTSSEARCH.xsd" ::)
(:: pragma bea:global-element-return element="ns0:contractWriteRequest" location="../Schemas/PS_ITEL_ECMS_CONTRACTWRITE.xsd" ::)

declare namespace ns0 = "http://ericsson.com/services/ws_cma3/contractwrite";
declare namespace ns2 = "http://ericsson.com/services/ws_cma3/contractssearch";
declare namespace ns1 = "http://ericsson.com/services/ws_cma3/sessionchange";
declare namespace xf = "http://tempuri.org/ITEL/OCS/SOI/Resources/XQueries/eliminarSubscriptorECMS/";

declare function xf:eliminarSubscriptorECMS($contractsSearchResponse1 as element(ns2:contractsSearchResponse))
    as element(ns0:contractWriteRequest) {
        <ns0:contractWriteRequest>
            <ns0:inputAttributes>
                <ns0:modifyContractInput>
                    <ns0:contract>
                        {
                            for $coId in $contractsSearchResponse1/ns2:contracts/ns2:item[1]/ns2:coId
                            return
                                <ns0:privateKey>{ data($coId) }</ns0:privateKey>
                        }
                    </ns0:contract>
                    <ns0:status>{ data("4") }</ns0:status>
                    <ns0:statusChangeReason>{ data("3") }</ns0:statusChangeReason>
                </ns0:modifyContractInput>
            </ns0:inputAttributes>
            <ns0:sessionChangeRequest>
                <ns1:values>
                    <ns1:item>
                        <ns1:key>{ data("BU_ID") }</ns1:key>
                        <ns1:value>{ data("2") }</ns1:value>
                    </ns1:item>
                </ns1:values>
            </ns0:sessionChangeRequest>
        </ns0:contractWriteRequest>
};

declare variable $contractsSearchResponse1 as element(ns2:contractsSearchResponse) external;

xf:eliminarSubscriptorECMS($contractsSearchResponse1)

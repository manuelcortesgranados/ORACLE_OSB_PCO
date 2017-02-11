(:: pragma bea:global-element-return element="ns2:contractsSearchRequest" location="../Schemas/PS_ITEL_ECMS_CONTRACTSSEARCH.xsd" ::)

declare namespace ns0 = "http://www.comcel.com.co/EliminarSuscriptorOCS/";
declare namespace ns2 = "http://ericsson.com/services/ws_cma3/contractssearch";
declare namespace ns1 = "http://ericsson.com/services/ws_cma3/sessionchange";
declare namespace xf = "http://tempuri.org/ITEL/OCS/SOI/Resources/XQueries/consultarSuscriptorECMS/";

declare function xf:consultarSuscriptorECMS($min as xs:string)
    as element(ns2:contractsSearchRequest) {
        <ns2:contractsSearchRequest>
            <ns2:inputAttributes>
                <ns2:searcher>{ data("ContractSearchWithoutHistory") }</ns2:searcher>
                <ns2:dirnum>{ data($min) }</ns2:dirnum>
            </ns2:inputAttributes>
            <ns2:sessionChangeRequest> 
				<ns1:values> 
					<ns1:item>						 
						<ns1:key>{ data("BU_ID") }</ns1:key>
						<ns1:value>{ data("2") }</ns1:value>
					</ns1:item>
				</ns1:values>
			</ns2:sessionChangeRequest>
        </ns2:contractsSearchRequest>
};

declare variable $min as xs:string external; 

xf:consultarSuscriptorECMS($min)


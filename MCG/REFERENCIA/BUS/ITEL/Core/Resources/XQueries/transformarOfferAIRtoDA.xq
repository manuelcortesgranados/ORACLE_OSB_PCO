(:: pragma bea:global-element-parameter parameter="$consultarBalancesResult" element="ns0:WS_Result" location="../../../OCS/AIR/Resources/Schemas/PS_ITEL_CONSULTAR_BALANCES.xsd" ::)
(:: pragma bea:global-element-parameter parameter="$consultarOfferResult" element="ns2:WS_Result" location="../../../OCS/AIR/Resources/Schemas/PS_ITEL_CONSULTAR_OFFER.xsd" ::)
(:: pragma bea:global-element-return element="ns0:WS_Result" location="../../../OCS/AIR/Resources/Schemas/PS_ITEL_CONSULTAR_BALANCES.xsd" ::)

declare namespace ns2 = "http://www.comcel.com.co/ConsultarOfferOCS/";
declare namespace ns1 = "http://www.comcel.com.co/OCS/OperacionOCS_AIR";
declare namespace ns0 = "http://www.comcel.com.co/ConsultarBalancesOCS/";
declare namespace xf = "http://tempuri.org/ITEL/Core/Resources/XQueries/transformarOfferAIRtoDA/";

declare function xf:transformarOfferAIRtoDA($consultarBalancesResult as element(ns0:WS_Result),
    $consultarOfferResult as element(ns2:WS_Result))
    as element(ns0:WS_Result) {
        <ns0:WS_Result>
            <CODIGO>{ data($consultarOfferResult/CODIGO) }</CODIGO>
            <MENSAJE>
                <CONSULTAR_BALANCES>
                    {
                        for $MethodResponse in $consultarBalancesResult/MENSAJE/CONSULTAR_BALANCES/*:MethodResponse
                        return
                            <MethodResponse>
                                {
                                    for $accountValue in $MethodResponse/*:accountValue
                                    return
                                        <accountValue>{ data($accountValue) }</accountValue>
                                }
                                {
                                    for $expiryDate in $MethodResponse/*:expiryDate
                                    return
                                        <ns1:expiryDate>{ data($expiryDate) }</ns1:expiryDate>
                                }
                                {
                                    for $serviceClass in $MethodResponse/*:serviceClass
                                    return
                                        <ns1:serviceClass>{ data($serviceClass) }</ns1:serviceClass>
                                }
                                {
                                   
                                        <DedicatedAccounts>{
                                        
                                        	for $DedicateAccounts in $MethodResponse/*:DedicatedAccounts
                                        	return
                                             $DedicateAccounts/*:Detail
                                             }
                                            {for $Offers in $consultarOfferResult/*:MENSAJE/*:CONSULTAR_OFFER/*:offerInformationList/*:Detail
                                            	return
                                            	if( not(contains($MethodResponse/*:DedicatedAccounts, data($Offers/*:offerType)))) then
	                                            	<Detail>
	                                            		<Name>{ data($Offers/*:offerType) }</Name>
	                                            		<Balance>{ "0" }</Balance>
	                                            		<ExpiryDate>{ data($Offers/*:expiryDate) }</ExpiryDate>
	                                            		<UnitType>{ data($Offers/*:offerID) }</UnitType>
	                                            	</Detail>
	                                            else
	                                            ()
                                            	
                                        }</DedicatedAccounts>
                                }
                                {
                                    for $OfferInformationList in $MethodResponse/*:OfferInformationList
                                    return
                                        <OfferInformationList>
                                            <Detail>{ $OfferInformationList/*:Detail/@* , $OfferInformationList/*:Detail/node() }</Detail>
                                        </OfferInformationList>
                                }
                            </MethodResponse>
                    }
                </CONSULTAR_BALANCES>
            </MENSAJE>
            <DESCRIPCION>{ data($consultarOfferResult/DESCRIPCION) }</DESCRIPCION>
        </ns0:WS_Result>
};

declare variable $consultarBalancesResult as element(ns0:WS_Result) external;
declare variable $consultarOfferResult as element(ns2:WS_Result) external;

xf:transformarOfferAIRtoDA($consultarBalancesResult,
    $consultarOfferResult)

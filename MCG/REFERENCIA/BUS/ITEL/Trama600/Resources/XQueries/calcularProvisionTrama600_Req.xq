(:: pragma bea:global-element-parameter parameter="$input_Parameters1" element="ns3:Input_Parameters" location="../Schemas/PS_ITEL_CALCULARPROVISIONTRAMA600.xsd" ::)
(:: pragma bea:global-element-return element="ns1:callFunctionStateless" location="../WSDLs/trama600Provision_DB.wsdl" ::)

declare namespace ns2 = "http://xmlns.oracle.com/bpel";
declare namespace ns1 = "http://xmlns.oracle.com/Trama600Provision/Trama600Provision_DF_Trama600Provision";
declare namespace ns3 = "http://www.comcel.com.co/CalcularProvisionTrama600/";
declare namespace ns0 = "http://www.comcel.com.co/Ejecutador/";
declare namespace xf = "http://tempuri.org/ITEL/Trama600/Resources/XQueries/calcularProvisionTrama600_Req/";

declare function xf:AIRDateConverter() as xs:string{
	fn-bea:dateTime-to-string-with-format("yyyyMMdd'T'HH:mm:ss-0500", fn:current-dateTime())
};

declare function xf:getSuscriptor($input_Parameters1 as element(ns3:Input_Parameters)){
	let $SUSCRIPTOR := $input_Parameters1/*:SUSCRIPTOR
    return
    <ns0:SUSCRIPTOR>
        <ns0:CUSTOMERID>{ data($SUSCRIPTOR/*:CUSTOMERID) }</ns0:CUSTOMERID>
        <ns0:Cgpa>{ data($SUSCRIPTOR/*:Cgpa) }</ns0:Cgpa>
        <ns0:Contract>{ data($SUSCRIPTOR/*:Contract) }</ns0:Contract>
        <ns0:IsLocked>{ data($SUSCRIPTOR/*:IsLocked) }</ns0:IsLocked>
        <ns0:IsFraudLocked>{ data($SUSCRIPTOR/*:IsFraudLocked) }</ns0:IsFraudLocked>
        <ns0:IsFirstCallPassed>{ data($SUSCRIPTOR/*:IsFirstCallPassed) }</ns0:IsFirstCallPassed>
        <ns0:IsGPRSUsed>{ data($SUSCRIPTOR/*:IsGPRSUsed) }</ns0:IsGPRSUsed>
        <ns0:IsWelcomeBackPromoDone>{ data($SUSCRIPTOR/*:IsWelcomeBackPromoDone) }</ns0:IsWelcomeBackPromoDone>
        <ns0:IsFnFPossible>{ data($SUSCRIPTOR/*:IsFnFPossible) }</ns0:IsFnFPossible>
        <ns0:IsMLCPossible>{ data($SUSCRIPTOR/*:IsMLCPossible) }</ns0:IsMLCPossible>
        {
            let $FnF_Numbers := $SUSCRIPTOR/*:FnF_Numbers
            return
                <ns0:FnF_Numbers>
                    {
                        for $Detail in $FnF_Numbers/*:Detail
                        return
                            <ns0:Detail>{ data($Detail) }</ns0:Detail>
                    }
                </ns0:FnF_Numbers>
        }
        <ns0:IsBestFnFPossible>{ data($SUSCRIPTOR/*:IsBestFnFPossible) }</ns0:IsBestFnFPossible>
        {
            let $BestFnF_Numbers := $SUSCRIPTOR/*:BestFnF_Numbers
            return
                <ns0:BestFnF_Numbers>
                    {
                        for $Detail in $BestFnF_Numbers/*:Detail
                        return
                            <ns0:Detail>{ data($Detail) }</ns0:Detail>
                    }
                </ns0:BestFnF_Numbers>
        }
        {
            let $SMSOnNet_Numbers := $SUSCRIPTOR/*:SMSOnNet_Numbers
            return
                <ns0:SMSOnNet_Numbers>
                    {
                        for $Detail in $SMSOnNet_Numbers/*:Detail
                        return
                            <ns0:Detail>{ data($Detail) }</ns0:Detail>
                    }
                </ns0:SMSOnNet_Numbers>
        }
        <ns0:SMSOnNet_ExpirationDate>{ data($SUSCRIPTOR/*:SMSOnNet_ExpirationDate) }</ns0:SMSOnNet_ExpirationDate>
        {
            let $SMSOffNet_Numbers := $SUSCRIPTOR/*:SMSOffNet_Numbers
            return
                <ns0:SMSOffNet_Numbers>
                    {
                        for $Detail in $SMSOffNet_Numbers/*:Detail
                        return
                            <ns0:Detail>{ data($Detail) }</ns0:Detail>
                    }
                </ns0:SMSOffNet_Numbers>
        }
        <ns0:SMSOffNet_ExpirationDate>{ data($SUSCRIPTOR/*:SMSOffNet_ExpirationDate) }</ns0:SMSOffNet_ExpirationDate>
        {
            let $SMSAny_Numbers := $SUSCRIPTOR/*:SMSAny_Numbers
            return
                <ns0:SMSAny_Numbers>
                    {
                        for $Detail in $SMSAny_Numbers/*:Detail
                        return
                            <ns0:Detail>{ data($Detail) }</ns0:Detail>
                    }
                </ns0:SMSAny_Numbers>
        }
        <ns0:SMSAny_ExpirationDate>{ data($SUSCRIPTOR/*:SMSAny_ExpirationDate) }</ns0:SMSAny_ExpirationDate>
        <ns0:IsFAPossible>{ data($SUSCRIPTOR/*:IsFAPossible) }</ns0:IsFAPossible>
        <ns0:FA_ActivationEndTime>{ data($SUSCRIPTOR/*:FA_ActivationEndTime) }</ns0:FA_ActivationEndTime>
        {
            let $FA_Destination := $SUSCRIPTOR/*:FA_Destination
            return
        		<ns0:FA_Destination>
        			{
                        for $Detail in $FA_Destination/*:Detail
                        return
                            <ns0:Detail>{ data($Detail) }</ns0:Detail>
                    }
        		</ns0:FA_Destination>
		}
        {
            let $OnPeakAccountID := $SUSCRIPTOR/*:OnPeakAccountID
            return
                <ns0:OnPeakAccountID>
                    <ns0:Balance>{ data($OnPeakAccountID/*:Balance) }</ns0:Balance>
                    <ns0:ExpiryDate>{ data($OnPeakAccountID/*:ExpiryDate) }</ns0:ExpiryDate>
                </ns0:OnPeakAccountID>
        }
        {
            let $OffPeakAccountID := $SUSCRIPTOR/*:OffPeakAccountID
            return
                <ns0:OffPeakAccountID>
                    <ns0:Balance>{ data($OffPeakAccountID/*:Balance) }</ns0:Balance>
                    <ns0:ExpiryDate>{ data($OffPeakAccountID/*:ExpiryDate) }</ns0:ExpiryDate>
                </ns0:OffPeakAccountID>
        }
        {
            let $FreeSMSAccountID := $SUSCRIPTOR/*:FreeSMSAccountID
            return
                <ns0:FreeSMSAccountID>
                    <ns0:Balance>{ data($FreeSMSAccountID/*:Balance) }</ns0:Balance>
                    <ns0:ExpiryDate>{ data($FreeSMSAccountID/*:ExpiryDate) }</ns0:ExpiryDate>
                </ns0:FreeSMSAccountID>
        }
        {
            let $BonusAccountID := $SUSCRIPTOR/*:BonusAccountID
            return
                <ns0:BonusAccountID>
                    <ns0:Balance>{ data($BonusAccountID/*:Balance) }</ns0:Balance>
                    <ns0:ExpiryDate>{ data($BonusAccountID/*:ExpiryDate) }</ns0:ExpiryDate>
                </ns0:BonusAccountID>
        }
        {
            let $MinutesAccountID2 := $SUSCRIPTOR/*:MinutesAccountID2
            return
                <ns0:MinutesAccountID2>
                    <ns0:Balance>{ data($MinutesAccountID2/*:Balance) }</ns0:Balance>
                    <ns0:ExpiryDate>{ data($MinutesAccountID2/*:ExpiryDate) }</ns0:ExpiryDate>
                </ns0:MinutesAccountID2>
        }
        {
            let $MinutesAccountID3 := $SUSCRIPTOR/*:MinutesAccountID3
            return
                <ns0:MinutesAccountID3>
                    <ns0:Balance>{ data($MinutesAccountID3/*:Balance) }</ns0:Balance>
                    <ns0:ExpiryDate>{ data($MinutesAccountID3/*:ExpiryDate) }</ns0:ExpiryDate>
                </ns0:MinutesAccountID3>
        }
        {
            let $MinutesAccountID4 := $SUSCRIPTOR/*:MinutesAccountID4
            return
                <ns0:MinutesAccountID4>
                    <ns0:Balance>{ data($MinutesAccountID4/*:Balance) }</ns0:Balance>
                    <ns0:ExpiryDate>{ data($MinutesAccountID4/*:ExpiryDate) }</ns0:ExpiryDate>
                </ns0:MinutesAccountID4>
        }
        {
            let $MonetaryAccountID2 := $SUSCRIPTOR/*:MonetaryAccountID2
            return
                <ns0:MonetaryAccountID2>
                    <ns0:Balance>{ data($MonetaryAccountID2/*:Balance) }</ns0:Balance>
                    <ns0:ExpiryDate>{ data($MonetaryAccountID2/*:ExpiryDate) }</ns0:ExpiryDate>
                </ns0:MonetaryAccountID2>
        }
        {
            let $MonetaryAccountID3 := $SUSCRIPTOR/*:MonetaryAccountID3
            return
                <ns0:MonetaryAccountID3>
                    <ns0:Balance>{ data($MonetaryAccountID3/*:Balance) }</ns0:Balance>
                    <ns0:ExpiryDate>{ data($MonetaryAccountID3/*:ExpiryDate) }</ns0:ExpiryDate>
                </ns0:MonetaryAccountID3>
        }
        <ns0:PreActiveEndDate>{ data($SUSCRIPTOR/*:PreActiveEndDate) }</ns0:PreActiveEndDate>
        <ns0:LastKnownPeriod>{ data($SUSCRIPTOR/*:LastKnownPeriod) }</ns0:LastKnownPeriod>
        <ns0:ActiveEndDate>{ data($SUSCRIPTOR/*:ActiveEndDate) }</ns0:ActiveEndDate>
        <ns0:GraceEndDate>{ data($SUSCRIPTOR/*:GraceEndDate) }</ns0:GraceEndDate>
        <ns0:BestFnF_ActivationEndTime>{ data($SUSCRIPTOR/*:BestFnF_ActivationEndTime) }</ns0:BestFnF_ActivationEndTime>
    </ns0:SUSCRIPTOR>
	
};

declare function xf:obtenerFafLists($input_Parameters1 as element(ns3:Input_Parameters)){
	let $faflists := $input_Parameters1/SUSCRIPTOR_OCS/FAF_LIST/*:fafInformationList/*:Detail	
	for $list in $faflists
	return
		<ns0:FAFLIST>
			<ns0:FAFID>{$list/*:fafIndicator/text()}</ns0:FAFID>
			<ns0:EXPIRYDATE>{$list/*:expiryDate/text()}</ns0:EXPIRYDATE>
			<ns0:ELEGIDOS>
			{
				let $elegidos := $list/*:DetailNumber/*:fafNumber
				for $elegido in $elegidos
				return
					<ns0:Detail>{$elegido/text()}</ns0:Detail> 
			} 
			</ns0:ELEGIDOS>
		</ns0:FAFLIST>
};

declare function xf:obtenerOffers($input_Parameters1 as element(ns3:Input_Parameters)){
	let $offers := $input_Parameters1/SUSCRIPTOR_OCS/DATOS_SUSCRIPCION/*:productName
	return
	<ns0:OFFERSNAME>
	{
		for $offer in $offers
		return
		<ns0:Detail>{$offer/text()}</ns0:Detail>
	}
	</ns0:OFFERSNAME>
};

declare function xf:obtenerBalances($input_Parameters1 as element(ns3:Input_Parameters)){
	let $balances := $input_Parameters1/SUSCRIPTOR_OCS/BALANCES/*:DedicatedAccounts/*:Detail	
	for $balance in $balances
	return
		<ns0:ACCOUNT>
			<ns0:AccountID>{$balance/*:Name/text()}</ns0:AccountID>
			<ns0:Balance>{$balance/*:Balance/text()}</ns0:Balance>
			<ns0:ExpiryDate>{$balance/*:ExpiryDate/text()}</ns0:ExpiryDate>
			<ns0:UnitType>{$balance/*:UnitType/text()}</ns0:UnitType>
		</ns0:ACCOUNT>
};

declare function xf:getSuscriptorOCS($input_Parameters1 as element(ns3:Input_Parameters)){
	let $faflists := xf:obtenerFafLists($input_Parameters1)
	let $balances := xf:obtenerBalances($input_Parameters1)
	let $offers := xf:obtenerOffers($input_Parameters1)
	return
	<ns0:SUSCRIPTOROCS>
		 <ns0:AccountGroupID>{$input_Parameters1/PARAMETROSTRAMA/PARAMETRO[NOMBRE='ACC_GRP_ID']/VALOR/text()}</ns0:AccountGroupID>
         <ns0:AddressRoles></ns0:AddressRoles>
         <ns0:AddressSeq></ns0:AddressSeq>
         <ns0:PublicContractID>{$input_Parameters1/PARAMETROSTRAMA/PARAMETRO[NOMBRE='CONTRATO']/VALOR/text()}</ns0:PublicContractID>
         <ns0:ContractType></ns0:ContractType>
         <ns0:CustomerStatus></ns0:CustomerStatus>
         <ns0:DirectoryNumber>{$input_Parameters1/*:MINDESTINO/text()}</ns0:DirectoryNumber>
         <ns0:PublicIVRLanguage></ns0:PublicIVRLanguage>
         <ns0:PublicMarketCode></ns0:PublicMarketCode>
         <ns0:PartyRoleSHName></ns0:PartyRoleSHName>
         <ns0:PartyType></ns0:PartyType>
         <ns0:PaymentResponsibility></ns0:PaymentResponsibility>
         <ns0:PortNumber></ns0:PortNumber>
         <ns0:PublicNetworkId></ns0:PublicNetworkId>
         <ns0:PublicSubMarketCode></ns0:PublicSubMarketCode>
         <ns0:ReasonCode></ns0:ReasonCode>
         <ns0:SdpID>{$input_Parameters1/PARAMETROSTRAMA/PARAMETRO[NOMBRE='SDP']/VALOR/text()}</ns0:SdpID>
         <ns0:StorageMediumNumber></ns0:StorageMediumNumber>
         <ns0:TemporaryBlocked>{$input_Parameters1/PARAMETROSTRAMA/PARAMETRO[NOMBRE='TEMPORARY_BLOCKED']/VALOR/text()}</ns0:TemporaryBlocked>
         <ns0:FAFLISTS>
         	<ns0:SIZE>{count($faflists[string(.)])}</ns0:SIZE>
	         {
	         	$faflists
	         }
         </ns0:FAFLISTS>
         <ns0:BALANCES>
         	{if(empty($input_Parameters1/SUSCRIPTOR_OCS/BALANCES/*:DedicatedAccounts/*:Detail[Name='7000']))
         	then
         	<ns0:SIZE>{count($balances[string(.)])+2}</ns0:SIZE>
         	else
         	<ns0:SIZE>{count($balances[string(.)])+1}</ns0:SIZE>
         	}
	         {
	         	$balances
	         }
	         {if(empty($input_Parameters1/SUSCRIPTOR_OCS/BALANCES/*:DedicatedAccounts/*:Detail[Name='7000']))
	         then
	         <ns0:ACCOUNT>
				<ns0:AccountID>7000</ns0:AccountID>
				<ns0:Balance>{0}</ns0:Balance>
				<ns0:ExpiryDate>{xf:AIRDateConverter()}</ns0:ExpiryDate>
				<ns0:UnitType>{1}</ns0:UnitType>
			</ns0:ACCOUNT>
	         else ()
			}
	         {if(empty($input_Parameters1/SUSCRIPTOR_OCS/BALANCES/*:accountValue))
	         then
	         <ns0:ACCOUNT>
				<ns0:AccountID>0</ns0:AccountID>
				<ns0:Balance>{0}</ns0:Balance>
				<ns0:ExpiryDate>{xf:AIRDateConverter()}</ns0:ExpiryDate>
				<ns0:UnitType>{1}</ns0:UnitType>
			</ns0:ACCOUNT>
	         else
	         <ns0:ACCOUNT>
				<ns0:AccountID>0</ns0:AccountID>
				<ns0:Balance>{$input_Parameters1/SUSCRIPTOR_OCS/BALANCES/*:accountValue/text()}</ns0:Balance>
				<ns0:ExpiryDate>{$input_Parameters1/SUSCRIPTOR_OCS/BALANCES/*:expiryDate/text()}</ns0:ExpiryDate>
				<ns0:UnitType>{1}</ns0:UnitType>
			</ns0:ACCOUNT>
			}
         </ns0:BALANCES>
         <ns0:OFFERS>
         	<ns0:SIZE>{count($offers[string(.)])}</ns0:SIZE>
         	{
         		$offers
         	}
         </ns0:OFFERS>
         <ns0:CHOSENSIZE>0</ns0:CHOSENSIZE>
	</ns0:SUSCRIPTOROCS>
};

declare function xf:calcularProvisionTrama600_Req($input_Parameters1 as element(ns3:Input_Parameters))
    as element(ns1:callFunctionStateless) {
        <ns1:callFunctionStateless name = "Trama600Provision_DF_Trama600Provision">
            <ns1:parameterList>
                <ns0:TRAMA_EJECUCION>
                    <ns0:MINORIGEN>{ xs:decimal($input_Parameters1/*:MINORIGEN) }</ns0:MINORIGEN>
                    <ns0:MINDESTINO>{ xs:decimal($input_Parameters1/*:MINDESTINO) }</ns0:MINDESTINO>
                    {
                    	xf:getSuscriptor($input_Parameters1)
                    }
                    {
                    	xf:getSuscriptorOCS($input_Parameters1)
                    }
                    <ns0:CODIGOPLATAFORMAORIGEN>{ data($input_Parameters1/*:CODIGOINDORIGEN) }</ns0:CODIGOPLATAFORMAORIGEN>
                    <ns0:CODIGOPLATAFORMADESTINO>{ data($input_Parameters1/*:CODIGOINDESTINO) }</ns0:CODIGOPLATAFORMADESTINO>
                    <ns0:SERVICIOSEJECUCION/>
                    <ns0:ERROR>1</ns0:ERROR>
                </ns0:TRAMA_EJECUCION>
            </ns1:parameterList>
        </ns1:callFunctionStateless>
};

declare variable $input_Parameters1 as element(ns3:Input_Parameters) external;

xf:calcularProvisionTrama600_Req($input_Parameters1)
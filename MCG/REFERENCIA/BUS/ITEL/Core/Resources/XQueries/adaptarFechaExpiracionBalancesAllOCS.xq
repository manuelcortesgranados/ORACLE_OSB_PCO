(:: pragma bea:global-element-parameter parameter="$wS_Result1" element="ns0:WS_Result" location="../../../OCS/AIR/Resources/Schemas/PS_ITEL_CONSULTAR_BALANCES_ALL.xsd" ::)
(:: pragma bea:global-element-parameter parameter="$wS_Result2" element="ns3:WS_Result" location="../../../OCS/OLM/Resources/Schemas/PS_ITEL_CONSULTAR_SUSCRIPCION.xsd" ::)
(:: pragma bea:global-element-return element="ns0:WS_Result" location="../../../OCS/AIR/Resources/Schemas/PS_ITEL_CONSULTAR_BALANCES_ALL.xsd" ::)

declare namespace ns2 = "http://webapps.online.ericsson.com";
declare namespace ns1 = "http://www.comcel.com.co/OCS/OperacionOCS_AIR";
declare namespace ns3 = "http://www.comcel.com.co/ConsultarSuscripcionOCS/";
declare namespace ns0 = "http://www.comcel.com.co/ConsultarBalancesOCS/";
declare namespace xf = "http://tempuri.org/ITEL/Core/Resources/XQueries/adaptarFechaExpiracionBalancesOCS/";

declare function xf:calcularFechaDA($cuentaDA as xs:string, $fechaDA as xs:string, $wS_Result as element(ns3:WS_Result), $cuentasDA as xs:string) as xs:string{	
	 let $mapeoCuentas := data($cuentasDA)
	 return if (fn:contains($mapeoCuentas, $cuentaDA)) then (
		 		  let $fechaDACalculada := for $cuenta in fn:tokenize($mapeoCuentas, "\|") 
		 		 	where (fn:tokenize($cuenta, ";")[2] = $cuentaDA and data($wS_Result/MENSAJE/CONSULTAR_SUSCRIPCION/result[productName=fn:tokenize($cuenta, ";")[3]]/expiryDate) != "" and data($wS_Result/MENSAJE/CONSULTAR_SUSCRIPCION/result[productName=fn:tokenize($cuenta, ";")[3]]/subscriptionStatus) = "ACTIVE") 
		 		 		return fn-bea:dateTime-to-string-with-format("yyyyMMdd'T'HH:mm:ss+SSSS", fn-bea:dateTime-from-string-with-format("yyyyMMddHHmmss-SS:SS", data($wS_Result/MENSAJE/CONSULTAR_SUSCRIPCION/result[productName=fn:tokenize($cuenta, ";")[3]]/expiryDate)))
		 		 	return if(data($fechaDACalculada) != "") then	
		 		 		 $fechaDACalculada
		 		 	else
		 		 		 $fechaDA 
		 		)	 		 	
	 		else
	 		 	   $fechaDA	 	
																				
};

declare function xf:adaptarFechaExpiracionBalancesOCS($wS_Result1 as element(ns0:WS_Result),
    $wS_Result2 as element(ns3:WS_Result), $cuentasDA as xs:string)
    as element(ns0:WS_Result) {
        <ns0:WS_Result>
            <CODIGO>{ data($wS_Result1/CODIGO) }</CODIGO>
            <MENSAJE>
                <CONSULTAR_BALANCES>
                    <MethodResponse>                        
                        <accountValue>{ data($wS_Result1/MENSAJE/CONSULTAR_BALANCES/MethodResponse/accountValue) }</accountValue>
                        <expiryDate>{ data($wS_Result1/MENSAJE/CONSULTAR_BALANCES/MethodResponse/expiryDate) }</expiryDate>                                         
                        <DedicatedAccounts>
                            {
                                for $Detail in $wS_Result1/MENSAJE/CONSULTAR_BALANCES/MethodResponse/DedicatedAccounts/Detail
                                return
                                    <Detail>
                                        <Name>{ data($Detail/Name) }</Name>
                                        <Balance>{ data($Detail/Balance) }</Balance>
                                        <ExpiryDate>{ xf:calcularFechaDA(data($Detail/Name), data($Detail/ExpiryDate), $wS_Result2, $cuentasDA) }</ExpiryDate>
                                        <StartDate>{ xf:calcularFechaDA(data($Detail/Name), data($Detail/StartDate), $wS_Result2, $cuentasDA) }</StartDate>
                                        <UnitType>{ data($Detail/UnitType) }</UnitType>
                                    </Detail>
                            }
                        </DedicatedAccounts>
                        <OfferInformationList>
                            {
                                for $Detail in $wS_Result1/MENSAJE/CONSULTAR_BALANCES/MethodResponse/OfferInformationList/Detail where data($Detail/offerID)="2"
                                return 
                                   <Detail>
			                        	<offerID>{ data( $Detail/offerType ) }</offerID>
			                        	<offerType>{data( $Detail/offerID )}</offerType>
			                        	<startDate>{data( $Detail/startDate )}</startDate>
			                        	<expiryDate>{data( $Detail/expiryDate )}</expiryDate>
			                       </Detail>
                            }
                        </OfferInformationList>
                    </MethodResponse>
                </CONSULTAR_BALANCES>
            </MENSAJE>
            <DESCRIPCION>{ data($wS_Result1/DESCRIPCION) }</DESCRIPCION>
        </ns0:WS_Result>
};

declare variable $wS_Result1 as element(ns0:WS_Result) external;
declare variable $wS_Result2 as element(ns3:WS_Result) external;
declare variable $cuentasDA as xs:string external;

xf:adaptarFechaExpiracionBalancesOCS($wS_Result1,
    $wS_Result2, $cuentasDA)
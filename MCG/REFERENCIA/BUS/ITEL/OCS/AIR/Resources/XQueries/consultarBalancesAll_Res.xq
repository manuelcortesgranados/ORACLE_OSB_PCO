(:: pragma bea:schema-type-parameter parameter="$methodResponse1" type="ns1:methodResponse" location="../Schemas/DA_ITEL_OPERACION_OCS_TYPES.xsd" ::)
(:: pragma bea:global-element-return element="ns0:WS_Result" location="../Schemas/PS_ITEL_CONSULTAR_BALANCES_ALL.xsd" ::)

declare namespace ns2 = "http://www.comcel.com.co/OCS/OperacionOCS";
declare namespace ns1 = "http://www.comcel.com.co/OCS/OperacionTypes";
declare namespace ns0 = "http://www.comcel.com.co/ConsultarBalancesOCS/";
declare namespace xf = "http://tempuri.org/ITEL/OCS/Resources/XQueries/consultarBalances_Res/";

declare function xf:consultarBalances_Res($methodResponse1 as element(), $codigo as xs:string, $descripcion as xs:string)
    as element(ns0:WS_Result) {
        <ns0:WS_Result>
        	<CODIGO>{ $codigo }</CODIGO>
            <MENSAJE>
                <CONSULTAR_BALANCES>
                   <MethodResponse>
                   		<accountValue> { data($methodResponse1/params/param/value/struct/member[name = "accountValue1"]/value/string) }	</accountValue>	
                   		<expiryDate> { data($methodResponse1/params/param/value/struct/member[name = "supervisionExpiryDate"]/value) }	</expiryDate>
		            	<DedicatedAccounts>
		                {
		                	let $dedicatedAccounts := $methodResponse1/params/param/value/struct/member[name = "dedicatedAccountInformation"]
		                	let $dedicatedStructs:= $dedicatedAccounts/value/array/data/value/struct
		                	for $struct in $dedicatedStructs
			                    return
			                        <Detail>
			                        	<Name>{ data( $struct/member[name = "dedicatedAccountID"]/value ) }</Name>
			                        	<Balance>{data( $struct/member[name = "dedicatedAccountActiveValue1"]/value )}</Balance>
			                        	<ExpiryDate>{data( $struct/member[name = "expiryDate"]/value )}</ExpiryDate>
			                        	<StartDate>{data( $struct/member[name = "startDate"]/value )}</StartDate>
			                        	<UnitType>{data( $struct/member[name = "dedicatedAccountUnitType"]/value )}</UnitType>
			                    	</Detail>
		                }
		                </DedicatedAccounts> 
		                <OfferInformationList/> 
                    </MethodResponse>
                </CONSULTAR_BALANCES>
            </MENSAJE>
            <DESCRIPCION>{ $descripcion }</DESCRIPCION>
        </ns0:WS_Result>
};

declare variable $codigo as xs:string external;
declare variable $descripcion as xs:string external;
declare variable $methodResponse1 as element() external;

xf:consultarBalances_Res($methodResponse1, $codigo, $descripcion)
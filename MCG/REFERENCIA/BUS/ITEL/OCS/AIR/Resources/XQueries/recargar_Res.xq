(:: pragma bea:schema-type-parameter parameter="$methodResponse1" type="ns0:methodResponse" location="../Schemas/DA_ITEL_OPERACION_OCS_TYPES.xsd" ::)
(:: pragma bea:global-element-return element="ns2:WS_Result" location="../Schemas/PS_ITEL_RECARGAR.xsd" ::)

declare namespace ns2 = "http://www.comcel.com.co/RecargarOCS/";
declare namespace ns1 = "http://www.comcel.com.co/OCS/OperacionOCS";
declare namespace ns0 = "http://www.comcel.com.co/OCS/OperacionTypes";
declare namespace xf = "http://tempuri.org/ITEL/OCS/Resources/XQueries/recargar_Res/";

declare function xf:recargar_Res($methodResponse1 as element(), $codigo as xs:string,
    $descripcion as xs:string)
    as element(ns2:WS_Result) {
    	<ns2:WS_Result>
	    	<CODIGO>{ $codigo }</CODIGO>
	            <MENSAJE>
	            {
			        (
			    	if(exists($methodResponse1/params/param/value/struct/member[name = "refillInformation"])) then
				    	let $refillInformation := $methodResponse1/params/param/value/struct/member[name = "refillInformation"],
				    		$dedicatedAccountRefillInformation := $refillInformation/value/struct/member[name = "refillValuePromotion"]/value/struct/member[name = "dedicatedAccountRefillInformation"]/value/array/data,
				    		$dedicada := for $dedicatedAccount in $dedicatedAccountRefillInformation/value/struct
				    		         where exists($dedicatedAccount/member[name = "refillAmount1"]) = fn:true()
				    		         	   and data($dedicatedAccount/member[name = "dedicatedAccountID"]/value/i4) = '7000'
				    		       return $dedicatedAccount
				    	return
			                <RECARGA>
			                    <MethodResponse>
			                        <accountValue>{ data($refillInformation/value/struct/member[name = "refillValueTotal"]/value/struct/member[name = "refillAmount1"]/value/string) }</accountValue>
			                        <expiryDate> { data($refillInformation/value/struct/member[name = "refillValueTotal"]/value/struct/member[name = "supervisionDaysExtended"]/value) }	</expiryDate>
			                        <serviceClass> { data($methodResponse1/params/param/value/struct/member[name = "accountBeforeRefill"]/value/struct/member[name = "serviceClassCurrent"]/value) }	</serviceClass>
			                        <DedicatedAccounts>
			                            <Detail>
			                                <Name>{ data($dedicada/member[name = "dedicatedAccountID"]/value/i4) }</Name>
			                                <Balance>{ data($dedicada/member[name = "refillAmount1"]/value/string) }</Balance>
			                                <ExpiryDate>{ data($dedicada/member[name = "expiryDateExtended"]/value/i4) }</ExpiryDate>
			                            </Detail>
			                        </DedicatedAccounts>
			                    </MethodResponse>
			                </RECARGA>
				            
			        else 
				        	<RECARGA>
			                    <MethodResponse>
			                        <accountValue> { data($methodResponse1/params/param/value/struct/member[name = "accountAfterRefill"]/value/struct/member[name = "accountValue1"]/value/string) }	</accountValue>	
						            <expiryDate> { data($methodResponse1/params/param/value/struct/member[name = "accountAfterRefill"]/value/struct/member[name = "supervisionExpiryDate"]/value) }	</expiryDate>
						            <serviceClass> { data($methodResponse1/params/param/value/struct/member[name = "accountBeforeRefill"]/value/struct/member[name = "serviceClassCurrent"]/value) }	</serviceClass>
						        	<DedicatedAccounts>
						            {
						            	let $dedicatedAccounts := $methodResponse1/params/param/value/struct/member[name = "accountAfterRefill"]/value/struct/member[name = "dedicatedAccountInformation"]
						            	let $dedicatedStructs:= $dedicatedAccounts/value/array/data/value/struct
						            	for $struct in $dedicatedStructs
						                    return
						                        <Detail>
						                        	<Name>{ data( $struct/member[name = "dedicatedAccountID"]/value ) }</Name>
						                        	<Balance>{data( $struct/member[name = "dedicatedAccountValue1"]/value )}</Balance>
						                        	<ExpiryDate>{data( $struct/member[name = "expiryDate"]/value )}</ExpiryDate>
						                    	</Detail>
						            }
						            </DedicatedAccounts>
			                    </MethodResponse>
				             </RECARGA>
				         
				        )
				        ,
				        (
				       if(exists($methodResponse1/params/param/value/struct/member[name = "accountBeforeRefill"])) then
				       	(
				       		<ANTES_RECARGA>
			                    <MethodResponse>
			                        <accountValue> { data($methodResponse1/params/param/value/struct/member[name = "accountBeforeRefill"]/value/struct/member[name = "accountValue1"]/value/string) }	</accountValue>	
						            <expiryDate> { data($methodResponse1/params/param/value/struct/member[name = "accountBeforeRefill"]/value/struct/member[name = "supervisionExpiryDate"]/value) }	</expiryDate>
						        	<DedicatedAccounts>
						            {
						            	let $dedicatedAccounts := $methodResponse1/params/param/value/struct/member[name = "accountBeforeRefill"]/value/struct/member[name = "dedicatedAccountInformation"]
						            	let $dedicatedStructs:= $dedicatedAccounts/value/array/data/value/struct
						            	for $struct in $dedicatedStructs
						                    return
						                        <Detail>
						                        	<Name>{ data( $struct/member[name = "dedicatedAccountID"]/value ) }</Name>
						                        	<Balance>{data( $struct/member[name = "dedicatedAccountValue1"]/value )}</Balance>
						                        	<ExpiryDate>{data( $struct/member[name = "expiryDate"]/value )}</ExpiryDate>
						                    	</Detail>
						            }
						            </DedicatedAccounts>
			                    </MethodResponse>
				             </ANTES_RECARGA>
				       	)
				       else
				       	() 
				       	)
	       	
	       	}
	       	</MENSAJE>
	            <DESCRIPCION>{ $descripcion }</DESCRIPCION>
	        </ns2:WS_Result>
};

declare variable $codigo as xs:string external;
declare variable $descripcion as xs:string external;
declare variable $methodResponse1 as element() external;

xf:recargar_Res($methodResponse1, $codigo, $descripcion)
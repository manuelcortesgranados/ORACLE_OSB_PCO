(:: pragma bea:schema-type-parameter parameter="$methodResponse1" type="ns1:methodResponse" location="../Schemas/DA_ITEL_OPERACION_OCS_TYPES.xsd" ::)
(:: pragma bea:global-element-return element="ns0:WS_Result" location="../Schemas/PS_ITEL_CONSULTAR_BALANCES.xsd" ::)

declare namespace ns2 = "http://www.comcel.com.co/OCS/OperacionOCS";
declare namespace ns1 = "http://www.comcel.com.co/OCS/OperacionTypes";
declare namespace ns0 = "http://www.comcel.com.co/ConsultarDetalleCuentaOCS/";
declare namespace xf = "http://tempuri.org/ITEL/OCS/Resources/XQueries/consultarDetalleCuenta_Res/";

declare function xf:consultarDetalleCuenta_Res($methodResponse1 as element(), $codigo, $descripcion)
    as element(ns0:WS_Result) {
        <ns0:WS_Result>
        	<CODIGO>{ $codigo }</CODIGO>
            <MENSAJE>
                <CONSULTAR_DETALLE_CUENTA>
                   <MethodResponse>
                   		<activationDate> { data($methodResponse1/params/param/value/struct/member[name = "activationDate"]/value) }	</activationDate>
                   		<accountGroupID> { data($methodResponse1/params/param/value/struct/member[name = "accountGroupID"]/value/i4) }	</accountGroupID>
                   		<creditClearanceDate> { data($methodResponse1/params/param/value/struct/member[name = "creditClearanceDate"]/value) }	</creditClearanceDate>
                   		<creditClearancePeriod> { data($methodResponse1/params/param/value/struct/member[name = "creditClearancePeriod"]/value/i4) }	</creditClearancePeriod>		            	
                   		<serviceClassCurrent> { data($methodResponse1/params/param/value/struct/member[name = "serviceClassCurrent"]/value/i4) }	</serviceClassCurrent>
                   		<serviceFeeExpiryDate> { data($methodResponse1/params/param/value/struct/member[name = "serviceFeeExpiryDate"]/value) }	</serviceFeeExpiryDate>
                   		<serviceFeePeriod> { data($methodResponse1/params/param/value/struct/member[name = "serviceFeePeriod"]/value) }	</serviceFeePeriod>
                   		<serviceRemovalDate> { data($methodResponse1/params/param/value/struct/member[name = "serviceRemovalDate"]/value) }	</serviceRemovalDate>
                   		<serviceRemovalPeriod> { data($methodResponse1/params/param/value/struct/member[name = "serviceRemovalPeriod"]/value/i4) }	</serviceRemovalPeriod>
                   		<supervisionExpiryDate> { data($methodResponse1/params/param/value/struct/member[name = "supervisionExpiryDate"]/value) }	</supervisionExpiryDate>
                   		<supervisionPeriod> { data($methodResponse1/params/param/value/struct/member[name = "supervisionPeriod"]/value) }	</supervisionPeriod>
                   		<ussdEndOfCallNotificationID> { data($methodResponse1/params/param/value/struct/member[name = "ussdEndOfCallNotificationID"]/value/i4) }	</ussdEndOfCallNotificationID>
                   </MethodResponse>
                </CONSULTAR_DETALLE_CUENTA>
            </MENSAJE>
            <DESCRIPCION>{ $descripcion }</DESCRIPCION>
        </ns0:WS_Result>
};

declare variable $codigo as xs:string external;
declare variable $descripcion as xs:string external;
declare variable $methodResponse1 as element() external;

xf:consultarDetalleCuenta_Res($methodResponse1, $codigo, $descripcion)
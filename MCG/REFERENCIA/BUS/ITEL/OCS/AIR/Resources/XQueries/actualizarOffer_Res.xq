xquery version "1.0" encoding "Cp1252";
(:: pragma bea:schema-type-parameter parameter="$methodResponse1" type="ns1:methodResponse" location="../Schemas/DA_ITEL_OPERACION_OCS_TYPES.xsd" ::)
(:: pragma bea:global-element-return element="ns2:WS_Result" location="../Schemas/PS_ITEL_ACTUALIZAR_OFFER.xsd" ::)

declare namespace xf = "http://tempuri.org/ITEL/OCS/AIR/Resources/XQueries/actualizarOffer_Res/";
declare namespace ns2 = "http://www.comcel.com.co/ActualizarOfferOCS/";
declare namespace ns1 = "http://www.comcel.com.co/OCS/OperacionTypes";
declare namespace ns0 = "http://www.comcel.com.co/OCS/OperacionOCS_AIR";

declare function xf:actualizarOffer_Res($methodResponse1 as element(), $codigo as xs:string, $descripcion as xs:string)
    as element(ns2:WS_Result) {
        <ns2:WS_Result>
           <CODIGO>{ $codigo }</CODIGO>
           <MENSAJE>
                <ACTUALIZAR_OFFER>
                   <MethodResponse>
                   		<originTransactionID> { data($methodResponse1/params/param/value/struct/member[name = "originTransactionID"]/value/string) }	</originTransactionID>	
                   		<responseCode> { data($methodResponse1/params/param/value/struct/member[name = "responseCode"]/value) }	</responseCode>		
                    </MethodResponse>
                </ACTUALIZAR_OFFER>
            </MENSAJE>
           <DESCRIPCION>{ $descripcion }</DESCRIPCION>
        </ns2:WS_Result>
};

declare variable $methodResponse1 as element() external;
declare variable $codigo as xs:string external;
declare variable $descripcion as xs:string external;

xf:actualizarOffer_Res($methodResponse1, $codigo, $descripcion)
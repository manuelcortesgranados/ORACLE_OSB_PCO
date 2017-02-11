xquery version "1.0" encoding "Cp1252";
(:: pragma bea:schema-type-parameter parameter="$methodResponse1" type="ns1:methodResponse" location="../Schemas/DA_ITEL_OPERACION_OCS_TYPES.xsd" ::)
(:: pragma bea:global-element-return element="ns2:WS_Result" location="../Schemas/PS_ITEL_CONSULTAR_OFFER_ODM.xsd" ::)

declare namespace xf = "http://tempuri.org/ITEL/OCS/AIR/Resources/XQueries/consultarOffer_Res/";
declare namespace ns2 = "http://www.comcel.com.co/ConsultarOfferOCS/";
declare namespace ns1 = "http://www.comcel.com.co/OCS/OperacionTypes";
declare namespace ns0 = "http://www.comcel.com.co/OCS/OperacionOCS_AIR";


declare function xf:dateFormatter($expiryDate as xs:string) as xs:string{   
      concat(fn-bea:dateTime-to-string-with-format("yyyy-MM-dd", fn-bea:dateTime-from-string-with-format("yyyyMMdd'T'HH:mm:ss+SSSS", $expiryDate)), " 23:59:59")
};

declare function xf:consultarOffer_Res($methodResponse1 as element(), $codigo as xs:string, $descripcion as xs:string)
    as element(ns2:WS_Result) {
        <ns2:WS_Result>
         <CODIGO>{ $codigo }</CODIGO>
         <MENSAJE>
                <CONSULTAR_OFFER>
                   <originTransactionID> { data($methodResponse1/params/param/value/struct/member[name = "originTransactionID"]/value/string) }	</originTransactionID>	
                   <responseCode> { data($methodResponse1/params/param/value/struct/member[name = "responseCode"]/value) }	</responseCode>
                   <offerInformationList>
                   {
                   let $offerInformation := $methodResponse1/params/param/value/struct/member[name = "offerInformation"]
                   (:let $productID := data(functx:max-node($offerInformation/value/array/data/value/struct/member[name = "productID"]/value)):)
                   (:where data($dedicatedStructs/member[name = "productID"]/value) = $productID and data($dedicatedStructs/member[name = "offerState"]/value) = 0  :)
                   for $dedicatedStructs in $offerInformation/value/array/data/value/struct           
                   return 
                     <Detail>
                        {if(data($dedicatedStructs/member[name = "startDate"]/value) != '') then
                        	<startDate>{data($dedicatedStructs/member[name = "startDate"]/value)}</startDate>
                        else                        
                        	<startDate>{data($dedicatedStructs/member[name = "startDateTime"]/value)}</startDate>
                        }
                        {if(data($dedicatedStructs/member[name = "expiryDate"]/value/dateTime.iso8601) != '') then
                        	<expiryDate>{data($dedicatedStructs/member[name = "expiryDate"]/value/dateTime.iso8601)}</expiryDate>
                        else 
                        	<expiryDate>{data($dedicatedStructs/member[name = "expiryDateTime"]/value/dateTime.iso8601)}</expiryDate>
                        }
                        <offerID>{data($dedicatedStructs/member[name = "offerID"]/value)}</offerID>
                        <offerType>{data($dedicatedStructs/member[name = "offerType"]/value)}</offerType>
                        <productID>{ data($dedicatedStructs/member[name = "productID"]/value) }</productID>
                        <offerState>{ data($dedicatedStructs/member[name = "offerState"]/value) }</offerState>                        
                     </Detail>
                   }
                   </offerInformationList>
                </CONSULTAR_OFFER>
         </MENSAJE>      
         <DESCRIPCION>{ $descripcion }</DESCRIPCION>
        </ns2:WS_Result>
};

declare variable $codigo as xs:string external;
declare variable $descripcion as xs:string external;
declare variable $methodResponse1 as element() external;

xf:consultarOffer_Res($methodResponse1, $codigo, $descripcion)
xquery version "1.0" encoding "Cp1252";
(:: pragma bea:global-element-parameter parameter="$wS_Result1" element="ns1:WS_Result" location="../../../OCS/AIR/Resources/Schemas/PS_ITEL_CONSULTAR_OFFER.xsd" ::)
(:: pragma bea:global-element-parameter parameter="$wS_Result2" element="ns2:WS_Result" location="../../../OCS/AIR/Resources/Schemas/PS_ITEL_CONSULTAR_FAFLIST.xsd" ::)
(:: pragma bea:global-element-return element="ns2:WS_Result" location="../../../OCS/AIR/Resources/Schemas/PS_ITEL_CONSULTAR_FAFLIST.xsd" ::)

declare namespace xf = "http://tempuri.org/ITEL/Core/Resources/XQueries/ejecutarReglasNegocio_Res_consultarFaFListOffers/";
declare namespace ns2 = "http://www.comcel.com.co/ConsultarFaFListOCS/";
declare namespace ns1 = "http://www.comcel.com.co/ConsultarOfferOCS/";
declare namespace ns0 = "http://www.comcel.com.co/OCS/OperacionOCS_AIR";

declare function xf:ejecutarReglasNegocio_Res_consultarFaFListOffers($wS_Result1 as element(ns1:WS_Result),
    $wS_Result2 as element(ns2:WS_Result))
    as element(ns2:WS_Result) {
        <ns2:WS_Result>
         <CODIGO>{ data($wS_Result2/CODIGO) }</CODIGO>
            <MENSAJE>
                <CONSULTAR_FAFLIST>                           
                    <originTransactionID>{ data($wS_Result2/MENSAJE/CONSULTAR_FAFLIST/originTransactionID) }</originTransactionID>                           
                    <responseCode>{ data($wS_Result2/MENSAJE/CONSULTAR_FAFLIST/responseCode) }</responseCode>
                    <fafInformationList>{
                     for $detail in $wS_Result2/MENSAJE/CONSULTAR_FAFLIST/fafInformationList/Detail
                		return
                        <Detail>
                            <exactMatch>{ data($detail/exactMatch) }</exactMatch>
                            <expiryDate>
                            { 
                                for $fafTipo in $wS_Result1/MENSAJE/CONSULTAR_OFFER/offerInformationList/Detail                                            	
                            		let $splitFafTipo:= fn:tokenize($detail/fafIndicator,";")
                            		where $splitFafTipo[3] = $fafTipo/offerType
			  						return data($fafTipo/expiryDate)  
                            }</expiryDate>
                            <owner>{ data($detail/owner) }</owner>
                            <fafIndicator>{ data($detail/fafIndicator) }</fafIndicator>                                      
                                <DetailNumber>
                                	{
                                    for $DetailNumber in $detail/DetailNumber/fafNumber
                                	return
                                       <fafNumber>{ data($DetailNumber) }</fafNumber>
                                    }
                                </DetailNumber>                                           	
                        </Detail>
                        }
                    </fafInformationList>                            
                </CONSULTAR_FAFLIST>
            </MENSAJE>
            <DESCRIPCION>{ data($wS_Result2/DESCRIPCION) }</DESCRIPCION>
        </ns2:WS_Result>
};

declare variable $wS_Result1 as element(ns1:WS_Result) external;
declare variable $wS_Result2 as element(ns2:WS_Result) external;

xf:ejecutarReglasNegocio_Res_consultarFaFListOffers($wS_Result1,
    $wS_Result2)
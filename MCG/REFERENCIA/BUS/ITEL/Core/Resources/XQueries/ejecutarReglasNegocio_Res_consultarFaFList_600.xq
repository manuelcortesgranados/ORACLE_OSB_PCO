(:: pragma bea:global-element-parameter parameter="$wS_Result1" element="ns1:WS_Result" location="../Schemas/PS_ITEL_CONSULTARFAFTIPO.xsd" ::)
(:: pragma bea:global-element-parameter parameter="$wS_Result2" element="ns2:WS_Result" location="../../../OCS/AIR/Resources/Schemas/PS_ITEL_CONSULTAR_FAFLIST.xsd" ::)
(:: pragma bea:global-element-parameter parameter="$wS_Result3" element="ns3:WS_Result" location="../../../OCS/OLM/Resources/Schemas/PS_ITEL_CONSULTAR_SUSCRIPCION.xsd" ::)
(:: pragma bea:global-element-return element="ns2:WS_Result" location="../../../OCS/AIR/Resources/Schemas/PS_ITEL_CONSULTAR_FAFLIST.xsd" ::)

declare namespace ns3 = "http://www.comcel.com.co/ConsultarSuscripcionOCS/";
declare namespace ns2 = "http://www.comcel.com.co/ConsultarFaFListOCS/";
declare namespace ns1 = "http://www.comcel.com.co/ConsultarFAFTipo/";
declare namespace ns0 = "http://www.comcel.com.co/OCS/OperacionOCS_AIR";
declare namespace xf = "http://tempuri.org/ITEL/Core/Resources/XQueries/ejecutarReglasNegocio_Res_consultarFaFList/";

declare function xf:expiryDateFormatter($expiryDate as xs:string) as xs:string{	
	if($expiryDate != "") then (
		concat(fn-bea:dateTime-to-string-with-format("yyyyMMdd'T'", fn-bea:dateTime-from-string-with-format("yyyyMMddHHmmss", substring($expiryDate,1,15))),"12:00:00+0000")
	)
	else 
	(
		"99991231T12:00:00+0000"
	)
};

declare function xf:ejecutarReglasNegocio_Res_consultarFaFList($wS_Result1 as element(ns1:WS_Result),
    $wS_Result2 as element(ns2:WS_Result), $wS_Result3 as element(ns3:WS_Result))
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
                                            <expiryDate>{ 
                                            	for $offerInfo in $wS_Result3/MENSAJE/CONSULTAR_SUSCRIPCION/result                                    		
                                            		where $offerInfo/fafID = $detail/fafIndicator
	        				  						return xf:expiryDateFormatter(data($offerInfo/expiryDate))
	        				  				 }</expiryDate>
                                            <owner>{ data($detail/owner) }</owner>
                                            <fafIndicator>{ 
                                            	for $fafTipo in $wS_Result1/MENSAJE/FAFTIPO/FAF_TIPO                                            	
                                            		let $splitFafTipo:= fn:tokenize($fafTipo,";")
                                            		where $splitFafTipo[1] = $detail/fafIndicator
	        				  						return data(concat($splitFafTipo[1],"|",$splitFafTipo[3]))                      
                                             }</fafIndicator>                                      
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
declare variable $wS_Result3 as element(ns3:WS_Result) external;

xf:ejecutarReglasNegocio_Res_consultarFaFList($wS_Result1,
    $wS_Result2, $wS_Result3)
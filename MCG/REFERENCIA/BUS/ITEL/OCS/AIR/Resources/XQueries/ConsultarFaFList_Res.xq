xquery version "1.0" encoding "Cp1252";
(:: pragma bea:schema-type-parameter parameter="$methodResponse1" type="ns1:methodResponse" location="../Schemas/DA_ITEL_OPERACION_OCS_TYPES.xsd" ::)
(:: pragma bea:global-element-return element="ns2:WS_Result" location="../Schemas/PS_ITEL_CONSULTAR_FAFLIST.xsd" ::)

declare namespace xf = "http://tempuri.org/ITEL/OCS/AIR/Resources/XQueries/ConsultarFaFList_Res/";
declare namespace ns2 = "http://www.comcel.com.co/ConsultarFaFListOCS/";
declare namespace ns1 = "http://www.comcel.com.co/OCS/OperacionTypes";
declare namespace ns0 = "http://www.comcel.com.co/OCS/OperacionOCS_AIR";

declare function xf:consultaNodo($nodes as xs:string) as xs:string{
  let $nodo := xs:string(prueba)
  return $nodo
};


declare function xf:ConsultarFaFList_Res($methodResponse1 as element(), $codigo as xs:string, $descripcion as xs:string)
    as element(ns2:WS_Result) {
        <ns2:WS_Result>
          <CODIGO>{ $codigo }</CODIGO>
            <MENSAJE>
                <CONSULTAR_FAFLIST>
                   		<originTransactionID> { data($methodResponse1/params/param/value/struct/member[name = "originTransactionID"]/value/string) }	</originTransactionID>	
                        <responseCode> { data($methodResponse1/params/param/value/struct/member[name = "responseCode"]/value) }	</responseCode>
                        <fafInformationList>
		                {
		                	let $fafInformationLists := $methodResponse1/params/param/value/struct/member[name = "fafInformationList"]
		                	let $dedicatedStructs:= $fafInformationLists/value/array/data/value/struct		
		                	
		                	for $info in distinct-values($dedicatedStructs/member[name = "fafIndicator"]/value/array/data/value)
		                	return
		                	 <Detail>
			                          <exactMatch>{ 
			                          		let $exactMatch := distinct-values(for  $struct in $dedicatedStructs
				                            where $struct/member[name = "fafIndicator"]/value/array/data/value = $info
				                            return data($struct/member[name = "exactMatch"]/value))
				                            return ($exactMatch)				                             
			                          }</exactMatch>
			                          <expiryDate>{
			                             	let $expiryDate := for  $struct in $dedicatedStructs
				                            where $struct/member[name = "fafIndicator"]/value/array/data/value = $info
				                            return data($struct/member[name = "expiryDate"]/value)
				                            return distinct-values(data($expiryDate))
                                      }</expiryDate>
			                          <owner>{
			                                let $owner := for  $struct in $dedicatedStructs
				                            where $struct/member[name = "fafIndicator"]/value/array/data/value = $info
				                            return data($struct/member[name = "owner"]/value)
				                            return distinct-values(data($owner))
                                      }</owner>	
			                          <fafIndicator>{ data( $info) }</fafIndicator>	                          
			                          <DetailNumber>
			                          { 
				                            for $struct in $dedicatedStructs where $struct/member[name = "fafIndicator"]/value/array/data/value = $info
				                            return
				                            <fafNumber>{ data( $struct/member[name = "fafNumber"]/value )}</fafNumber>
			                          }
			                          </DetailNumber>
			                 </Detail>
		                }
		                </fafInformationList>	
                </CONSULTAR_FAFLIST>
            </MENSAJE>
            <DESCRIPCION>{ $descripcion }</DESCRIPCION>
            
        </ns2:WS_Result>
};

declare variable $codigo as xs:string external;
declare variable $descripcion as xs:string external;
declare variable $methodResponse1 as element() external;

xf:ConsultarFaFList_Res($methodResponse1, $codigo, $descripcion)
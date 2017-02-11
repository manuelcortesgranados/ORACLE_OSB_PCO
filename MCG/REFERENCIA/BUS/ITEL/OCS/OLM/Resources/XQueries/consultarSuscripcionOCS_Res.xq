(:: pragma bea:global-element-parameter parameter="$dsmnResponse1" element="ns1:dsmnResponse" location="../Schemas/DA_ITEL_OPERACION_SERVICE_OLM.xsd" ::)
(:: pragma bea:global-element-return element="ns0:WS_Result" location="../Schemas/PS_ITEL_CONSULTAR_SUSCRIPCION.xsd" ::)

declare namespace ns1 = "http://webapps.online.ericsson.com";
declare namespace ns0 = "http://www.comcel.com.co/ConsultarSuscripcionOCS/";
declare namespace xf = "http://tempuri.org/ITEL/OCS/OLM/Resources/XQueries/consultarSuscripcionOCS_Res/";
declare namespace functx = "http://www.functx.com"; 

declare function functx:last-node 
  ( $nodes as node()* )  as node()? {       
   ($nodes)[last()]/.
 } ;
 
 declare function functx:first-node 
  ( $nodes as node()* )  as node()? {
       
   ($nodes/.)[1]
 } ;
 
 declare function functx:max-node 
  ( $nodes as node()* )  as node()? {       
    
    $nodes[. = max($nodes)]
    
 };
 
 declare function functx:sort-as-numeric 
  ( $seq as item()* )  as item()* {
       
   for $item in $seq
   order by number($item)
   return $item
 } ;

declare function xf:consultarSuscripcionOCS_Res($dsmnResponse1 as element(ns1:dsmnResponse),
    $codigo as xs:string,
    $descripcion as xs:string)
    as element(ns0:WS_Result) {
        <ns0:WS_Result>
            <CODIGO>{ $codigo }</CODIGO>
            <MENSAJE>
                <CONSULTAR_SUSCRIPCION>
                    { 
                        let $response   := $dsmnResponse1/ns1:response/*:result
                        let $response1 := $response
                        
                        for $product in distinct-values($response/*:item[*:key = "productName"]/*:value)
                          
                          let $productDescription := functx:last-node(for $Detail in $response
									                            where $Detail/*:item[*:key = "productName"]/*:value = $product order by number($Detail/*:resultID)
									                            return $Detail)                          					                          
						  return			                            
                          if ( fn:starts-with($product, 'Elegido') )then 
	                        <result>
	                              <productName>{ data( $product) }</productName>
	                              <fafID>{ substring($product,8,3) }</fafID>	 
	                              <productDescription>{
		                           (data($productDescription/*:item[*:key = "productDescription"]/*:value))                     
	                             }</productDescription>	  
	                             <subscriptionStatus>{                
		                             (data($productDescription/*:item[*:key = "subscriptionStatus"]/*:value))                                        
	                             }</subscriptionStatus>	
	                             <startDate>{                                     
                                     (data($productDescription/*:item[*:key = "subscriptionStartTimestamp"]/*:value))                                        
	                             }</startDate>	
	                              <expiryDate>{                                     
                                     (data($productDescription/*:item[*:key = "subscriptionEndTimestamp"]/*:value))                                        
	                             }</expiryDate>	
	                        </result>  
	                        else
	                          <result>
	                              <productName>{ data( $product) }</productName>
	                              <fafID>{ "0" }</fafID>	 
	                              <productDescription>{                                     
                                      (data($productDescription/*:item[*:key = "productDescription"]/*:value))                                        
	                             }</productDescription>	  
	                             <subscriptionStatus>{  
	                               (data($productDescription/*:item[*:key = "subscriptionStatus"]/*:value))                                        
	                             }</subscriptionStatus>	
	                             <startDate>{                                     
                                    (data($productDescription/*:item[*:key = "subscriptionStartTimestamp"]/*:value))                                        
	                             }</startDate>	
	                              <expiryDate>{                                     
                                    (data($productDescription/*:item[*:key = "subscriptionEndTimestamp"]/*:value))                                        
	                             }</expiryDate>	
	                        </result>  
                    }
                </CONSULTAR_SUSCRIPCION>
            </MENSAJE>
            <DESCRIPCION>{ $descripcion }</DESCRIPCION>
        </ns0:WS_Result>
};

declare variable $dsmnResponse1 as element(ns1:dsmnResponse) external;
declare variable $codigo as xs:string external;
declare variable $descripcion as xs:string external;

xf:consultarSuscripcionOCS_Res($dsmnResponse1,
    $codigo,
    $descripcion)
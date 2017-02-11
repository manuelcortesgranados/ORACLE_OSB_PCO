xquery version "1.0" encoding "Cp1252";
(:: pragma  parameter="$consultaOffer" type="xs:anyType" ::)

declare namespace xf = "http://tempuri.org/ITEL/Core/Resources/XQueries/consultaProductID/";

declare namespace functx = "http://www.functx.com";
declare function functx:max-node
  ( $nodes as node()* )  as node()* {

   $nodes[. = max($nodes)]
 } ;


declare function xf:consultaProductID($offerID as xs:string,
    $consultaOffer as element(*))
    as element(*) {
        <productID>
        {
           
                   let $offerInformation := $consultaOffer//offerInformationList                                    
                   let $productID0 := functx:max-node(for $detalle in $offerInformation/Detail where data($detalle//offerState=1)
									                   return 
									                    if ($detalle/offerID = $offerID)then 
									                      <Detail>                        
									                        <valor>{data($detalle/productID)}</valor>               
									                     </Detail>
									                    else(<Detail>                        
									                           <valor>{0}</valor>               
									                        </Detail>)
									                    )    
					let $productID1 := functx:max-node(for $detalle in $offerInformation/Detail where data($detalle//offerState=0)
									                   return 
									                    if ($detalle/offerID = $offerID)then 
									                      <Detail>                        
									                        <valor>{data($detalle/productID)}</valor>               
									                     </Detail>
									                    else(<Detail>                        
									                           <valor>{0}</valor>               
									                        </Detail>)
									                    ) 				
                   return									                                        
					if ($productID0 != '')then
					   <valor>{ data($productID0) }</valor>
					else ( <valor>{ data($productID1) }</valor>)				                         
                                  
        }
        </productID>
};

declare variable $offerID as xs:string external;
declare variable $consultaOffer as element(*) external;

xf:consultaProductID($offerID,
    $consultaOffer)

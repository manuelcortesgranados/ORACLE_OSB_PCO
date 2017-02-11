(:: pragma bea:global-element-parameter parameter="$wS_Result" element="ns1:WS_Result" location="../Schemas/PS_ITEL_EJECUTARREGLASNEGOCIO.xsd" ::)

declare namespace ns1 = "http://www.comcel.com.co/EjecutarReglasNegocio/";
declare namespace ns0 = "http://www.comcel.com.co/IN/OperacionCorba";
declare namespace xf = "http://tempuri.org/ITEL/Core/Resources/XQueries/adaptarParametrosSalidaTrama206OCS/";

declare function xf:dateFormatter($expiryDate as xs:string) as xs:string{	
	concat(fn-bea:dateTime-to-string-with-format("yyyy-MM-dd", fn-bea:dateTime-from-string-with-format("yyyyMMdd'T'HH:mm:ss+SSSS", $expiryDate)), " 23:59:59")
};

declare function xf:adaptarParametrosSalidaTrama204($wS_Result as element(ns1:WS_Result))
    as xs:string {
    	   					
    	let $fafList:=  $wS_Result/MENSAJE/SUSCRIPTOR_OCS/FAF_LIST/fafInformationList
        let $list := fn:string-join(for $dato in $fafList/Detail
                                       let $campos := fn:tokenize($dato/fafIndicator, ';')
				                       return
				                        fn:concat(data($campos[1]),";",xf:dateFormatter($dato/expiryDate),";",
				                          fn:string-join(for $numero in $dato/DetailNumber/fafNumber
								                           return 
								                           if (fn:contains($dato/fafIndicator,"FNF") or fn:contains($dato/fafIndicator,"ILIMITADO") ) then fn:concat($numero)  else fn:concat(fn:substring($numero,4))
								                           ,";")    
				                        ), ";")
       
        return 
          $list
};

declare variable $wS_Result as element(ns1:WS_Result) external;

xf:adaptarParametrosSalidaTrama204($wS_Result)
(:: pragma bea:global-element-parameter parameter="$wS_Result" element="ns1:WS_Result" location="../Schemas/PS_ITEL_EJECUTARREGLASNEGOCIO.xsd" ::)

declare namespace ns1 = "http://www.comcel.com.co/EjecutarReglasNegocio/";
declare namespace ns0 = "http://www.comcel.com.co/IN/OperacionCorba";
declare namespace xf = "http://tempuri.org/ITEL/Core/Resources/XQueries/adaptarParametrosSalidaTrama202/";

declare function xf:adaptarParametrosSalidaTrama202($wS_Result as element(ns1:WS_Result))
    as xs:string {
    	let $elegidosIlimitados := $wS_Result/MENSAJE/SUSCRIPTOR_DESTINO/*:BestFnF_Numbers
    	return
    	fn:string-join( (
    			  concat(data($elegidosIlimitados/*:Detail[1]),""),
    			  concat(data($elegidosIlimitados/*:Detail[2]),""),
    			  concat(data($elegidosIlimitados/*:Detail[3]),""),
    			  concat(data($elegidosIlimitados/*:Detail[4]),""),
    			  concat(data($elegidosIlimitados/*:Detail[5]),""),
    			  concat(data($elegidosIlimitados/*:Detail[6]),""),
    			  concat(data($elegidosIlimitados/*:Detail[7]),""),
    			  concat(data($elegidosIlimitados/*:Detail[8]),""),
    			  concat(data($elegidosIlimitados/*:Detail[9]),""),
        		  concat(data($wS_Result/MENSAJE/SUSCRIPTOR_DESTINO/*:FnF_Numbers/*:Detail[1]),""),
        		  concat(data($wS_Result/MENSAJE/SUSCRIPTOR_DESTINO/*:FnF_Numbers/*:Detail[2]),""),
        		  concat(data($wS_Result/MENSAJE/SUSCRIPTOR_DESTINO/*:FnF_Numbers/*:Detail[3]),""),
        		  concat(data($wS_Result/MENSAJE/SUSCRIPTOR_DESTINO/*:FnF_Numbers/*:Detail[4]),""),
        		  concat(data($wS_Result/MENSAJE/SUSCRIPTOR_DESTINO/*:FnF_Numbers/*:Detail[5]),""),
        		  concat(data($wS_Result/MENSAJE/SUSCRIPTOR_DESTINO/*:FnF_Numbers/*:Detail[6]),""),
        		  concat(data($wS_Result/MENSAJE/SUSCRIPTOR_DESTINO/*:FnF_Numbers/*:Detail[7]),""),
        		  concat(data($wS_Result/MENSAJE/SUSCRIPTOR_DESTINO/*:FnF_Numbers/*:Detail[8]),""),
        		  concat(data($wS_Result/MENSAJE/SUSCRIPTOR_DESTINO/*:FnF_Numbers/*:Detail[9]),""),
        		  concat(data($wS_Result/MENSAJE/SUSCRIPTOR_DESTINO/*:FA_Destination/*:Detail[1]),"")
        		  )
        		  ,";")
        		  
};

declare variable $wS_Result as element(ns1:WS_Result) external;

xf:adaptarParametrosSalidaTrama202($wS_Result)
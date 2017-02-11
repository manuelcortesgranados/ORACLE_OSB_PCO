(:: pragma bea:global-element-parameter parameter="$wS_Result" element="ns1:WS_Result" location="../Schemas/PS_ITEL_EJECUTARREGLASNEGOCIO.xsd" ::)

declare namespace ns1 = "http://www.comcel.com.co/EjecutarReglasNegocio/";
declare namespace ns0 = "http://www.comcel.com.co/IN/OperacionCorba";
declare namespace xf = "http://tempuri.org/ITEL/Core/Resources/XQueries/adaptarParametrosSalidaTrama203/";

declare function xf:adaptarParametrosSalidaTrama203($wS_Result as element(ns1:WS_Result))
    as xs:string {
    
    	fn:concat(data($wS_Result/MENSAJE/SUSCRIPTOR_DESTINO/*:BestFnF_Numbers/*:Detail[1]),
        		  ";",
        		  data($wS_Result/MENSAJE/SUSCRIPTOR_DESTINO/*:FnF_Numbers/*:Detail[1]),
        		   ";",
        		  data($wS_Result/MENSAJE/SUSCRIPTOR_DESTINO/*:FnF_Numbers/*:Detail[2]),
        		   ";",
        		  data($wS_Result/MENSAJE/SUSCRIPTOR_DESTINO/*:FnF_Numbers/*:Detail[3]),
        		   ";",
        		  data($wS_Result/MENSAJE/SUSCRIPTOR_DESTINO/*:FnF_Numbers/*:Detail[4]),
        		   ";",
        		  data($wS_Result/MENSAJE/SUSCRIPTOR_DESTINO/*:FnF_Numbers/*:Detail[5]),
        		   ";",
        		  data($wS_Result/MENSAJE/SUSCRIPTOR_DESTINO/*:FnF_Numbers/*:Detail[6]),
        		   ";",
        		  data($wS_Result/MENSAJE/SUSCRIPTOR_DESTINO/*:FnF_Numbers/*:Detail[7]),
        		   ";",
        		  data($wS_Result/MENSAJE/SUSCRIPTOR_DESTINO/*:FnF_Numbers/*:Detail[8]),
        		   ";",
        		  data($wS_Result/MENSAJE/SUSCRIPTOR_DESTINO/*:FnF_Numbers/*:Detail[9]),
        		   ";",
        		   if(data($wS_Result/MENSAJE/SUSCRIPTOR_DESTINO/*:IsMLCPossible) = 'TRUE') then '1' else '0'
        		  )
};

declare variable $wS_Result as element(ns1:WS_Result) external;

xf:adaptarParametrosSalidaTrama203($wS_Result)
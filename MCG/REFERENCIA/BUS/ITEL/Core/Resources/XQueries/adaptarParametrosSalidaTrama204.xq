xquery version "1.0" encoding "Cp1252";
(:: pragma bea:global-element-parameter parameter="$wS_Result1" element="ns3:WS_Result" location="../Schemas/PS_ITEL_EJECUTARREGLASNEGOCIO.xsd" ::)

declare namespace xf = "http://tempuri.org/ITEL/Core/Resources/XQueries/adaptarParametrosSalidaTrama204/";
declare namespace ns2 = "http://www.comcel.com.co/OCS/OperacionCorbaOCS";
declare namespace ns1 = "http://www.comcel.com.co/IN/OperacionCorba";
declare namespace ns4 = "http://webapps.online.ericsson.com";
declare namespace ns3 = "http://www.comcel.com.co/EjecutarReglasNegocio/";
declare namespace ns0 = "http://www.comcel.com.co/OCS/OperacionOCS_AIR";

declare function xf:adaptarParametrosSalidaTrama204($wS_Result1 as element(ns3:WS_Result))
    as xs:string {
        let $elegidosIlimitados := $wS_Result1/MENSAJE/SUSCRIPTOR_DESTINO/*:BestFnF_Numbers
    	return
    	concat(fn:string-join( (
    			  concat(data("BestFnF"),""),
    			  concat(data($elegidosIlimitados/*:Detail[1]),""),    			  
    			  concat(data($elegidosIlimitados/*:Detail[2]),""),
    			  concat(data($elegidosIlimitados/*:Detail[3]),""),
    			  concat(data($elegidosIlimitados/*:Detail[4]),""),
    			  concat(data($elegidosIlimitados/*:Detail[5]),""),
    			  concat(data($elegidosIlimitados/*:Detail[6]),""),
    			  concat(data($elegidosIlimitados/*:Detail[7]),""),
    			  concat(data($elegidosIlimitados/*:Detail[8]),""),
    			  concat(data($elegidosIlimitados/*:Detail[9]),""),
    			  concat(data($wS_Result1/MENSAJE/SUSCRIPTOR_DESTINO/*:BestFnF_ActivationEndTime),""),
    			  concat(data("FnF"),""),    			  
        		  concat(data($wS_Result1/MENSAJE/SUSCRIPTOR_DESTINO/*:FnF_Numbers/*:Detail[1]),""),
        		  concat(data($wS_Result1/MENSAJE/SUSCRIPTOR_DESTINO/*:FnF_Numbers/*:Detail[2]),""),
        		  concat(data($wS_Result1/MENSAJE/SUSCRIPTOR_DESTINO/*:FnF_Numbers/*:Detail[3]),""),
        		  concat(data($wS_Result1/MENSAJE/SUSCRIPTOR_DESTINO/*:FnF_Numbers/*:Detail[4]),""),
        		  concat(data($wS_Result1/MENSAJE/SUSCRIPTOR_DESTINO/*:FnF_Numbers/*:Detail[5]),""),
        		  concat(data($wS_Result1/MENSAJE/SUSCRIPTOR_DESTINO/*:FnF_Numbers/*:Detail[6]),""),
        		  concat(data($wS_Result1/MENSAJE/SUSCRIPTOR_DESTINO/*:FnF_Numbers/*:Detail[7]),""),
        		  concat(data($wS_Result1/MENSAJE/SUSCRIPTOR_DESTINO/*:FnF_Numbers/*:Detail[8]),""),
        		  concat(data($wS_Result1/MENSAJE/SUSCRIPTOR_DESTINO/*:FnF_Numbers/*:Detail[9]),""),
        		  concat(data(if (fn:exists($wS_Result1/MENSAJE/SUSCRIPTOR_DESTINO/*:FnF_Numbers/*:Detail)) then $wS_Result1/MENSAJE/SUSCRIPTOR_DESTINO/*:FnF_ActivationEndTime else ""),""))        		  
        		  ,";")
        		  ,
        		  ";SMSOnNet"
    				,";"
    				, data($wS_Result1/MENSAJE/SUSCRIPTOR_DESTINO/*:SMSOnNet_Numbers/*:Detail[1] )
    				,";"
    				, data($wS_Result1/MENSAJE/SUSCRIPTOR_DESTINO/*:SMSOnNet_Numbers/*:Detail[2] )
    				,";"
    				, data($wS_Result1/MENSAJE/SUSCRIPTOR_DESTINO/*:SMSOnNet_Numbers/*:Detail[3] )
    				,";"
    				, data($wS_Result1/MENSAJE/SUSCRIPTOR_DESTINO/*:SMSOnNet_Numbers/*:Detail[4] )
    				,";"
    				, data($wS_Result1/MENSAJE/SUSCRIPTOR_DESTINO/*:SMSOnNet_Numbers/*:Detail[5] )
    				,";" 
					, data($wS_Result1/MENSAJE/SUSCRIPTOR_DESTINO/*:SMSOnNet_ExpirationDate)
					,";"
					, "SMSOffNet"
					,";"
					, data($wS_Result1/MENSAJE/SUSCRIPTOR_DESTINO/*:SMSOffNet_Numbers/*:Detail[1] )
					,";"
    				, data($wS_Result1/MENSAJE/SUSCRIPTOR_DESTINO/*:SMSOffNet_Numbers/*:Detail[2] )
    				,";"
    				, data($wS_Result1/MENSAJE/SUSCRIPTOR_DESTINO/*:SMSOffNet_Numbers/*:Detail[3] )
    				,";"
    				, data($wS_Result1/MENSAJE/SUSCRIPTOR_DESTINO/*:SMSOffNet_Numbers/*:Detail[4] )
    				,";"
    				, data($wS_Result1/MENSAJE/SUSCRIPTOR_DESTINO/*:SMSOffNet_Numbers/*:Detail[5] )
    				,";"
					, data($wS_Result1/MENSAJE/SUSCRIPTOR_DESTINO/*:SMSOffNet_ExpirationDate)
					,";"
					, "SMSAny"
					,";"
					, data($wS_Result1/MENSAJE/SUSCRIPTOR_DESTINO/*:SMSAny_Numbers/*:Detail[1] )
					,";"
    				, data($wS_Result1/MENSAJE/SUSCRIPTOR_DESTINO/*:SMSAny_Numbers/*:Detail[2] )
    				,";"
    				, data($wS_Result1/MENSAJE/SUSCRIPTOR_DESTINO/*:SMSAny_Numbers/*:Detail[3] )
    				,";"
    				, data($wS_Result1/MENSAJE/SUSCRIPTOR_DESTINO/*:SMSAny_Numbers/*:Detail[4] )
    				,";"
    				, data($wS_Result1/MENSAJE/SUSCRIPTOR_DESTINO/*:SMSAny_Numbers/*:Detail[5] )
    				,";"
					, data($wS_Result1/MENSAJE/SUSCRIPTOR_DESTINO/*:SMSAny_ExpirationDate)
        		  )
        		  
};

declare variable $wS_Result1 as element(ns3:WS_Result) external;

xf:adaptarParametrosSalidaTrama204($wS_Result1)
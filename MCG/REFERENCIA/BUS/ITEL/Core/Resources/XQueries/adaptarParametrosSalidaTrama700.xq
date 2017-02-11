xquery version "1.0" encoding "Cp1252";
(:: pragma bea:local-element-parameter parameter="$suscriptor" type="ns1:WS_Result/MENSAJE/SUSCRIPTOR_DESTINO" location="../Schemas/PS_ITEL_EJECUTARREGLASNEGOCIO.xsd" ::)

declare namespace xf = "http://tempuri.org/ITEL/Core/Resources/XQueries/adaptarParametrosSalidasTrama700a/";
declare namespace ns1 = "http://www.comcel.com.co/EjecutarReglasNegocio/";
declare namespace ns0 = "http://www.comcel.com.co/IN/OperacionCorba";

declare function xf:adaptarParametrosSalidasTrama700a($suscriptor as element())
    as xs:string {
        fn:concat(
    				 "smsFnFOnNet"
    				,";"
    				, data($suscriptor/*:SMSOnNet_Numbers/*:Detail[1] )
    				,";"
    				, data($suscriptor/*:SMSOnNet_Numbers/*:Detail[2] )
    				,";"
    				, data($suscriptor/*:SMSOnNet_Numbers/*:Detail[3] )
    				,";"
    				, data($suscriptor/*:SMSOnNet_Numbers/*:Detail[4] )
    				,";"
    				, data($suscriptor/*:SMSOnNet_Numbers/*:Detail[5] )
    				,";" 
					, data($suscriptor/*:SMSOnNet_ExpirationDate)
					,";"
					, "smsFnFOffNet"
					,";"
					, data($suscriptor/*:SMSOffNet_Numbers/*:Detail[1] )
					,";"
    				, data($suscriptor/*:SMSOffNet_Numbers/*:Detail[2] )
    				,";"
    				, data($suscriptor/*:SMSOffNet_Numbers/*:Detail[3] )
    				,";"
    				, data($suscriptor/*:SMSOffNet_Numbers/*:Detail[4] )
    				,";"
    				, data($suscriptor/*:SMSOffNet_Numbers/*:Detail[5] )
    				,";"
					, data($suscriptor/*:SMSOffNet_ExpirationDate)
					,";"
					, "smsFnFAny"
					,";"
					, data($suscriptor/*:SMSAny_Numbers/*:Detail[1] )
					,";"
    				, data($suscriptor/*:SMSAny_Numbers/*:Detail[2] )
    				,";"
    				, data($suscriptor/*:SMSAny_Numbers/*:Detail[3] )
    				,";"
    				, data($suscriptor/*:SMSAny_Numbers/*:Detail[4] )
    				,";"
    				, data($suscriptor/*:SMSAny_Numbers/*:Detail[5] )
    				,";"
					, data($suscriptor/*:SMSAny_ExpirationDate)
    			)
    				
};

declare variable $suscriptor as element() external;

xf:adaptarParametrosSalidasTrama700a($suscriptor)
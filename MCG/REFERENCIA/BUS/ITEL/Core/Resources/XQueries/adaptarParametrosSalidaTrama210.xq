(:: pragma bea:global-element-parameter parameter="$wS_Result1" element="ns3:WS_Result" location="../Schemas/PS_ITEL_EJECUTARREGLASNEGOCIO.xsd" ::)

declare namespace ns2 = "http://www.comcel.com.co/OCS/OperacionCorbaOCS";
declare namespace ns1 = "http://www.comcel.com.co/IN/OperacionCorba";
declare namespace ns4 = "http://webapps.online.ericsson.com";
declare namespace ns3 = "http://www.comcel.com.co/EjecutarReglasNegocio/";
declare namespace ns0 = "http://www.comcel.com.co/OCS/OperacionOCS_AIR";
declare namespace xf = "http://tempuri.org/ITEL/Core/Resources/XQueries/adaptarParametrosSalidaTrama210/";
declare namespace functx = "http://www.functx.com";

 
declare function xf:adaptarParametrosSalidaTrama210($wS_Result1 as element(ns3:WS_Result))
    as xs:string {
        let $parametros := concat(
        for $paquetes in $wS_Result1/MENSAJE/SUSCRIPTOR_OCS/DATOS_SUSCRIPTOR/*:PAQUETES_DATOS/PAQUETE
        	 return
        	     concat(
        	     data($paquetes/NOMBRE),";",
        	     data($paquetes/CONSUMO),";",
        	     data($paquetes/FECHA_EXPIRACION),";",
        	     data($paquetes/TIPO),";")
      	)
     return 
     	fn:substring($parametros,1,(string-length($parametros)-1)) 
      
};

declare variable $wS_Result1 as element(ns3:WS_Result) external;

xf:adaptarParametrosSalidaTrama210($wS_Result1)

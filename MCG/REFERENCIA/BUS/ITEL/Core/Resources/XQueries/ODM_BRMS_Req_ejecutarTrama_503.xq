(:: pragma bea:global-element-return element="ns0:Input_Parameters" location="../Schemas/PS_ITEL_EJECUTARTRAMA.xsd" ::)

declare namespace ns0 = "http://www.comcel.com.co/EjecutarTrama/";
declare namespace xf = "http://tempuri.org/Elegidos/Core/Resources/XQueries/BRMStoItel_Req_ejecutarTrama_414/";


declare function xf:BRMStoItel_Req_ejecutarTrama_503(
    $usuario as xs:string, $clave as xs:string, $msisdn as xs:string, $offerName as xs:string)
    as element(ns0:Input_Parameters) {
        <ns0:Input_Parameters>            
	         <TRAMA>{ concat($usuario,"!",$clave,"!503!",$msisdn ,"!",$offerName,"!*")}</TRAMA>
	         <IP_ORIGEN>0</IP_ORIGEN>        
        </ns0:Input_Parameters>
};


declare variable $usuario as xs:string external;
declare variable $clave as xs:string external;
declare variable $msisdn as xs:string external;
declare variable $offerName as xs:string external;

xf:BRMStoItel_Req_ejecutarTrama_503($usuario, $clave, $msisdn, $offerName)

(:: pragma bea:global-element-return element="ns0:Input_Parameters" location="../Schemas/PS_ITEL_EJECUTARTRAMA.xsd" ::)

declare namespace ns0 = "http://www.comcel.com.co/EjecutarTrama/";
declare namespace xf = "http://tempuri.org/Elegidos/Core/Resources/XQueries/BRMStoItel_Req_ejecutarTrama_414/";

declare function xf:BRMStoItel_Req_ejecutarTrama_414(
    $min as xs:string, $paquete as xs:string, $cobro as xs:string, $usuario as xs:string, $clave as xs:string, $canal as xs:string)
    as element(ns0:Input_Parameters) {
        <ns0:Input_Parameters>            
	         <TRAMA>{ concat($usuario,"!",$clave,"!415!",$min ,"!",$canal,";",$paquete,";",$cobro,"!*")}</TRAMA>
	         <IP_ORIGEN>0</IP_ORIGEN>        
        </ns0:Input_Parameters>
};


declare variable $min as xs:string external;
declare variable $paquete as xs:string external;
declare variable $cobro as xs:string external;
declare variable $usuario as xs:string external;
declare variable $clave as xs:string external;
declare variable $canal as xs:string external;

xf:BRMStoItel_Req_ejecutarTrama_414($min, $paquete, $cobro, $usuario, $clave, $canal)

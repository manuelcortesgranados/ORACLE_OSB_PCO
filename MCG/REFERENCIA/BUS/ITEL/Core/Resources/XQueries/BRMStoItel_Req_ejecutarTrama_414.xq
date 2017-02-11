(:: pragma bea:global-element-return element="ns0:Input_Parameters" location="../Schemas/PS_ITEL_EJECUTARTRAMA.xsd" ::)

declare namespace ns0 = "http://www.comcel.com.co/EjecutarTrama/";
declare namespace xf = "http://tempuri.org/Elegidos/Core/Resources/XQueries/BRMStoItel_Req_ejecutarTrama_414/";

declare function xf:BRMStoItel_Req_ejecutarTrama_414(
    $min as xs:string, $paquete as xs:string)
    as element(ns0:Input_Parameters) {
        <ns0:Input_Parameters>            
	         <TRAMA>{ concat("brmstoitel!brmstoitel!414!",$min ,"!bundle;9108;12345;",$paquete,";1!*")}</TRAMA>
	         <IP_ORIGEN>0</IP_ORIGEN>        
        </ns0:Input_Parameters>
};


declare variable $min as xs:string external;
declare variable $paquete as xs:string external;

xf:BRMStoItel_Req_ejecutarTrama_414($min, $paquete)

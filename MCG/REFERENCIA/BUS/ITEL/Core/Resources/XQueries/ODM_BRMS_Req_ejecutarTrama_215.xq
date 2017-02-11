(:: pragma bea:global-element-return element="ns0:Input_Parameters" location="../Schemas/PS_ITEL_EJECUTARTRAMA_ESPECIFICA.xsd" ::)

declare namespace ns0 = "http://www.comcel.com.co/EjecutarTrama/";
declare namespace xf = "http://tempuri.org/ITEL/Core/Resources/XQueries/ODM_BRMS_Req_ejecutarTrama_215/";

declare function xf:ODM_BRMS_Req_ejecutarTrama_215($usuario as xs:string,
    $contrasena as xs:string,
    $min as xs:string,
    $estado as xs:string,
    $canal as xs:string)
    as element(ns0:Input_Parameters) {
        <ns0:Input_Parameters>
	         <TRAMA>{ concat($usuario,"!",$contrasena,"!215!",$min ,"!",$estado,";",$canal,"!*")}</TRAMA>
            <IP_ORIGEN>0</IP_ORIGEN>
        </ns0:Input_Parameters>
};

declare variable $usuario as xs:string external;
declare variable $contrasena as xs:string external;
declare variable $min as xs:string external;
declare variable $estado as xs:string external;
declare variable $canal as xs:string external;

xf:ODM_BRMS_Req_ejecutarTrama_215($usuario,
    $contrasena,
    $min,
    $estado,
    $canal)

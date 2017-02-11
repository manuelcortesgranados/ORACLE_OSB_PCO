(:: pragma bea:global-element-return element="ns0:Input_Parameters" location="../Schemas/PS_ITEL_EJECUTARTRAMA.xsd" ::)

declare namespace ns0 = "http://www.comcel.com.co/EjecutarTrama/";
declare namespace xf = "http://tempuri.org/ITEL/Core/Resources/XQueries/ejecutadorAMDOCS_Req_ejecutador/";

declare function xf:ejecutadorAMDOCS_Req_ejecutador($tramaIN as xs:string,
    $ipIN as xs:string)
    as element(ns0:Input_Parameters) {
        <ns0:Input_Parameters>
            <TRAMA>{ $tramaIN }</TRAMA>
            <IP_ORIGEN>{ $ipIN }</IP_ORIGEN>
        </ns0:Input_Parameters>
};

declare variable $tramaIN as xs:string external;
declare variable $ipIN as xs:string external;

xf:ejecutadorAMDOCS_Req_ejecutador($tramaIN,
    $ipIN)
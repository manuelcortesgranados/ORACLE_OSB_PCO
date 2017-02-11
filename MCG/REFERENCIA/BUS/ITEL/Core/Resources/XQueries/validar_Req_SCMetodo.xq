(:: pragma bea:global-element-return element="ns0:Input_Parameters" location="../Schemas/PS_ITEL_VALIDAR_SERVCLASS_METODO.xsd" ::)

declare namespace ns0 = "http://www.comcel.com.co/ValidarServClassMetodo/";
declare namespace xf = "http://tempuri.org/ITEL/Core/Resources/XQueries/validar_Req_SCMetodo/";

declare function xf:validar_Req_SCMetodo($serviceClass as xs:decimal, $metodo as xs:string)
    as element(ns0:Input_Parameters) {
        <ns0:Input_Parameters>
            <SERVICECLASS>{ $serviceClass }</SERVICECLASS>
            <METODO>{ $metodo }</METODO>
        </ns0:Input_Parameters>
};

declare variable $serviceClass as xs:decimal external;
declare variable $metodo as xs:string external;

xf:validar_Req_SCMetodo($serviceClass, $metodo)
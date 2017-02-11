(:: pragma bea:global-element-return element="ns0:Input_Parameters" location="../Schemas/PS_ITEL_VALIDARCONTRATOMETODO.xsd" ::)

declare namespace ns0 = "http://www.comcel.com.co/ValidarContratoMetodo/";
declare namespace xf = "http://tempuri.org/ITEL/Core/Resources/XQueries/validarContratoMetodo_Req/";

declare function xf:validarContratoMetodo_Req($contrato as xs:string,
    $metodo as xs:string)
    as element(ns0:Input_Parameters) {
        <ns0:Input_Parameters>
            <CONTRATO>{ $contrato }</CONTRATO>
            <METODO>{ $metodo }</METODO>
        </ns0:Input_Parameters>
};

declare variable $contrato as xs:string external;
declare variable $metodo as xs:string external;

xf:validarContratoMetodo_Req($contrato,
    $metodo)
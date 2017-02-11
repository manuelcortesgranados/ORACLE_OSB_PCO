(:: pragma bea:global-element-return element="ns0:Input_Parameters" location="../Schemas/PS_ITEL_VALIDARPREFIJO.xsd" ::)

declare namespace ns0 = "http://www.comcel.com.co/ValidarPrefijo/";
declare namespace xf = "http://tempuri.org/ITEL/Core/Resources/XQueries/ejecutarTrama_Req_validarPrefijoLocal/";

declare function xf:ejecutarTrama_Req_validarPrefijoLocal($min as xs:string)
    as element(ns0:Input_Parameters) {
        <ns0:Input_Parameters>
            <MIN>{ $min }</MIN>
        </ns0:Input_Parameters>
};

declare variable $min as xs:string external;

xf:ejecutarTrama_Req_validarPrefijoLocal($min)
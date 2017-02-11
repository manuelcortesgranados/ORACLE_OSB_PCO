(:: pragma bea:global-element-parameter parameter="$outputParameters1" element="ns0:OutputParameters" location="../Schemas/BD_ITEL_VALIDARCONTRATOMETODO.xsd" ::)
(:: pragma bea:global-element-return element="ns1:WS_Result" location="../Schemas/PS_ITEL_VALIDARCONTRATOMETODO.xsd" ::)

declare namespace ns1 = "http://www.comcel.com.co/ValidarContratoMetodo/";
declare namespace ns0 = "http://xmlns.oracle.com/pcbpel/adapter/db/SOA_TEST/PKG_SOA_ITEL/PRC_VALIDAR_CONTRATO_METODO/";
declare namespace xf = "http://tempuri.org/ITEL/Core/Resources/XQueries/validarContratoMetodo_Res/";

declare function xf:validarContratoMetodo_Res($outputParameters1 as element(ns0:OutputParameters),
    $descripcion as xs:string)
    as element(ns1:WS_Result) {
        <ns1:WS_Result>
            <CODIGO>OK</CODIGO>
            <MENSAJE>{ data($outputParameters1/ns0:P_RESPUESTA) }</MENSAJE>
            <DESCRIPCION>{ $descripcion }</DESCRIPCION>
        </ns1:WS_Result>
};

declare variable $outputParameters1 as element(ns0:OutputParameters) external;
declare variable $descripcion as xs:string external;

xf:validarContratoMetodo_Res($outputParameters1,
    $descripcion)
(:: pragma bea:global-element-parameter parameter="$tramaXML" element="ns0:TRAMA" location="../Schemas/DA_TRAMA.xsd" ::)
(:: pragma bea:global-element-return element="ns1:Input_Parameters" location="../Schemas/PS_ITEL_VALIDACIONGENERAL.xsd" ::)

declare namespace ns1 = "http://www.comcel.com.co/ValidacionGeneral/";
declare namespace ns0 = "http://www.comcel.com.co/DA_TRAMA";
declare namespace xf = "http://tempuri.org/ITEL/Core/Resources/XQueries/validarTrama_Req_validacionGeneral/";

declare function xf:validarTrama_Req_validacionGeneral($tramaXML as element(ns0:TRAMA))
    as element(ns1:Input_Parameters) {
        <ns1:Input_Parameters>
        	<MIN>{ data($tramaXML/ns0:MIN) }</MIN>
            <USUARIO>{ data($tramaXML/ns0:USUARIO) }</USUARIO>
            <PASSWORD>{ data($tramaXML/ns0:CLAVE) }</PASSWORD>
            <METODO>{ data($tramaXML/ns0:METODO) }</METODO>
        </ns1:Input_Parameters>
};

declare variable $tramaXML as element(ns0:TRAMA) external;

xf:validarTrama_Req_validacionGeneral($tramaXML)
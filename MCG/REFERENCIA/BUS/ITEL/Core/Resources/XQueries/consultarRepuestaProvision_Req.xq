(:: pragma bea:global-element-parameter parameter="$input_Parameters1" element="ns0:Input_Parameters" location="../Schemas/PS_ITEL_CONSULTAR_RESPUESTA_PROVISION.xsd" ::)
(:: pragma bea:global-element-return element="ns1:InputParameters" location="../Schemas/BD_ITEL_CONSULTAR_RESPUESTA_PROV.xsd" ::)

declare namespace ns1 = "http://xmlns.oracle.com/pcbpel/adapter/db/ITELSOA/PKG_SOA_ITEL/PRC_CONSULTAR_RESPUESTA_PROV/";
declare namespace ns0 = "http://www.comcel.com.co/ConsultarRespuestaProvision/";
declare namespace xf = "http://tempuri.org/ITEL/Core/Resources/XQueries/consultarRepuestaProvision_Req/";

declare function xf:consultarRepuestaProvision_Req($input_Parameters1 as element(ns0:Input_Parameters))
    as element(ns1:InputParameters) {
        <ns1:InputParameters>
            <ns1:P_RESCODIGO>{ data($input_Parameters1/RESCODIGO) }</ns1:P_RESCODIGO>
        </ns1:InputParameters>
};

declare variable $input_Parameters1 as element(ns0:Input_Parameters) external;

xf:consultarRepuestaProvision_Req($input_Parameters1)
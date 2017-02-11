(:: pragma bea:global-element-parameter parameter="$input_Parameters1" element="ns0:Input_Parameters" location="../Schemas/PS_ITEL_CONSULTARCOBROSMSELEGIDOS.xsd" ::)
(:: pragma bea:global-element-return element="ns1:InputParameters" location="../Schemas/BD_ITEL_CONSULTAR_COBRO_SMS_ELEGIDOS.xsd" ::)

declare namespace ns1 = "http://xmlns.oracle.com/pcbpel/adapter/db/ITELSOA/PKG_SOA_ITEL/PRC_CONSULTAR_COBRO_SMS/";
declare namespace ns0 = "http://www.comcel.com.co/ConsultarCobroSMSElegidos";
declare namespace xf = "http://tempuri.org/ITEL/Core/Resources/XQueries/consultarCobroSMSElegidos_Req/";

declare function xf:consultarCobroSMSElegidos_Req($input_Parameters1 as element(ns0:Input_Parameters))
    as element(ns1:InputParameters) {
        <ns1:InputParameters>
            <ns1:P_CODIGO_COBRO>{ data($input_Parameters1/ns0:CODIGO_COBRO) }</ns1:P_CODIGO_COBRO>
        </ns1:InputParameters>
};

declare variable $input_Parameters1 as element(ns0:Input_Parameters) external;

xf:consultarCobroSMSElegidos_Req($input_Parameters1)
(:: pragma bea:global-element-parameter parameter="$input_Parameters1" element="ns1:Input_Parameters" location="../Schemas/PS_ITEL_CONSULTARDATOSMERCADEO.xsd" ::)
(:: pragma bea:global-element-return element="ns0:InputParameters" location="../Schemas/BD_ITEL_CONSULTAR_DATOS_MERCADEO.xsd" ::)

declare namespace ns1 = "http://www.comcel.com.co/ConsultarDatosMercadeo";
declare namespace ns0 = "http://xmlns.oracle.com/pcbpel/adapter/db/ITELSOA/PKG_SOA_ITEL/PRC_CONSULTAR_MERCADEO/";
declare namespace xf = "http://tempuri.org/ITEL/Core/Resources/XQueries/consultarDatosMercadeo_Req/";

declare function xf:consultarDatosMercadeo_Req($input_Parameters1 as element(ns1:Input_Parameters))
    as element(ns0:InputParameters) {
        <ns0:InputParameters>
            <ns0:P_CODMATERIAL>{ data($input_Parameters1/ns1:CODMATERIAL) }</ns0:P_CODMATERIAL>
        </ns0:InputParameters>
};

declare variable $input_Parameters1 as element(ns1:Input_Parameters) external;

xf:consultarDatosMercadeo_Req($input_Parameters1)
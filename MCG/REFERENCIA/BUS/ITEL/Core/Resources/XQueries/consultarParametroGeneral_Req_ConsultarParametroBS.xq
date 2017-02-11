(:: pragma bea:global-element-parameter parameter="$input_Parameters1" element="ns1:Input_Parameters" location="../Schemas/PS_ITEL_CONSULTARPARAMETROGENERAL.xsd" ::)
(:: pragma bea:global-element-return element="ns0:InputParameters" location="../Schemas/BD_ITEL_CONSULTARPARAMETRO.xsd" ::)

declare namespace ns1 = "http://www.comcel.com.co/ConsultarParametroGeneral/";
declare namespace ns0 = "http://xmlns.oracle.com/pcbpel/adapter/db/SOA_TEST/PKG_SOA_ITEL/PRC_CONSULTAR_PARAMETROS/";
declare namespace xf = "http://tempuri.org/ITEL/Resources/XQueries/consultarParametrosGenerales_Req_ConsultarParametrosBS/";

declare function xf:consultarParametrosGenerales_Req_ConsultarParametrosBS($input_Parameters1 as element(ns1:Input_Parameters))
    as element(ns0:InputParameters) {
        <ns0:InputParameters>
            <ns0:P_PARNOMBRE>{ data($input_Parameters1/PARNOMBRE) }</ns0:P_PARNOMBRE>
        </ns0:InputParameters>
};

declare variable $input_Parameters1 as element(ns1:Input_Parameters) external;

xf:consultarParametrosGenerales_Req_ConsultarParametrosBS($input_Parameters1)
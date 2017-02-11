(:: pragma bea:global-element-parameter parameter="$input_Parameters1" element="ns0:Input_Parameters" location="../Schemas/PS_ITEL_CONSULTAR_PARAMETROS_BB.xsd" ::)
(:: pragma bea:global-element-return element="ns1:InputParameters" location="../Schemas/BD_CONSULTAR_PARAMETROS_BB.xsd" ::)

declare namespace ns1 = "http://xmlns.oracle.com/pcbpel/adapter/db/sp/bd_consultarParametrosBB";
declare namespace ns0 = "http://www.comcel.com.co/consultarParametrosBB/";
declare namespace xf = "http://tempuri.org/ITEL/Core/Resources/XQueries/consultarParametrosBB_Req/";

declare function xf:consultarParametrosBB_Req($input_Parameters1 as element(ns0:Input_Parameters))
    as element(ns1:InputParameters) {
        <ns1:InputParameters>
            <ns1:P_OFFER_BB>{ data($input_Parameters1/OFFER_BB) }</ns1:P_OFFER_BB>
        </ns1:InputParameters>
};

declare variable $input_Parameters1 as element(ns0:Input_Parameters) external;

xf:consultarParametrosBB_Req($input_Parameters1)

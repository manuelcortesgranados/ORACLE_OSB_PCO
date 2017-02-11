(:: pragma bea:global-element-parameter parameter="$input_Parameters1" element="ns1:Input_Parameters" location="../Schemas/PS_ITEL_CONSULTARANGOTELMEX.xsd" ::)
(:: pragma bea:global-element-return element="ns0:InputParameters" location="../Schemas/BD_ITEL_RANGOTELMEX.xsd" ::)

declare namespace ns1 = "http://www.comcel.com.co/ConsultarRangoTelmex/";
declare namespace ns0 = "http://xmlns.oracle.com/pcbpel/adapter/db/SYSADM/SP_RANGO_TELMEX/";
declare namespace xf = "http://tempuri.org/ITEL/BSCS/Resources/XQueries/consultarRangoTelmex_Req/";

declare function xf:consultarRangoTelmex_Req($input_Parameters1 as element(ns1:Input_Parameters))
    as element(ns0:InputParameters) {
        <ns0:InputParameters>
            <ns0:NUMERO>{ fn:substring(data($input_Parameters1/NUMERO),3) }</ns0:NUMERO>
        </ns0:InputParameters>
};

declare variable $input_Parameters1 as element(ns1:Input_Parameters) external;

xf:consultarRangoTelmex_Req($input_Parameters1)
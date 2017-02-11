(:: pragma bea:global-element-parameter parameter="$input_Parameters1" element="ns0:Input_Parameters" location="../Schemas/PS_ITEL_CONSULTARPAQUETES_TAT.xsd" ::)
(:: pragma bea:global-element-return element="ns1:InputParameters" location="../Schemas/BD_ITEL_CONSULTAR_PAQUETES_TAT.xsd" ::)

declare namespace ns1 = "http://xmlns.oracle.com/pcbpel/adapter/db/sp/bd_consultarPaquetesTAT";
declare namespace ns0 = "http://www.comcel.com.co/ConsultarPaquetesTAT/";
declare namespace xf = "http://tempuri.org/ITEL/Core/Resources/XQueries/consultarPaquetesTAT_Req/";

declare function xf:consultarPaquetesTAT_Req($input_Parameters1 as element(ns0:Input_Parameters))
    as element(ns1:InputParameters) {
        <ns1:InputParameters>
            <ns1:P_CODIGO>{ data($input_Parameters1/CODIGO) }</ns1:P_CODIGO>
        </ns1:InputParameters>
};

declare variable $input_Parameters1 as element(ns0:Input_Parameters) external;

xf:consultarPaquetesTAT_Req($input_Parameters1)
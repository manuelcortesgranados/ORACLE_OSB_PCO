(:: pragma bea:global-element-parameter parameter="$input_Parameters1" element="ns0:Input_Parameters" location="../Schemas/PS_ITEL_CONSULTARPLANESOCS.xsd" ::)
(:: pragma bea:global-element-return element="ns1:InputParameters" location="../Schemas/BD_ITEL_CONSULTAR_PLANESOCS.xsd" ::)

declare namespace ns1 = "http://xmlns.oracle.com/pcbpel/adapter/db/ITELSOA/PKG_SOA_ITEL/PRC_CONSULTAR_PLANESOCS/";
declare namespace ns0 = "http://www.comcel.com.co/ConsultarPlanesOCS";
declare namespace xf = "http://tempuri.org/ITEL/Core/Resources/XQueries/consultarPlanesOCS_Req/";

declare function xf:consultarPlanesOCS_Req($input_Parameters1 as element(ns0:Input_Parameters))
    as element(ns1:InputParameters) {
        <ns1:InputParameters>
            <ns1:P_TMTMCODE>{ data($input_Parameters1/*:TMTMCODE) }</ns1:P_TMTMCODE>
            <ns1:P_TMSPCODE>{ data($input_Parameters1/*:TMSPCODE) }</ns1:P_TMSPCODE>
        </ns1:InputParameters>
};

declare variable $input_Parameters1 as element(ns0:Input_Parameters) external;

xf:consultarPlanesOCS_Req($input_Parameters1)
(:: pragma bea:global-element-parameter parameter="$input_Parameters1" element="ns1:Input_Parameters" location="../Schemas/PS_ITEL_REGISTRO_PAQUETESBB.xsd" ::)
(:: pragma bea:global-element-return element="ns0:InputParameters" location="../Schemas/BD_ITEL_REGISTRO_PAQUETESBB.xsd" ::)

declare namespace ns1 = "http://www.comcel.com.co/registroPaquetesBB/";
declare namespace ns0 = "http://xmlns.oracle.com/pcbpel/adapter/db/sp/bd_registroPaquetesBB";
declare namespace xf = "http://tempuri.org/ITEL/Core/Resources/XQueries/registroPaquetesBB_Req/";

declare function xf:registroPaquetesBB_Req($input_Parameters1 as element(ns1:Input_Parameters))
    as element(ns0:InputParameters) {
        <ns0:InputParameters>
            <ns0:P_OFFER_BB>{ data($input_Parameters1/OFFER_BB) }</ns0:P_OFFER_BB>
            <ns0:P_MIN>{ data($input_Parameters1/MIN) }</ns0:P_MIN>
            <ns0:P_ESTADO>{ data($input_Parameters1/ESTADO) }</ns0:P_ESTADO>
            <ns0:P_VIGENCIA>{ data($input_Parameters1/VIGENCIA) }</ns0:P_VIGENCIA>
        </ns0:InputParameters>
};

declare variable $input_Parameters1 as element(ns1:Input_Parameters) external;

xf:registroPaquetesBB_Req($input_Parameters1)

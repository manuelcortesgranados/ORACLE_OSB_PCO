(:: pragma bea:global-element-parameter parameter="$input_Parameters1" element="ns0:Input_Parameters" location="../Schemas/PS_ITEL_CONSULTAR_PAQUETESADD_BB.xsd" ::)
(:: pragma bea:global-element-return element="ns1:InputParameters" location="../Schemas/BD_CONSULTAR_PAQUETESADD_BB.xsd" ::)

declare namespace ns1 = "http://xmlns.oracle.com/pcbpel/adapter/db/sp/bd_consultarPaquetesAdd";
declare namespace ns0 = "http://www.comcel.com.co/consultarPaquetesAddBB/";
declare namespace xf = "http://tempuri.org/ITEL/Core/Resources/XQueries/consultarPaquetesAdd_Req/";

declare function xf:consultarPaquetesAdd_Req($input_Parameters1 as element(ns0:Input_Parameters))
    as element(ns1:InputParameters) {
        <ns1:InputParameters>
            <ns1:P_MIN>{ data($input_Parameters1/MIN) }</ns1:P_MIN>
        </ns1:InputParameters>
};

declare variable $input_Parameters1 as element(ns0:Input_Parameters) external;

xf:consultarPaquetesAdd_Req($input_Parameters1)

(:: pragma bea:global-element-parameter parameter="$input_Parameters1" element="ns1:Input_Parameters" location="../Schemas/PS_ITEL_CONSULTAR_MODIFICACION_ELEGIDOS.xsd" ::)
(:: pragma bea:global-element-return element="ns0:InputParameters" location="../Schemas/BD_ITEL_CONSULTAR_MODELEGIDOS.xsd" ::)

declare namespace ns1 = "http://www.comcel.com.co/consultarModificacionElegidos/";
declare namespace ns0 = "http://xmlns.oracle.com/pcbpel/adapter/db/SYSTEM/PKG_SOA_ITEL/PRC_CONSULTAR_MODELEGIDOS/";
declare namespace xf = "http://tempuri.org/ITEL/Core/Resources/XQueries/consultarModificacionElegidos_Req/";

declare function xf:consultarModificacionElegidos_Req($input_Parameters1 as element(ns1:Input_Parameters))
    as element(ns0:InputParameters) {
        <ns0:InputParameters>
            <ns0:P_MIN>{ data($input_Parameters1/MIN) }</ns0:P_MIN>
            <ns0:P_MES>{ data($input_Parameters1/MES) }</ns0:P_MES>
            <ns0:P_ANIO>{ data($input_Parameters1/ANIO) }</ns0:P_ANIO>
        </ns0:InputParameters>
};

declare variable $input_Parameters1 as element(ns1:Input_Parameters) external;

xf:consultarModificacionElegidos_Req($input_Parameters1)
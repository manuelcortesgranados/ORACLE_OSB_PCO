(:: pragma bea:global-element-parameter parameter="$input_Parameters" element="ns1:Input_Parameters" location="../Schemas/PS_ITEL_ACTUALIZARMINELEGIDOS.xsd" ::)
(:: pragma bea:global-element-return element="ns0:InputParameters" location="../Schemas/BD_ITEL_ACTUALIZARMINELEGIDOS.xsd" ::)

declare namespace ns1 = "http://www.comcel.com.co/ActualizarMinElegidos/";
declare namespace ns0 = "http://xmlns.oracle.com/pcbpel/adapter/db/SOA_TEST/PKG_SOA_ITEL/PRC_ACTUALIZAR_MIN_ELEGIDOS/";
declare namespace xf = "http://tempuri.org/ITEL/Trama600/Resources/XQueries/actualizarMinElegidos_Req_ActualizarMinElegidosBS/";

declare function xf:actualizarMinElegidos_Req_ActualizarMinElegidosBS($input_Parameters as element(ns1:Input_Parameters))
    as element(ns0:InputParameters) {
        <ns0:InputParameters>
            <ns0:P_MIN>{ data($input_Parameters/MIN) }</ns0:P_MIN>
            <ns0:P_NUEVO_MIN>{ data($input_Parameters/NUEVO_MIN) }</ns0:P_NUEVO_MIN>
        </ns0:InputParameters>
};

declare variable $input_Parameters as element(ns1:Input_Parameters) external;

xf:actualizarMinElegidos_Req_ActualizarMinElegidosBS($input_Parameters)
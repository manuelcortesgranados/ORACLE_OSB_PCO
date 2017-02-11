(:: pragma bea:global-element-parameter parameter="$input_Parameters" element="ns1:Input_Parameters" location="../Schemas/PS_ITEL_ACTUALIZARMINRECARGAESC.xsd" ::)
(:: pragma bea:global-element-return element="ns0:InputParameters" location="../Schemas/BD_ITEL_ACTUALIZARMINRECARGAESC.xsd" ::)

declare namespace ns1 = "http://www.comcel.com.co/ActualizarMinRecargaEsc/";
declare namespace ns0 = "http://xmlns.oracle.com/pcbpel/adapter/db/SOA_TEST/PKG_SOA_ITEL/PRC_ACTUALIZAR_MIN_RECARGAESC/";
declare namespace xf = "http://tempuri.org/ITEL/Trama600/Resources/XQueries/actualizarMinRecargaEsc_Req_ActualizarMinRecargaEscBS/";

declare function xf:actualizarMinRecargaEsc_Req_ActualizarMinRecargaEscBS($input_Parameters as element(ns1:Input_Parameters))
    as element(ns0:InputParameters) {
        <ns0:InputParameters>
            <ns0:P_MIN>{ data($input_Parameters/MIN) }</ns0:P_MIN>
        </ns0:InputParameters>
};

declare variable $input_Parameters as element(ns1:Input_Parameters) external;

xf:actualizarMinRecargaEsc_Req_ActualizarMinRecargaEscBS($input_Parameters)
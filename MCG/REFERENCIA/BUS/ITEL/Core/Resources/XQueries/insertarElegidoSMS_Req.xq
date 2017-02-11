(:: pragma bea:global-element-parameter parameter="$input_Parameters1" element="ns1:Input_Parameters" location="../Schemas/PS_ITEL_INSERTAR_ELEGIDOSMS.xsd" ::)
(:: pragma bea:global-element-return element="ns0:InputParameters" location="../Schemas/BD_ITEL_INSERTAR_ELEGIDOSMS.xsd" ::)

declare namespace ns1 = "http://www.comcel.com.co/InsertarElegidoSMS";
declare namespace ns0 = "http://xmlns.oracle.com/pcbpel/adapter/db/ITELSOA/PKG_SOA_ITEL/PRC_INSERTAR_ELEGIDO_SMS/";
declare namespace xf = "http://tempuri.org/ITEL/Core/Resources/XQueries/insertarElegidoSMS_Req/";

declare function xf:insertarElegidoSMS_Req($input_Parameters1 as element(ns1:Input_Parameters))
    as element(ns0:InputParameters) {
        <ns0:InputParameters>
            <ns0:P_MIN>{ data($input_Parameters1/MIN) }</ns0:P_MIN>
            <ns0:P_ELEGIDO>{ data($input_Parameters1/ELEGIDO) }</ns0:P_ELEGIDO>
            <ns0:P_ELEGIDOANTIGUO>{ data($input_Parameters1/ELEGIDOANTIGUO) }</ns0:P_ELEGIDOANTIGUO>
            <ns0:P_FECHACREACION>{ data($input_Parameters1/FECHACREACION) }</ns0:P_FECHACREACION>
            <ns0:P_VIGENCIA>{ data($input_Parameters1/VIGENCIA) }</ns0:P_VIGENCIA>
            <ns0:P_SUSCRIPCION>{ data($input_Parameters1/SUSCRIPCION) }</ns0:P_SUSCRIPCION>
        </ns0:InputParameters>
};

declare variable $input_Parameters1 as element(ns1:Input_Parameters) external;

xf:insertarElegidoSMS_Req($input_Parameters1)
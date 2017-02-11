(:: pragma bea:global-element-parameter parameter="$input_Parameters1" element="ns0:Input_Parameters" location="../Schemas/PS_ITEL_INSERTAR_AUDITORIAPROMOCINE.xsd" ::)
(:: pragma bea:global-element-return element="ns1:InputParameters" location="../Schemas/BD_ITEL_INSERTAR_AUDITORIAPROMOCINE.xsd" ::)

declare namespace ns1 = "http://xmlns.oracle.com/pcbpel/adapter/db/sp/bd_insertarAuditoriaPromoCine";
declare namespace ns0 = "http://www.comcel.com.co/insertarAuditoriaPromoCine";
declare namespace xf = "http://tempuri.org/ITEL/Core/Resources/XQueries/insertarAuditoriaPromoCine_Req/";

declare function xf:insertarAuditoriaPromoCine_Req($input_Parameters1 as element(ns0:Input_Parameters))
    as element(ns1:InputParameters) {
        <ns1:InputParameters>
            <ns1:MSISDN>{ data($input_Parameters1/MSISDN) }</ns1:MSISDN>
            <ns1:PIN>{ data($input_Parameters1/PIN) }</ns1:PIN>
            <ns1:CODIGO_NOTICACION>{ data($input_Parameters1/CODIGO_NOTICACION) }</ns1:CODIGO_NOTICACION>
            <ns1:DESCRIPCION_NOTIFICACION>{ data($input_Parameters1/DESCRIPCION_NOTIFICACION) }</ns1:DESCRIPCION_NOTIFICACION>
            <ns1:FECHA_ASIGNACION>{ data($input_Parameters1/FECHA_ASIGNACION) }</ns1:FECHA_ASIGNACION>
            <ns1:FECHA_RECARGA>{ data($input_Parameters1/FECHA_RECARGA) }</ns1:FECHA_RECARGA>
            <ns1:VALOR_RECARGA>{ data($input_Parameters1/VALOR_RECARGA) }</ns1:VALOR_RECARGA>
            <ns1:CONSECUTIVO>{ data($input_Parameters1/CONSECUTIVO) }</ns1:CONSECUTIVO>
            <ns1:HOSTID>{ data($input_Parameters1/HOSTID) }</ns1:HOSTID>
        </ns1:InputParameters>
};

declare variable $input_Parameters1 as element(ns0:Input_Parameters) external;

xf:insertarAuditoriaPromoCine_Req($input_Parameters1)
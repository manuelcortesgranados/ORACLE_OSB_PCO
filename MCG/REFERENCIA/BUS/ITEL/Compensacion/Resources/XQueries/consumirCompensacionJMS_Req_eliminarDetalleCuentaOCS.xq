xquery version "1.0" encoding "Cp1252";
(:: pragma bea:local-element-parameter parameter="$sERVICIO1" type="ns0:Input_Parameters/SERVICIOS_EJECUTADOS/SERVICIO" location="../Schemas/PS_ITEL_COMPENSACION.xsd" ::)
(:: pragma bea:global-element-return element="ns1:Input_Parameters" location="../../../OCS/AIR/Resources/Schemas/PS_ITEL_ELIMINAR_DETALLE_CUENTA.xsd" ::)

declare namespace xf = "http://tempuri.org/ITEL/Compensacion/Resources/XQueries/consumirCompensacionJMS_Req_eliminarDetalleCuentaOCS/";
declare namespace ns0 = "http://www.comcel.com.co/CompensacionITEL/";
declare namespace ns1 = "http://www.comcel.com.co/EliminarDetalleCuentaOCS/";

declare function xf:consumirCompensacionJMS_Req_eliminarDetalleCuentaOCS($sERVICIO1 as element())
    as element(ns1:Input_Parameters) {
        <ns1:Input_Parameters>
            <TIPO_NODO>{ data($sERVICIO1/PARAMETROS/PARAMETRO[NOMBRE='TIPO_NODO']/VALOR) }</TIPO_NODO>
            <HOST_ORIGEN>{ data($sERVICIO1/PARAMETROS/PARAMETRO[NOMBRE='HOST_ORIGEN']/VALOR) }</HOST_ORIGEN>
            <ID_TRANSACCION>{ data($sERVICIO1/PARAMETROS/PARAMETRO[NOMBRE='ID_TRANSACCION']/VALOR) }</ID_TRANSACCION>
            <FECHA_TRANSACCION>{ data($sERVICIO1/PARAMETROS/PARAMETRO[NOMBRE='FECHA_TRANSACCION']/VALOR) }</FECHA_TRANSACCION>
            <MIN>{ data($sERVICIO1/PARAMETROS/PARAMETRO[NOMBRE='MIN']/VALOR) }</MIN>
            <CAPABILITY>{ data($sERVICIO1/PARAMETROS/PARAMETRO[NOMBRE='CAPABILITY']/VALOR) }</CAPABILITY>
			<ACTION>{ data($sERVICIO1/PARAMETROS/PARAMETRO[NOMBRE='ACTION']/VALOR) }</ACTION>
		</ns1:Input_Parameters>        
};

declare variable $sERVICIO1 as element() external;

xf:consumirCompensacionJMS_Req_eliminarDetalleCuentaOCS($sERVICIO1)

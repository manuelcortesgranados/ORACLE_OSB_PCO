(:: pragma bea:local-element-parameter parameter="$Servicio1" type="ns1:Input_Parameters/SERVICIOS_EJECUTADOS/SERVICIO" location="../Schemas/PS_ITEL_COMPENSACION.xsd" ::)
(:: pragma bea:global-element-return element="ns0:Input_Parameters" location="../../../OCS/OLM/Resources/Schemas/PS_ITEL_ELIMINAR_ELEGIDOS.xsd" ::)

declare namespace ns1 = "http://www.comcel.com.co/CompensacionITEL/";
declare namespace ns0 = "http://www.comcel.com.co/EliminarElegidosOCS/";
declare namespace xf = "http://tempuri.org/ITEL/Compensacion/Resources/XQueries/consumirCompensacionJMS_Req_eliminarElegidosOCS/";

declare function xf:consumirCompensacionJMS_Req_eliminarElegidosOCS($Servicio1 as element())
    as element(ns0:Input_Parameters) {
        <ns0:Input_Parameters>
        	<REQUESTID>{ data($Servicio1/PARAMETROS/PARAMETRO[NOMBRE="REQUESTID"]/VALOR) }</REQUESTID>
            <OPERATION>unregisterElegido</OPERATION>
            <PRODUCTNAME>{ data($Servicio1/PARAMETROS/PARAMETRO[NOMBRE="PRODUCTNAME"]/VALOR) }</PRODUCTNAME>
            <SUBSCRIBERID>{ data($Servicio1/PARAMETROS/PARAMETRO[NOMBRE="SUBSCRIBERID"]/VALOR) }</SUBSCRIBERID>
            <MSISDN>{ data($Servicio1/PARAMETROS/PARAMETRO[NOMBRE="MSISDN"]/VALOR) }</MSISDN>
            <ORIGINATINGNODEINFO>{ data($Servicio1/PARAMETROS/PARAMETRO[NOMBRE="ORIGINATINGNODEINFO"]/VALOR) }</ORIGINATINGNODEINFO>
            <EXTERNALDATA>{ data($Servicio1/PARAMETROS/PARAMETRO[NOMBRE="EXTERNALDATA"]/VALOR) }</EXTERNALDATA>
            <CHARGED>no</CHARGED>
            <FAFIDLIST>{ data($Servicio1/PARAMETROS/PARAMETRO[NOMBRE="FAFIDLIST"]/VALOR) }</FAFIDLIST>
            <MSISDNELEGIDOTOUNREGISTER>{
            	<Detail>{data($Servicio1/PARAMETROS/PARAMETRO[NOMBRE="MSISDNELEGIDOTOREGISTER"]/VALOR)}</Detail>
            }</MSISDNELEGIDOTOUNREGISTER>
        </ns0:Input_Parameters>
};

declare variable $Servicio1 as element() external;

xf:consumirCompensacionJMS_Req_eliminarElegidosOCS($Servicio1)
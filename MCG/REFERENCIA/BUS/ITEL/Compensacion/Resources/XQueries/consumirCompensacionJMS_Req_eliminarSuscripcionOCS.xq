(:: pragma bea:local-element-parameter parameter="$sERVICIO1" type="ns1:Input_Parameters/SERVICIOS_EJECUTADOS/SERVICIO" location="../Schemas/PS_ITEL_COMPENSACION.xsd" ::)
(:: pragma bea:global-element-return element="ns0:Input_Parameters" location="../../../OCS/OLM/Resources/Schemas/PS_ITEL_ELIMINAR_SUSCRIPCION.xsd" ::)

declare namespace ns1 = "http://www.comcel.com.co/CompensacionITEL/";
declare namespace ns0 = "http://www.comcel.com.co/EliminarSuscripcionOCS/";
declare namespace xf = "http://tempuri.org/ITEL/Compensacion/Resources/XQueries/consumirCompensacionJMS_Req_eliminarSuscripcionOCS/";

declare function xf:consumirCompensacionJMS_Req_eliminarSuscripcionOCS($sERVICIO1 as element())
    as element(ns0:Input_Parameters) {
        <ns0:Input_Parameters>
        	<REQUESTID>{ data($sERVICIO1/PARAMETROS/PARAMETRO[NOMBRE="REQUESTID"]/VALOR) }</REQUESTID>
            <OPERATION>cancelSubscription</OPERATION>
            <PRODUCTNAME>{ data($sERVICIO1/PARAMETROS/PARAMETRO[NOMBRE="PRODUCTNAME"]/VALOR) }</PRODUCTNAME>
            <SUBSCRIBERID>{ data($sERVICIO1/PARAMETROS/PARAMETRO[NOMBRE="SUBSCRIBERID"]/VALOR) }</SUBSCRIBERID>
            <MSISDN>{ data($sERVICIO1/PARAMETROS/PARAMETRO[NOMBRE="MSISDN"]/VALOR) }</MSISDN>
            <CANCELTYPE>active</CANCELTYPE>
            <ORIGINATINGNODEINFO>ITEL</ORIGINATINGNODEINFO>
            <EXTERNALDATA>external</EXTERNALDATA>
        </ns0:Input_Parameters>
};

declare variable $sERVICIO1 as element() external;

xf:consumirCompensacionJMS_Req_eliminarSuscripcionOCS($sERVICIO1)
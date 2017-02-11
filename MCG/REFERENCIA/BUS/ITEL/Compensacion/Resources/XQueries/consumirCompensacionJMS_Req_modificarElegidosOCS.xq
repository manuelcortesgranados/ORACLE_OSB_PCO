(:: pragma bea:local-element-parameter parameter="$servicio" type="ns1:Input_Parameters/SERVICIOS_EJECUTADOS/SERVICIO" location="../Schemas/PS_ITEL_COMPENSACION.xsd" ::)
(:: pragma bea:global-element-return element="ns0:Input_Parameters" location="../../../OCS/OLM/Resources/Schemas/PS_ITEL_MODIFICAR_ELEGIDOS.xsd" ::)

declare namespace ns1 = "http://www.comcel.com.co/CompensacionITEL/";
declare namespace ns0 = "http://www.comcel.com.co/ModificarElegidosOCS/";
declare namespace xf = "http://tempuri.org/ITEL/Compensacion/Resources/XQueries/consumirCompensacion_Req_modificarElegidosOCS/";

declare function xf:consumirCompensacion_Req_modificarElegidosOCS($servicio as element())
    as element(ns0:Input_Parameters) {
        <ns0:Input_Parameters>
            <REQUESTID>{ data($servicio/PARAMETROS/PARAMETRO[NOMBRE="REQUESTID"]/VALOR) }</REQUESTID>
            <OPERATION>{ data($servicio/PARAMETROS/PARAMETRO[NOMBRE="OPERATION"]/VALOR) }</OPERATION>
            <PRODUCTNAME>{ data($servicio/PARAMETROS/PARAMETRO[NOMBRE="PRODUCTNAME"]/VALOR) }</PRODUCTNAME>
            <SUBSCRIBERID>{ data($servicio/PARAMETROS/PARAMETRO[NOMBRE="SUBSCRIBERID"]/VALOR) }</SUBSCRIBERID>
            <MSISDN>{ data($servicio/PARAMETROS/PARAMETRO[NOMBRE="MSISDN"]/VALOR) }</MSISDN>
            <MSISDNELEGIDOTOREGISTER>
                { $servicio/PARAMETROS/PARAMETRO[NOMBRE='MSISDNELEGIDOTOREPLACE']/VALOR/node() }
            </MSISDNELEGIDOTOREGISTER>
            <MSISDNELEGIDOTOREPLACE>
            	{ $servicio/PARAMETROS/PARAMETRO[NOMBRE='MSISDNELEGIDOTOREGISTER']/VALOR/node() }
            </MSISDNELEGIDOTOREPLACE>
            <ORIGINATINGNODEINFO>{ data($servicio/PARAMETROS/PARAMETRO[NOMBRE="ORIGINATINGNODEINFO"]/VALOR) }</ORIGINATINGNODEINFO>
            <EXTERNALDATA>{ data($servicio/PARAMETROS/PARAMETRO[NOMBRE="EXTERNALDATA"]/VALOR) }</EXTERNALDATA>
            <CHARGED>no</CHARGED>
            <FAFIDLIST>{ data($servicio/PARAMETROS/PARAMETRO[NOMBRE="FAFIDLIST"]/VALOR) }</FAFIDLIST>
        </ns0:Input_Parameters>
};

declare variable $servicio as element() external;

xf:consumirCompensacion_Req_modificarElegidosOCS($servicio)
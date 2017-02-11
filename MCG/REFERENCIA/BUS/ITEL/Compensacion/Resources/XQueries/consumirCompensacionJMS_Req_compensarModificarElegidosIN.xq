(:: pragma bea:local-element-parameter parameter="$servicio" type="ns2:Input_Parameters/SERVICIOS_EJECUTADOS/SERVICIO" location="../Schemas/PS_ITEL_COMPENSACION.xsd" ::)
(:: pragma bea:global-element-return element="ns0:Input_Parameters" location="../../../IN/Resources/Schemas/PS_ITEL_COMPENSAR_MODIFICARELEGIDOS.xsd" ::)

declare namespace ns2 = "http://www.comcel.com.co/CompensacionITEL/";
declare namespace ns0 = "http://www.comcel.com.co/CompensarModificarElegidosIN/";
declare namespace xf = "http://tempuri.org/ITEL/Compensacion/Resources/XQueries/consumirCompensacionJMS_Req_compensarModificarElegidosIN/";

declare function xf:consumirCompensacionJMS_Req_compensarModificarElegidosIN($servicio as element())
    as element(ns0:Input_Parameters) {
        <ns0:Input_Parameters>
            <PREFIX>{ data($servicio/PARAMETROS/PARAMETRO[NOMBRE='PREFIX']/VALOR) }</PREFIX>
            <MIN>{ data($servicio/PARAMETROS/PARAMETRO[NOMBRE='MIN']/VALOR) }</MIN>
            <ELEGIDOS>{ $servicio/PARAMETROS/PARAMETRO[NOMBRE='ELEGIDOS']/VALOR/node() }</ELEGIDOS>
            <ELEGIDOS_ORIGINALES>{ $servicio/PARAMETROS/PARAMETRO[NOMBRE='ELEGIDOS_ORIGINALES']/VALOR/node() }</ELEGIDOS_ORIGINALES>
            <ELEGIDOS_REMOVER>{ $servicio/PARAMETROS/PARAMETRO[NOMBRE='ELEGIDOS_REMOVER']/VALOR/node() }</ELEGIDOS_REMOVER>
            {
            if( fn:exists($servicio/PARAMETROS/PARAMETRO[NOMBRE='DIAS_VIGENCIA'])) then
            	<DIAS_VIGENCIA>{ data($servicio/PARAMETROS/PARAMETRO[NOMBRE='DIAS_VIGENCIA']/VALOR) }</DIAS_VIGENCIA>
            else
            	()	
            }
            <USUARIO>{ data($servicio/PARAMETROS/PARAMETRO[NOMBRE='USUARIO']/VALOR) }</USUARIO>
            <TIQUETE>{ data($servicio/PARAMETROS/PARAMETRO[NOMBRE='TIQUETE']/VALOR) }</TIQUETE>
            <REQUESTOR_ID>{ data($servicio/PARAMETROS/PARAMETRO[NOMBRE='REQUESTOR_ID']/VALOR) }</REQUESTOR_ID>
            <ILIMITADOS>{ data($servicio/PARAMETROS/PARAMETRO[NOMBRE='ILIMITADOS']/VALOR) }</ILIMITADOS>
            <ACTIVACION>{ data($servicio/PARAMETROS/PARAMETRO[NOMBRE='ACTIVACION']/VALOR) }</ACTIVACION>
            <REMOVER_TODOS>{ data($servicio/PARAMETROS/PARAMETRO[NOMBRE='REMOVER_TODOS']/VALOR) }</REMOVER_TODOS>
            <IN>{ data($servicio/PARAMETROS/PARAMETRO[NOMBRE='IN']/VALOR) }</IN>
            <VIGENCIA_ELEGIDO>{ data($servicio/PARAMETROS/PARAMETRO[NOMBRE='VIGENCIA_ELEGIDO']/VALOR) }</VIGENCIA_ELEGIDO>
            <FECHA_EXPIRACION_ELEGIDO>{ data($servicio/PARAMETROS/PARAMETRO[NOMBRE='FECHA_EXPIRACION_ELEGIDO']/VALOR) }</FECHA_EXPIRACION_ELEGIDO>
        </ns0:Input_Parameters>
};

declare variable $servicio as element() external;

xf:consumirCompensacionJMS_Req_compensarModificarElegidosIN($servicio)
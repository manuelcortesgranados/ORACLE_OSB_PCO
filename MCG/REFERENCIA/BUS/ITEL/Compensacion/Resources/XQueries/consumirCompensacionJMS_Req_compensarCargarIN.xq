(:: pragma bea:local-element-parameter parameter="$servicio" type="ns2:Input_Parameters/SERVICIOS_EJECUTADOS/SERVICIO" location="../Schemas/PS_ITEL_COMPENSACION.xsd" ::)
(:: pragma bea:global-element-return element="ns0:Input_Parameters" location="../../../IN/Resources/Schemas/PS_ITEL_COMPENSAR_CARGAR.xsd" ::)

declare namespace ns2 = "http://www.comcel.com.co/CompensacionITEL/";
declare namespace ns0 = "http://www.comcel.com.co/CompensarCargarIN/";
declare namespace xf = "http://tempuri.org/ITEL/Compensacion/Resources/XQueries/consumirCompensacionJMS_Req_compensarCargarIN/";

declare function xf:consumirCompensacionJMS_Req_compensarCargarIN($servicio as element(), $fechaExpiracion as xs:string)
    as element(ns0:Input_Parameters) {
        <ns0:Input_Parameters>
        	<FECHA_EXPIRACION>{ $fechaExpiracion }</FECHA_EXPIRACION>
            <PREFIJO>{ data($servicio/PARAMETROS/PARAMETRO[NOMBRE='PREFIJO']/VALOR) }</PREFIJO>
            <MIN>{ data($servicio/PARAMETROS/PARAMETRO[NOMBRE='MIN']/VALOR) }</MIN>
            <POLITICA_EXPIRACION>{ data($servicio/PARAMETROS/PARAMETRO[NOMBRE='POLITICA_EXPIRACION']/VALOR) }</POLITICA_EXPIRACION>
            <DIAS_EXTENSION>{ data($servicio/PARAMETROS/PARAMETRO[NOMBRE='DIAS_EXTENSION']/VALOR) }</DIAS_EXTENSION>
            <FECHA_ABSOLUTA>{ data($servicio/PARAMETROS/PARAMETRO[NOMBRE='FECHA_ABSOLUTA']/VALOR) }</FECHA_ABSOLUTA>
            <CUENTA>{ data($servicio/PARAMETROS/PARAMETRO[NOMBRE='CUENTA']/VALOR) }</CUENTA>
            <VALOR>{ data($servicio/PARAMETROS/PARAMETRO[NOMBRE='VALOR']/VALOR) }</VALOR>
            <USUARIO>{ data($servicio/PARAMETROS/PARAMETRO[NOMBRE='USUARIO']/VALOR) }</USUARIO>
            <TIQUETE>{ data($servicio/PARAMETROS/PARAMETRO[NOMBRE='TIQUETE']/VALOR) }</TIQUETE>
            <TIQUETE_COMPENSACION>{ data($servicio/PARAMETROS/PARAMETRO[NOMBRE='TIQUETE_COMPENSACION']/VALOR) }</TIQUETE_COMPENSACION>
            <REQUESTOR_ID>{ data($servicio/PARAMETROS/PARAMETRO[NOMBRE='REQUESTOR_ID']/VALOR) }</REQUESTOR_ID>
            <IN>{ data($servicio/PARAMETROS/PARAMETRO[NOMBRE='IN']/VALOR) }</IN>
        </ns0:Input_Parameters>
};

declare variable $fechaExpiracion as xs:string external;
declare variable $servicio as element() external;

xf:consumirCompensacionJMS_Req_compensarCargarIN($servicio, $fechaExpiracion)
(:: pragma bea:schema-type-parameter parameter="$servicioEjecutado" type="ns1:servicioType" location="../Schemas/PS_ITEL_COMPENSACION.xsd" ::)
(:: pragma bea:global-element-return element="ns0:Input_Parameters" location="../../../IN/Resources/Schemas/PS_ITEL_COMPENSAR_CARGAR.xsd" ::)
(:: pragma bea:global-element-return element="ns2:Cargar" location="../../../IN/Resources/Schemas/PS_ITEL_CARGAR.xsd" ::)

declare namespace ns2 = "http://www.comcel.com.co/CargarIN/";
declare namespace ns1 = "http://www.comcel.com.co/CompensacionITEL/";
declare namespace ns0 = "http://www.comcel.com.co/CompensarIN/";
declare namespace xf = "http://tempuri.org/ITEL/Compensacion/Resources/XQueries/consumirCompensacionJMS_Req_compensarIN/";

declare function xf:adaptarCarga_Recarga($fechaExpiracion as xs:string,
    $servicioEjecutado as element(), $tipoOperacion as xs:string)
    as element(ns2:Cargar){
    	<ns2:Cargar>
    		<OPERACION>{ $tipoOperacion }</OPERACION>
    		<FECHA_EXPIRACION>{ $fechaExpiracion }</FECHA_EXPIRACION>
            <PREFIJO>{ data($servicioEjecutado/PARAMETROS/PARAMETRO[1]/VALOR) }</PREFIJO>
            <MIN>{ data($servicioEjecutado/PARAMETROS/PARAMETRO[2]/VALOR) }</MIN>
            <POLITICA_EXPIRACION>{ data($servicioEjecutado/PARAMETROS/PARAMETRO[3]/VALOR) }</POLITICA_EXPIRACION>
            <DIAS_EXTENSION>{ data($servicioEjecutado/PARAMETROS/PARAMETRO[4]/VALOR) }</DIAS_EXTENSION>
            <FECHA_ABSOLUTA>{ data($servicioEjecutado/PARAMETROS/PARAMETRO[5]/VALOR) }</FECHA_ABSOLUTA>
            <CUENTA>{ data($servicioEjecutado/PARAMETROS/PARAMETRO[6]/VALOR) }</CUENTA>
            <VALOR>{ data($servicioEjecutado/PARAMETROS/PARAMETRO[7]/VALOR) }</VALOR>
            <USUARIO>{ data($servicioEjecutado/PARAMETROS/PARAMETRO[8]/VALOR) }</USUARIO>
            <TIQUETE>{ data($servicioEjecutado/PARAMETROS/PARAMETRO[9]/VALOR) }</TIQUETE>
            <TIQUETE_COMPENSACION>{ data($servicioEjecutado/PARAMETROS/PARAMETRO[10]/VALOR) }</TIQUETE_COMPENSACION>
            <REQUESTOR_ID>{ data($servicioEjecutado/PARAMETROS/PARAMETRO[11]/VALOR) }</REQUESTOR_ID>
            <IN>{ data($servicioEjecutado/PARAMETROS/PARAMETRO[12]/VALOR) }</IN>
        </ns2:Cargar>
    };
    
declare function xf:consumirCompensacionJMS_Req_compensarIN($fechaExpiracion as xs:string,
    $servicioEjecutado as element())
    as element(ns0:Input_Parameters) {
        <ns0:Input_Parameters>
                {
                    if (data($servicioEjecutado/NOMBRE) = "ITEL/IN/Proxies/recargarINLocal_PS") then
                    	xf:adaptarCarga_Recarga($fechaExpiracion,$servicioEjecutado,"carga")
                    else if (data($servicioEjecutado/NOMBRE) = "ITEL/IN/Proxies/cargarINLocal_PS") then
                    	xf:adaptarCarga_Recarga($fechaExpiracion,$servicioEjecutado,"recarga")
                    else ()
                }
            
        </ns0:Input_Parameters>
};

declare variable $fechaExpiracion as xs:string external;
declare variable $servicioEjecutado as element() external;

xf:consumirCompensacionJMS_Req_compensarIN($fechaExpiracion,
    $servicioEjecutado)
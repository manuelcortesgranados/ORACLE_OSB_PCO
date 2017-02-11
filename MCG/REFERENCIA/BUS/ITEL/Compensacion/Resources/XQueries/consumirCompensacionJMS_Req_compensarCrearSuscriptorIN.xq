(:: pragma bea:global-element-parameter parameter="$input_Parameters1" element="ns2:Input_Parameters" location="../Schemas/PS_ITEL_COMPENSACION.xsd" ::)
(:: pragma bea:global-element-return element="ns1:Input_Parameters" location="../../../IN/Resources/Schemas/PS_ITEL_COMPENSAR_CREARSUSCRIPTOR.xsd" ::)

declare namespace ns2 = "http://www.comcel.com.co/CompensacionITEL/";
declare namespace ns1 = "http://www.comcel.com.co/CompensarCrearSuscriptorIN/";
declare namespace ns0 = "http://www.comcel.com.co/IN/OperacionCorba";
declare namespace xf = "http://tempuri.org/ITEL/Compensacion/Resources/XQueries/consumirCompensacionJMS_Req_compensarCrearSuscriptorIN/";

declare function xf:consumirCompensacionJMS_Req_compensarCrearSuscriptorIN($fechaExpiracion as xs:string,
$servicioEjecutado as element())
    as element(ns1:Input_Parameters) {
        <ns1:Input_Parameters>
                    <PREFIJO>{data($servicioEjecutado/PARAMETROS/PARAMETRO[NOMBRE='PREFIJO']/VALOR)}</PREFIJO>
                    <MIN>{data($servicioEjecutado/PARAMETROS/PARAMETRO[NOMBRE='MIN']/VALOR)}</MIN>
                    <IN>{data($servicioEjecutado/PARAMETROS/PARAMETRO[NOMBRE='IN']/VALOR)}</IN>
        </ns1:Input_Parameters>
};

declare variable $fechaExpiracion as xs:string external;
declare variable $servicioEjecutado as element() external;

xf:consumirCompensacionJMS_Req_compensarCrearSuscriptorIN($fechaExpiracion,
    $servicioEjecutado)
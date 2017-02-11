xquery version "1.0" encoding "Cp1252";
(:: pragma bea:global-element-parameter parameter="$mensajeCompensacion" element="ns1:Input_Parameters" location="../Schemas/PS_ITEL_COMPENSACION.xsd" ::)
(:: pragma bea:local-element-parameter parameter="$servicioEnEjecucion" type="ns1:Input_Parameters/SERVICIOS_EJECUTADOS/SERVICIO" location="../Schemas/PS_ITEL_COMPENSACION.xsd" ::)

declare namespace xf = "http://tempuri.org/ITEL/Compensacion/Resources/XQueries/calcularFechaExpiracion/";
declare namespace ns1 = "http://www.comcel.com.co/CompensacionITEL/";
declare namespace ns0 = "http://www.comcel.com.co/IN/OperacionCorba";

declare function xf:calcularFechaExpiracion($mensajeCompensacion as element(ns1:Input_Parameters),
    $servicioEjecutado as element())
    as xs:string {
    	let $metodo := data($mensajeCompensacion/METODO)
    	let $operacion := xf:obtenerOperacion(data($servicioEjecutado/NOMBRE))
    	let $suscriptor := xf:obtenerSuscriptor($metodo, $operacion, $mensajeCompensacion)
    	let $tempCuenta := if($metodo = '601') then  data($servicioEjecutado/PARAMETROS/PARAMETRO[NOMBRE='CARGA']/VALOR/CUENTA)
    	                   else data($servicioEjecutado/PARAMETROS/PARAMETRO[6]/VALOR)
    	let $cuenta := xf:obtenerCuenta($tempCuenta, $suscriptor)
    	return
    		xf:formatearFecha(data($cuenta/ns0:ExpiryDate))
};

declare function xf:obtenerOperacion($nombreServicio as xs:string)
	as xs:string {
		if ($nombreServicio = "ITEL/IN/Proxies/recargarINLocal_PS") then
			"Recargar"
		else if ($nombreServicio = "ITEL/IN/Proxies/cargarINLocal_PS") then
			"Cargar"
		else
			""
};

declare function xf:obtenerSuscriptor($metodo as xs:string,
	$operacion as xs:string,
	$mensajeCompensacion as element(ns1:Input_Parameters))
	as element() {
		if ($metodo = "200" or $metodo = "301" or $metodo = "302" or $metodo = "303" or $metodo = "305" or $metodo = "306" or $metodo = "307" or $metodo = "308" or $metodo = "309" or $metodo = "400" or $metodo = "403" or $metodo = "405" or $metodo = "406" or $metodo = "601" or $metodo = "701" or $metodo = "702" or $metodo = "703" or $metodo = "705" or $metodo = "409") then
			$mensajeCompensacion/SUSCRIPTOR_DESTINO
		else if ($metodo = "401" or $metodo = "402") then
			if ($operacion = "Cargar") then
	    		$mensajeCompensacion/SUSCRIPTOR_ORIGEN
	    	else if ($operacion = "Recargar") then
	    		$mensajeCompensacion/SUSCRIPTOR_DESTINO
	    	else ()
		else ()
};

declare function xf:obtenerCuenta($cuenta as xs:long,
	$suscriptor as element())
	as element() {
		if ($cuenta = 1) then
			$suscriptor/ns0:OnPeakAccountID
		else if ($cuenta = 2) then
			$suscriptor/ns0:OffPeakAccountID
		else if ($cuenta = 3) then
			$suscriptor/ns0:FreeSMSAccountID
		else if ($cuenta = 4) then
			$suscriptor/ns0:BonusAccountID
		else if ($cuenta = 5) then
			$suscriptor/ns0:MonetaryAccountID2
		else if ($cuenta = 6) then
			$suscriptor/ns0:MonetaryAccountID3
		else if ($cuenta = 7) then
			$suscriptor/ns0:MinutesAccountID2
		else if ($cuenta = 8) then
			$suscriptor/ns0:MinutesAccountID3
		else if ($cuenta = 9) then
			$suscriptor/ns0:MinutesAccountID4
		else ()
};

declare function xf:formatearFecha($fechaExpiracion as xs:string)
	as xs:string {
		let $dia := fn:substring($fechaExpiracion, 9, 2)
    	let $mes := fn:substring($fechaExpiracion, 6, 2)
    	let $anio := fn:substring($fechaExpiracion, 1, 4)
    	let $hora := fn:substring($fechaExpiracion, 11)
    	return
    		concat($dia, ".", $mes, ".", $anio, $hora)
};

declare variable $mensajeCompensacion as element(ns1:Input_Parameters) external;
declare variable $servicioEjecutado as element() external;

xf:calcularFechaExpiracion($mensajeCompensacion,
    $servicioEjecutado)
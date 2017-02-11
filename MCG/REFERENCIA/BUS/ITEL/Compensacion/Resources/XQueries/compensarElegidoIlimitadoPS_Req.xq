(:: pragma bea:global-element-return element="ns0:Input_Parameters" location="../Schemas/PS_ITEL_COMPENSAR_ELEGIDOILIMITADO.xsd" ::)

declare namespace ns0 = "http://www.comcel.com.co/CompensarElegidoIlimitado/";
declare namespace xf = "http://tempuri.org/ITEL/Core/Resources/XQueries/compensarElegidoIlimitadoPS_Req/";

declare function xf:compensarElegidoIlimitadoPS_Req($min as xs:decimal,
    $elegido as xs:string,
    $elegidoAntiguo as xs:string,
    $fechaCreacion as xs:string,
    $fechaExpiracion as xs:string,
    $vigencia as xs:string)
    as element(ns0:Input_Parameters) {
        <ns0:Input_Parameters>
            <MIN>{ $min }</MIN>
            <BESTFNF>{ $elegido }</BESTFNF>
            <OLDBESTFNF>{ $elegidoAntiguo }</OLDBESTFNF>
            <FECHACREACION>{ fn:substring($fechaCreacion,1, 10) }</FECHACREACION>
            <FECHAEXPIRACION>{ fn:substring($fechaExpiracion,1, 10) }</FECHAEXPIRACION>
            <VIGENCIA>{ $vigencia }</VIGENCIA>
        </ns0:Input_Parameters>
};

declare variable $min as xs:decimal external;
declare variable $elegido as xs:string external;
declare variable $elegidoAntiguo as xs:string external;
declare variable $fechaCreacion as xs:string external;
declare variable $fechaExpiracion as xs:string external;
declare variable $vigencia as xs:string external;

declare function xf:calcularFechaExpiracion($fechaCreacion as xs:string, $vigencia as xs:decimal)
	as xs:string {
		let $dia := fn:substring($fechaCreacion, 9, 2)
    	let $mes := fn:substring($fechaCreacion, 6, 2)
    	let $anio := fn:substring($fechaCreacion, 1, 4)
    	let $hora := fn:substring($fechaCreacion, 11)
    	let $anioTemp := fn:floor($vigencia div 12)  + xs:decimal($anio)
    	let $mesTemp := ($vigencia mod 12) + xs:decimal($mes) 
    	return
    		concat( if($mesTemp > 12) then $anioTemp + 1 else $anioTemp, 
    				"-", 
    				if($mesTemp > 12) then $mesTemp - 12 else $mesTemp, 
    				"-",
    				$dia,
    				$hora)
};

xf:compensarElegidoIlimitadoPS_Req($min,
    $elegido,
    $elegidoAntiguo,
    $fechaCreacion,
    $fechaExpiracion,
    $vigencia)
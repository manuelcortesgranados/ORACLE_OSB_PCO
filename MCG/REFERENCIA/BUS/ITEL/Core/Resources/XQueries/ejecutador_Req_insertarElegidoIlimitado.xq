(:: pragma bea:global-element-return element="ns0:Input_Parameters" location="../Schemas/PS_ITEL_INSERTAR_ELEGIDO_ILIMITADO.xsd" ::)

declare namespace ns0 = "http://www.comcel.com.co/PS_INSERTAR_ELEGIDO_ILIMITADO";
declare namespace xf = "http://tempuri.org/ITEL/Core/Resources/XQueries/ejecutador_Req_insertarElegidoIlimitado/";

declare function xf:ejecutador_Req_insertarElegidoIlimitado($min as xs:decimal,
    $elegido as xs:string,
    $elegidoAntiguo as xs:string,
    $fechaCreacion as xs:string,
    $vigencia as xs:string,
    $proceso as xs:string)
    as element(ns0:Input_Parameters) {
        <ns0:Input_Parameters>
            <MIN>{ $min }</MIN>
            <BESTFNF>{ $elegido }</BESTFNF>
            <OLDBESTFNF>{ $elegidoAntiguo }</OLDBESTFNF>
            <FECHACREACION>{ $fechaCreacion }</FECHACREACION>
            <VIGENCIA>{ $vigencia }</VIGENCIA>
            <PROCESO>{ $proceso }</PROCESO>
        </ns0:Input_Parameters>
};

declare variable $min as xs:decimal external;
declare variable $elegido as xs:string external;
declare variable $elegidoAntiguo as xs:string external;
declare variable $fechaCreacion as xs:string external;
declare variable $vigencia as xs:string external;
declare variable $proceso as xs:string external;

declare function xf:calcularFechaExpiracion($fechaCreacion as xs:string, $vigencia as xs:decimal)
	as xs:string {
		let $dia := fn:substring($fechaCreacion, 9, 2)
    	let $mes := fn:substring($fechaCreacion, 6, 2)
    	let $anio := fn:substring($fechaCreacion, 1, 4)
    	let $hora := fn:substring($fechaCreacion, 11)
    	let $anioTemp := fn:floor($vigencia div 12)  + xs:decimal($anio)
    	let $mesTemp := ($vigencia mod 12) + xs:decimal($mes) 
    	let $mesFinal := if($mesTemp > 12) then $mesTemp - 12 else $mesTemp
    	return
    		concat( if($mesTemp > 12) then $anioTemp + 1 else $anioTemp, 
    				"-", 
    				if($mesFinal < 10) then concat('0', $mesFinal) else $mesFinal, 
    				"-",
    				$dia,
    				$hora)
};

xf:ejecutador_Req_insertarElegidoIlimitado($min,
    $elegido,
    $elegidoAntiguo,
    $fechaCreacion,
    $vigencia,
    $proceso)
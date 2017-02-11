xquery version "1.0" encoding "Cp1252";
(:: pragma  parameter="$elegido" type="xs:string" ::)
(:: pragma  parameter="$lista" type="xs:anyType" ::)

declare namespace xf = "http://tempuri.org/ITEL/Core/Resources/XQueries/validarElegido/";

declare function xf:validarElegido($elegido as xs:string,
    $tipo as xs:string,
    $fafList as element(*))
    as xs:string {
        let $fafIndicador       := $fafList/MENSAJE/CONSULTAR_FAFLIST/fafInformationList/Detail
			let $fafNumbers     := fn:string-join((for $faf in $fafIndicador where contains($faf/fafIndicator, $tipo) return $faf/DetailNumber/fafNumber),";")
			let $fafNumberSplit := fn:tokenize($fafNumbers, ';')
			let $elegidoSplit   := fn:tokenize($elegido, ';')
			
			let $valida := string((for $fNumber in $fafNumberSplit
							return 
							  for $ele in $elegidoSplit where $ele = $fNumber
							  return 
							   $ele))
			return
			    if (data($valida) = '') then data("0") else data("1")
};

declare variable $elegido as xs:string external;
declare variable $tipo as xs:string external;
declare variable $fafList as element(*) external;

xf:validarElegido($elegido,
    $tipo,
    $fafList)
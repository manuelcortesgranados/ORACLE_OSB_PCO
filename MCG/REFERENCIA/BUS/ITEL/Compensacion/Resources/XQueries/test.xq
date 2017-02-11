xquery version "1.0" encoding "Cp1252";
(:: pragma bea:local-element-parameter parameter="$servicio" type="ns0:Input_Parameters/SERVICIOS_EJECUTADOS/SERVICIO" location="../Schemas/PS_ITEL_COMPENSACION.xsd" ::)

declare namespace xf = "http://tempuri.org/ITEL/Compensacion/Resources/XQueries/test/";
declare namespace ns0 = "http://www.comcel.com.co/CompensacionITEL/";

declare function xf:test($servicio as element())
    as xs:string {
       (:fn:string-join(data($servicio/PARAMETROS/PARAMETRO[NOMBRE='ELEGIDOS_ORIGINALES']/VALOR/*:Detail), ";"):)
       let $secuencia := ("1234567890", "10666650", "300", "6"),
        $cantidad  := for $item in $secuencia
                      where fn:string-length($item) !=  10
                      return $item
   		return
       string(fn:count($cantidad))
};

declare variable $servicio as element() external;

xf:test($servicio)
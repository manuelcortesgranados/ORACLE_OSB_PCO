(:: pragma bea:global-element-return element="ns0:Input_Parameters" location="../Schemas/PS_ITEL_PAQUETESRECURRENTES.xsd" ::)

declare namespace ns0 = "http://www.comcel.com.co/PaquetesRecurrentes/";
declare namespace xf = "http://tempuri.org/ITEL/Core/Resources/XQueries/paquetesRecurrentesPS_Req/";

declare function xf:paquetesRecurrentesPS_Req($min as xs:string,
   			$servicio as xs:string)
    as element(ns0:Input_Parameters) {
        <ns0:Input_Parameters>
            <ACCION_IN>1</ACCION_IN>
            <MIN_IN>{ $min }</MIN_IN>
            <DCORTE_IN>{ day-from-date(fn:current-date()) }</DCORTE_IN>
            <SERVICIO_IN>{ $servicio }</SERVICIO_IN>
            <NO_VALIDA_IN>0</NO_VALIDA_IN>
        </ns0:Input_Parameters>
};


declare variable $min as xs:string external;
declare variable $servicio as xs:string external;


xf:paquetesRecurrentesPS_Req($min,
    $servicio)
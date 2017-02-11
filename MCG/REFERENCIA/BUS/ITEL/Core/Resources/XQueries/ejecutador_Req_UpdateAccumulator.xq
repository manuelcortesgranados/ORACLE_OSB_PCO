(:: pragma bea:global-element-parameter parameter="$input_Parameters1" element="ns0:Input_Parameters" location="../Schemas/PS_ITEL_EJECUTADOR.xsd" ::)
(:: pragma bea:global-element-return element="ns2:Input_Parameters" location="../../../OCS/AIR/Resources/Schemas/PS_ITEL_ACTUALIZAR_ACCUMULATOR.xsd" ::)

declare namespace ns2 = "http://www.comcel.com.co/ActualizarAccumulatorOCS/";
declare namespace ns1 = "http://www.comcel.com.co/OCS/OperacionOCS_AIR";
declare namespace ns4 = "http://www.comcel.com.co/OCS/OperacionCorbaOCS";
declare namespace ns3 = "http://www.comcel.com.co/IN/OperacionCorba";
declare namespace ns0 = "http://www.comcel.com.co/Ejecutador/";
declare namespace xf = "http://tempuri.org/ITEL/Core/Resources/XQueries/ejecutador_Req_UpdateAccumulator/";

declare function xf:ejecutador_Req_UpdateAccumulator($input_Parameters1 as element(ns0:Input_Parameters))
    as element(ns2:Input_Parameters) {
        <ns2:Input_Parameters>
            <TIPO_NODO>{ "EXT" }</TIPO_NODO>
            <HOST_ORIGEN>{ "ITEL" }</HOST_ORIGEN>
            <ID_TRANSACCION>{ "12345" }</ID_TRANSACCION>
            <FECHA_TRANSACCION>{  local:format-dateTime(fn:current-dateTime()) }</FECHA_TRANSACCION>
            <MIN>{ concat("57", data($input_Parameters1/MIN_DESTINO)) }</MIN>
            <ACCUMULATOR_UPDATE_INFORMATION>
                <ACCUMULATOR_VALUE>{ "0" }</ACCUMULATOR_VALUE>
                <ACCUMULATORID>{ fn:tokenize(data($input_Parameters1/PARAMETROS_TRAMA/PARAMETRO[NOMBRE="PAQUETERTC"]/VALOR), ";")[2] }</ACCUMULATORID>
            </ACCUMULATOR_UPDATE_INFORMATION>
        </ns2:Input_Parameters>
};

declare function local:pad2($number as xs:integer) as xs:string {
    if ($number<10) then concat("0",$number) else string($number) };
    
declare function local:timezone-from-duration
  ( $duration as xdt:dayTimeDuration? )  as xs:string {

   if (string($duration) = ('PT0S','-PT0S'))
   then 'Z'
   else if (matches(string($duration),'-PT[1-9]H'))
   then replace(string($duration),'PT([1-9])H','0$100')
   else if (matches(string($duration),'PT[1-9]H'))
   then replace(string($duration),'PT([1-9])H','+0$100')
   else if (matches(string($duration),'-PT1[0-4]H'))
   then replace(string($duration),'PT(1[0-4])H','$100')
   else if (matches(string($duration),'PT1[0-4]H'))
   then replace(string($duration),'PT(1[0-4])H','+$100')
   else error(xs:QName('functx:Invalid_Duration_Value'))
 } ;
 
declare function local:format-dateTime($dateTime as xs:dateTime) as xs:string {
    let $year := fn:year-from-dateTime($dateTime)
    let $month := fn:month-from-dateTime($dateTime)
    let $day := fn:day-from-dateTime($dateTime)
    let $hour := fn:hours-from-dateTime($dateTime)
    let $min := fn:minutes-from-dateTime($dateTime)
    let $sec := xs:int(floor(fn:seconds-from-dateTime($dateTime)))
    let $time := local:timezone-from-duration(fn:timezone-from-dateTime($dateTime))
    
return
concat($year,local:pad2($month),local:pad2($day),"T",local:pad2($hour),":",local:pad2($min),":",local:pad2($sec),$time)
};

declare variable $input_Parameters1 as element(ns0:Input_Parameters) external;

xf:ejecutador_Req_UpdateAccumulator($input_Parameters1)

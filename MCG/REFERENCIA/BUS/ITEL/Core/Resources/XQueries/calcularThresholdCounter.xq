(:: pragma bea:global-element-parameter parameter="$Paquetes" element="ns3:WS_Result" location="../Schemas/PS_ITEL_CONSULTARPAQUETES_TAT.xsd" ::)
(:: pragma bea:global-element-parameter parameter="$Ofertas" element="ns1:WS_Result" location="../../../OCS/AIR/Resources/Schemas/PS_ITEL_CONSULTAR_OFFER.xsd" ::)
(:: pragma bea:global-element-parameter parameter="$ThresholdCounter" element="ns2:WS_Result" location="../../../OCS/AIR/Resources/Schemas/PS_ITEL_CONSULTAR_UCyUT.xsd" ::)
(:: pragma bea:global-element-return element="ns3:WS_Result" location="../Schemas/PS_ITEL_CONSULTARPAQUETES_TAT.xsd" ::)

declare namespace ns2 = "http://www.comcel.com.co/ConsultarUCyUTOCS/";
declare namespace ns1 = "http://www.comcel.com.co/ConsultarOfferOCS/";
declare namespace ns3 = "http://www.comcel.com.co/ConsultarPaquetesTAT/";
declare namespace ns0 = "http://www.comcel.com.co/OCS/OperacionOCS_AIR";
declare namespace xf = "http://tempuri.org/ITEL/Core/Resources/XQueries/calcularThresholdCounter/";

declare function local:pad2($number as xs:integer) as xs:string {
    if ($number<10) then concat("0",$number) else string($number)
};

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
};
 
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

declare function local:calcularFecha($segundos as xs:string, $fecha as xs:dateTime) as xs:string {
	let $dias := xs:string(xs:long($segundos) div 60 div 60 div 24)
	return
	    concat(fn-bea:dateTime-to-string-with-format("yyyyMMdd'T'HH:mm:ss",fn-bea:add-timezone-to-dateTime($fecha, xdt:dayTimeDuration(concat("-P",$dias,"D")))),"-0500")
    	
};

declare function xf:calcularCodigoPaqueteAIR($codigo_paquete as xs:string, $ofertas as element(ns1:WS_Result), $thresholdCounter as element(ns2:WS_Result)) as xs:string{
	let $encontro := if(contains($ofertas/MENSAJE/CONSULTAR_OFFER/*:offerInformationList, fn:tokenize($codigo_paquete, ";")[1])) then 1 else 0
	return
	if ($encontro = 0) then  
		concat($codigo_paquete,";0;",local:format-dateTime(fn:current-dateTime()),";",
		local:calcularFecha(fn:tokenize($codigo_paquete, ";")[5], fn:current-dateTime()),";",fn:tokenize($codigo_paquete, ";")[4]) 
	else 
		let $fechaSTR :=  for $offer in  $ofertas/MENSAJE/CONSULTAR_OFFER/*:offerInformationList/*:Detail
									where (data($offer/*:offerType) = fn:tokenize($codigo_paquete, ";")[1])
											return	data($offer/*:expiryDate)
										
		let $fechaExp := fn-bea:dateTime-from-string-with-format("yyyyMMdd'T'HH:mm:ss-SSSS", $fechaSTR)
		for $uCTI in $thresholdCounter/MENSAJE/CONSULTAR_UCyUT/*:usageCounterUsageThresholdInformation/*:usageCounterUsageThresholdInformation			
				where(data($uCTI/*:usageCounterID) = fn:tokenize($codigo_paquete, ";")[2]) return
					if(xs:long($uCTI/*:usageCounterValue) >= xs:long(fn:tokenize($codigo_paquete, ";")[4])) then
						concat($codigo_paquete,";0;",
						concat(fn-bea:dateTime-to-string-with-format("yyyyMMdd'T'HH:mm:ss",$fechaExp),"-0500"),";",
						local:calcularFecha(fn:tokenize($codigo_paquete, ";")[5], $fechaExp),";",fn:tokenize($codigo_paquete, ";")[4]) 
					else
						concat(fn:tokenize($codigo_paquete, ";")[1],";",fn:tokenize($codigo_paquete, ";")[2],";",
						fn:tokenize($codigo_paquete, ";")[3],";",
						xs:long(fn:tokenize($codigo_paquete, ";")[4]) + xs:long($uCTI/*:usageThresholdInformation/*:usageThresholdValue),";",
						fn:tokenize($codigo_paquete, ";")[5],";1;",
						concat(fn-bea:dateTime-to-string-with-format("yyyyMMdd'T'HH:mm:ss",$fechaExp),"-0500"),";",
						local:calcularFecha(fn:tokenize($codigo_paquete, ";")[5], $fechaExp),";",fn:tokenize($codigo_paquete, ";")[4]) 
				
																				
};

declare function xf:calcularThresholdCounter($Paquetes as element(ns3:WS_Result),
    $Ofertas as element(ns1:WS_Result),
    $ThresholdCounter as element(ns2:WS_Result))
    as element(ns3:WS_Result) {
        <ns3:WS_Result>
            <CODIGO>{ data($Paquetes/CODIGO) }</CODIGO>
            <MENSAJE>
                <VALOR>{ data($Paquetes/MENSAJE/VALOR) }</VALOR>
                <HOSTID>{ data($Paquetes/MENSAJE/HOSTID) }</HOSTID>
                <COMENTARIO>{ data($Paquetes/MENSAJE/COMENTARIO) }</COMENTARIO>
                <TIPO>{ data($Paquetes/MENSAJE/TIPO) }</TIPO> 
                <NOTIFICACION>{ data($Paquetes/MENSAJE/NOTIFICACION) }</NOTIFICACION>                
                <PAQUETES>
                    {
                        for $PAQUETE in $Paquetes/MENSAJE/PAQUETES/PAQUETE
                        return
                        if(data($PAQUETE/PLATAFORMA) != 'AIR') then
                            <PAQUETE>
                            	<CODIGO_PAQUETE>{ data($PAQUETE/CODIGO_PAQUETE) }</CODIGO_PAQUETE>
                                <PLATAFORMA>{ data($PAQUETE/PLATAFORMA) }</PLATAFORMA>
                            </PAQUETE>
                        else
                         <PAQUETE>
                            	<CODIGO_PAQUETE>{ xf:calcularCodigoPaqueteAIR(data($PAQUETE/CODIGO_PAQUETE),$Ofertas,$ThresholdCounter) }</CODIGO_PAQUETE>
                                <PLATAFORMA>{ data($PAQUETE/PLATAFORMA) }</PLATAFORMA>
                         </PAQUETE>
                    }
                </PAQUETES>
            </MENSAJE>
            <DESCRIPCION>{ data($Paquetes/DESCRIPCION) }</DESCRIPCION>
        </ns3:WS_Result>
};

declare variable $Paquetes as element(ns3:WS_Result) external;
declare variable $Ofertas as element(ns1:WS_Result) external;
declare variable $ThresholdCounter as element(ns2:WS_Result) external;

xf:calcularThresholdCounter($Paquetes,
    $Ofertas,
    $ThresholdCounter)

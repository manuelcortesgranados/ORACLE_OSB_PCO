xquery version "1.0" encoding "Cp1252";
(:: pragma bea:global-element-parameter parameter="$input_Parameters1" element="ns0:Input_Parameters" location="../Schemas/PS_ITEL_CONSULTAR_SUSCRIPTOR.xsd" ::)
(:: pragma bea:schema-type-return type="methodCall" location="../../../AIR/Resources/Schemas/DA_ITEL_OPERACION_OCS_TYPES.xsd" ::)

declare namespace xf = "http://tempuri.org/ITEL/OCS/SOI/Resources/XQueries/consultarSuscriptorAIR_Req/";
declare namespace ns1 = "http://www.comcel.com.co/OCS/OperacionTypes";
declare namespace ns0 = "http://www.comcel.com.co/ConsultarSuscriptorOCS/";

declare function xf:consultarSuscriptorAIR_Req($input_Parameters1 as element(ns0:Input_Parameters))
    as element() {
    		<methodCall>
				<methodName>GetAccountDetails</methodName>
				<params>
				<param>
				<value>
				<struct>
				<member>
				<name>requestedInformationFlags</name>
				<value>
				<struct>
				<member>
				<name>requestMasterAccountBalanceFlag</name>
				<value>
				<boolean>1</boolean>
				</value>
				</member>
				</struct>
				</value>
				</member>
				<member>
				<name>subscriberNumberNAI</name>
				<value>
				<i4>1</i4>
				</value>
				</member>
				<member>
				<name>originNodeType</name>
				<value>
				<string>EXT</string>
				</value>
				</member>
				<member>
				<name>requestPamInformationFlag</name>
				<value>
				<boolean>1</boolean>
				</value>
				</member>
				<member>
				<name>originTransactionID</name>
				<value>
				<string>12345</string>
				</value>
				</member>
				<member>
				<name>subscriberNumber</name>
				<value>
				<string>{ concat('57',data($input_Parameters1/MIN)) }</string>
				</value>
				</member>
				<member>
				<name>originTimeStamp</name>
				<value>
				<dateTime.iso8601>{ local:format-dateTime(fn:current-dateTime()) }</dateTime.iso8601>
				</value>
				</member>
				<member>
				<name>originHostName</name>
				<value>
				<string>ITEL</string>
				</value>
				</member>
				<member>
				<name>messageCapabilityFlag</name>     
				<value>
				<struct> 
				<member> 
				<name>accountActivationFlag</name>
				<value>
				<boolean>0</boolean>
				</value>
				</member>
				</struct> 
				</value>      
				</member>
				</struct>
				</value>
				</param>
				</params>
	        </methodCall>
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

xf:consultarSuscriptorAIR_Req($input_Parameters1)
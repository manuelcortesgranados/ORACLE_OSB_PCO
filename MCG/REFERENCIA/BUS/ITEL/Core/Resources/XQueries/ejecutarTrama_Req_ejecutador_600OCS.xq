(:: pragma bea:global-element-parameter parameter="$validarResponse" element="ns1:WS_Result" location="../Schemas/PS_ITEL_VALIDARTRAMA.xsd" ::)
(:: pragma bea:global-element-parameter parameter="$reglasNegocioResponse" element="ns3:WS_Result" location="../Schemas/PS_ITEL_EJECUTARREGLASNEGOCIO.xsd" ::)
(:: pragma bea:global-element-return element="ns0:Input_Parameters" location="../Schemas/PS_ITEL_EJECUTADOR.xsd" ::)

declare namespace ns2 = "http://www.comcel.com.co/IN/OperacionCorba";
declare namespace ns1 = "http://www.comcel.com.co/ValidarTrama/";
declare namespace ns4 = "http://www.comcel.com.co/DA_TRAMA";
declare namespace ns3 = "http://www.comcel.com.co/EjecutarReglasNegocio/";
declare namespace ns0 = "http://www.comcel.com.co/Ejecutador/";
declare namespace xf = "http://tempuri.org/ITEL/Core/Resources/XQueries/ejecutarTrama_Req_ejecutador/";

declare function xf:expiryDateFormatter($expiryDate as xs:string) as xs:string{	
	concat(fn-bea:dateTime-to-string-with-format("yyyy-MM-dd", fn-bea:dateTime-from-string-with-format("yyyyMMdd'T'HH:mm:ss+SSSS", $expiryDate))," 23:59:59")
};

declare function xf:calcularSaldoCuentas($cuentasOCS as xs:string, $wS_Result as element(ns3:WS_Result)) as xs:integer{
	let $cuentasSplit := fn:tokenize($cuentasOCS, ";")
	return xs:integer(fn:sum(for $i in $cuentasSplit return
		if(data($wS_Result/MENSAJE/SUSCRIPTOR_OCS/BALANCES/DedicatedAccounts/Detail[Name=$i]/Balance)!= "") 
			then number($wS_Result/MENSAJE/SUSCRIPTOR_OCS/BALANCES/DedicatedAccounts/Detail[Name=$i]/Balance)
		else
			0))
};

declare function xf:calcularFechaMayor($cuentasOCS as xs:string, $wS_Result as element(ns3:WS_Result)) as xs:dateTime{	
	 max(for $i in fn:tokenize($cuentasOCS, ";") return
		if(data($wS_Result/MENSAJE/SUSCRIPTOR_OCS/BALANCES/DedicatedAccounts/Detail[Name=$i]/ExpiryDate)!= "" and data($wS_Result/MENSAJE/SUSCRIPTOR_OCS/BALANCES/DedicatedAccounts/Detail[Name=$i]/ExpiryDate)!= "99991231T12:00:00+0000") 
			then fn-bea:dateTime-from-string-with-format("yyyyMMdd'T'HH:mm:ss+SSSS", data($wS_Result/MENSAJE/SUSCRIPTOR_OCS/BALANCES/DedicatedAccounts/Detail[Name=$i]/ExpiryDate))
		else
			fn-bea:dateTime-from-string-with-format("yyyyMMdd'T'HH:mm:ss+SSSS","19700101T23:59:59+0000"))	
																				
};

declare function xf:calcularFechaOCS($fechaOCS as xs:string) as xs:string{
	if(fn-bea:dateTime-from-string-with-format("yyyyMMdd'T'HH:mm:ss+SSSS", $fechaOCS) > current-dateTime()) then
		$fechaOCS
	else
		concat(fn-bea:dateTime-to-string-with-format("yyyyMMdd'T'",current-dateTime()),"12:00:00+0000")
};

declare function xf:cuentaVigenteOCS($fechaOCS as xs:string) as xs:boolean{
	if($fechaOCS != '') then(
			if(fn-bea:dateTime-from-string-with-format("yyyyMMdd'T'HH:mm:ss+SSSS", $fechaOCS) > current-dateTime()) then
				xs:boolean('true')
			else
				xs:boolean('false')
	)else (xs:boolean('false'))
};

declare function xf:AIRDateConverter($fechaIN as xs:string) as xs:string{
	fn-bea:dateTime-to-string-with-format("yyyyMMdd'T'HH:mm:ss+SSSS", fn-bea:dateTime-from-string-with-format("yyyy-MM-dd HH:mm:ss", $fechaIN))
};

declare function xf:swapOrigenDestino($data as element(ns1:WS_Result))
as element(ns0:Input_Parameters)
{
let $metodo := data($data/MENSAJE/TRAMA/ns4:METODO)
let $Origen := data($data/MENSAJE/TRAMA/ns4:PARAMETROS/ns4:MINORIGEN)
let $Destino := data($data/MENSAJE/TRAMA/ns4:MIN)
let $inOrigen := data($data/MENSAJE/IN_ORIGEN)
let $inDestino := data($data/MENSAJE/IN_DESTINO)
return 
   
      <ns0:Input_Parameters>
        <MIN_ORIGEN>{ $Destino }</MIN_ORIGEN>
        <MIN_DESTINO>{ $Origen } </MIN_DESTINO>
        <IN_ORIGEN>{$inDestino}</IN_ORIGEN>
        <IN_DESTINO>{$inOrigen}</IN_DESTINO>
      </ns0:Input_Parameters>
   
};


declare function xf:ejecutarTrama_Req_ejecutador($validarResponse as element(ns1:WS_Result),
    $reglasNegocioResponse as element(ns3:WS_Result),
    $tiempoInicio as xs:dateTime)
    as element(ns0:Input_Parameters) {
        <ns0:Input_Parameters>
            <METODO>{ data($validarResponse/MENSAJE/TRAMA/ns4:METODO) }</METODO>
            <MIN_DESTINO>{ data(xf:swapOrigenDestino($validarResponse)/*:MIN_DESTINO) }</MIN_DESTINO>
            <MIN_ORIGEN>{ data(xf:swapOrigenDestino($validarResponse)/*:MIN_ORIGEN) }</MIN_ORIGEN>
            <IN_DESTINO>{ data(xf:swapOrigenDestino($validarResponse)/*:IN_DESTINO) }</IN_DESTINO>
            <IN_ORIGEN>{ data(xf:swapOrigenDestino($validarResponse)/*:IN_ORIGEN) }</IN_ORIGEN>
            <CONSECUTIVO>{ data($validarResponse/MENSAJE/TRAMA/ns4:PARAMETROS/ns4:CONSECUTIVO) }</CONSECUTIVO>
            <PARAMETROS_TRAMA>
             	{    
             	if(number(xf:swapOrigenDestino($validarResponse)/*:IN_DESTINO) >= 50 
             		and number(xf:swapOrigenDestino($validarResponse)/*:IN_ORIGEN) < 50) then (       
                <PARAMETRO>
                    <NOMBRE>CONTRATO</NOMBRE>
                    <TIPO>string</TIPO>
                    <VALOR>{ data($reglasNegocioResponse/MENSAJE/SUSCRIPTOR_DESTINO/*:CONTRACT_TEMPLATE) }</VALOR>
                </PARAMETRO>,   
                <PARAMETRO>
                    <NOMBRE>ACC_GRP_ID</NOMBRE>
                    <TIPO>string</TIPO>
                    <VALOR>{ data($reglasNegocioResponse/MENSAJE/SUSCRIPTOR_DESTINO/*:FAFIDGROUP) }</VALOR>
               	</PARAMETRO>,
		        <PARAMETRO>
		             <NOMBRE>TEMPORARY_BLOCKED</NOMBRE>
		             <TIPO>string</TIPO>
		             <VALOR>{ data($reglasNegocioResponse/MENSAJE/SUSCRIPTOR_DESTINO/*:IsLocked)}</VALOR>
		        </PARAMETRO>,
		        <PARAMETRO>
		             <NOMBRE>SDP</NOMBRE>
		             <TIPO>string</TIPO>
		             <VALOR>{ data($validarResponse/MENSAJE/*:VIGENCIA) }</VALOR>
		        </PARAMETRO>        
		        ) else()
		        }
		        {    
             	if(number(xf:swapOrigenDestino($validarResponse)/*:IN_DESTINO) >= 50 
             		and number(xf:swapOrigenDestino($validarResponse)/*:IN_ORIGEN) >= 50) then (       
                <PARAMETRO>
                    <NOMBRE>CONTRATO</NOMBRE>
                    <TIPO>string</TIPO>
                    <VALOR>{ data($reglasNegocioResponse/MENSAJE/SUSCRIPTOR_OCS/*:DATOS_SUSCRIPTOR/*:CONTRACT_TEMPLATE) }</VALOR>
                </PARAMETRO>,   
                <PARAMETRO>
                    <NOMBRE>ACC_GRP_ID</NOMBRE>
                    <TIPO>string</TIPO>
                    <VALOR>{ data($reglasNegocioResponse/MENSAJE/SUSCRIPTOR_OCS/*:DATOS_SUSCRIPTOR/*:FAFIDGROUP) }</VALOR>
               	</PARAMETRO>,
		        <PARAMETRO>
		             <NOMBRE>TEMPORARY_BLOCKED</NOMBRE>
		             <TIPO>string</TIPO>
		             <VALOR>{ if( data($reglasNegocioResponse/MENSAJE/SUSCRIPTOR_OCS/*:DATOS_SUSCRIPTOR/*:ContractStatus) = '3') then 'TRUE' else 'FALSE' }</VALOR>
		        </PARAMETRO>,
		        <PARAMETRO>
		             <NOMBRE>SDP</NOMBRE>
		             <TIPO>string</TIPO>
		             <VALOR>{ data($validarResponse/MENSAJE/*:VIGENCIA) }</VALOR>
		        </PARAMETRO>        
		        ) else(),
		        <PARAMETRO>
		             <NOMBRE>PLANES_SPR_RTC</NOMBRE>
		             <TIPO>string</TIPO>
		             <VALOR>{ data($validarResponse/MENSAJE/*:PLANES_SPR_RTC) }</VALOR>
		        </PARAMETRO>,
		        <PARAMETRO>
		             <NOMBRE>SERVICE_CLASS</NOMBRE>
		             <TIPO>string</TIPO>
		             <VALOR>{ data($reglasNegocioResponse/MENSAJE/SUSCRIPTOR_OCS/*:DATOS_SUSCRIPTOR/*:PublicRatePlanCode) }</VALOR>
		        </PARAMETRO>
		        }       
            </PARAMETROS_TRAMA>
            <PARAMETROS_NEGOCIO>
                {
                    for $PARAMETRO in $reglasNegocioResponse/MENSAJE/PARAMETROS_REGLAS/PARAMETRO
                    return
                        <PARAMETRO>{ $PARAMETRO/@* , $PARAMETRO/node() }</PARAMETRO>
                }
            </PARAMETROS_NEGOCIO>
            <SUSCRIPTOR_DESTINO></SUSCRIPTOR_DESTINO>
            <SUSCRIPTOR_ORIGEN>
            {    
             	if(number(xf:swapOrigenDestino($validarResponse)/*:IN_ORIGEN) >= 50 
             		and number(xf:swapOrigenDestino($validarResponse)/*:IN_DESTINO) < 50) then (  
             		<CUSTOMERID>{ fn:concat("1-101-57", xf:swapOrigenDestino($validarResponse)/*:MIN_DESTINO) }</CUSTOMERID>,
             		<Cgpa>{ fn:concat("57", xf:swapOrigenDestino($validarResponse)/*:MIN_DESTINO) }</Cgpa>,
             		<Contract>{data($reglasNegocioResponse/MENSAJE/SUSCRIPTOR_OCS/*:DATOS_SUSCRIPTOR/*:CONTRACT)}</Contract>,
             		<IsLocked>{ if( data($reglasNegocioResponse/MENSAJE/SUSCRIPTOR_OCS/*:DATOS_SUSCRIPTOR/*:ContractStatus) = '3') then 'TRUE' else 'FALSE'}</IsLocked>,
             		<IsFraudLocked>{ if( data($reglasNegocioResponse/MENSAJE/SUSCRIPTOR_OCS/*:DATOS_SUSCRIPTOR/*:RefillBarredUntil) != "") then 'TRUE' else 'FALSE'}</IsFraudLocked>,
             		<IsFirstCallPassed>TRUE</IsFirstCallPassed>,
             		<IsGPRSUsed>TRUE</IsGPRSUsed>,
             		<IsWelcomeBackPromoDone>TRUE</IsWelcomeBackPromoDone>,
             		<IsFnFPossible>{ if( fn:contains(data($reglasNegocioResponse/MENSAJE/SUSCRIPTOR_OCS/*:FAF_LIST), "FNF")) then 'TRUE' else 'FALSE'}</IsFnFPossible>,
             		<IsMLCPossible>TRUE</IsMLCPossible>,
             		<FnF_Numbers>
             				{
             					for $listaFAFIDs in $reglasNegocioResponse/MENSAJE/SUSCRIPTOR_OCS/FAF_LIST/fafInformationList/Detail
             					where fn:contains($listaFAFIDs, "FNF")
             					return for $listaFAF in $listaFAFIDs/DetailNumber/fafNumber return <Detail>{fn:substring(data($listaFAF),4)}</Detail>
             				}
             		</FnF_Numbers>,
             		<IsBestFnFPossible>{ if( fn:contains(data($reglasNegocioResponse/MENSAJE/SUSCRIPTOR_OCS/*:FAF_LIST), "ILIMITADO")) then 'TRUE' else 'FALSE'}</IsBestFnFPossible>,
             		<BestFnF_Numbers>
             				{
             					for $listaFAFIDs in $reglasNegocioResponse/MENSAJE/SUSCRIPTOR_OCS/FAF_LIST/fafInformationList/Detail
             					where fn:contains($listaFAFIDs, "ILIMITADO")
             					return for $listaFAF in $listaFAFIDs/DetailNumber/fafNumber return <Detail>{fn:substring(data($listaFAF),4)}</Detail>
             				}
             		</BestFnF_Numbers>,
             		<SMSOnNet_Numbers>
             				{
             					for $listaFAFIDs in $reglasNegocioResponse/MENSAJE/SUSCRIPTOR_OCS/FAF_LIST/fafInformationList/Detail
             					where fn:contains($listaFAFIDs, "SMS ONNET")
             					return for $listaFAF in $listaFAFIDs/DetailNumber/fafNumber return <Detail>{fn:substring(data($listaFAF),4)}</Detail>
             				}
             		</SMSOnNet_Numbers>,
             		<SMSOnNet_ExpirationDate>
             				{
             					for $listaFAFIDs in $reglasNegocioResponse/MENSAJE/SUSCRIPTOR_OCS/FAF_LIST/fafInformationList/Detail
             					where fn:contains($listaFAFIDs, "SMS ONNET")
             					return xf:expiryDateFormatter(data($listaFAFIDs/expiryDate))
             				}
             		</SMSOnNet_ExpirationDate>,
             		<SMSOffNet_Numbers>
             				{
             					for $listaFAFIDs in $reglasNegocioResponse/MENSAJE/SUSCRIPTOR_OCS/FAF_LIST/fafInformationList/Detail
             					where fn:contains($listaFAFIDs, "SMS OFFNET")
             					return for $listaFAF in $listaFAFIDs/DetailNumber/fafNumber return <Detail>{fn:substring(data($listaFAF),4)}</Detail>
             				}
             		</SMSOffNet_Numbers>,
             		<SMSOffNet_ExpirationDate>
             				{
             					for $listaFAFIDs in $reglasNegocioResponse/MENSAJE/SUSCRIPTOR_OCS/FAF_LIST/fafInformationList/Detail
             					where fn:contains($listaFAFIDs, "SMS OFFNET")
             					return data($listaFAFIDs/expiryDate)
             				}
             		</SMSOffNet_ExpirationDate>,
             		<SMSAny_Numbers>
             				{
             					for $listaFAFIDs in $reglasNegocioResponse/MENSAJE/SUSCRIPTOR_OCS/FAF_LIST/fafInformationList/Detail
             					where fn:contains($listaFAFIDs, "SMS ANY")
             					return for $listaFAF in $listaFAFIDs/DetailNumber/fafNumber return <Detail>{fn:substring(data($listaFAF),4)}</Detail>
             				}
             		</SMSAny_Numbers>,
             		<SMSAny_ExpirationDate>
             				{
             					for $listaFAFIDs in $reglasNegocioResponse/MENSAJE/SUSCRIPTOR_OCS/FAF_LIST/fafInformationList/Detail
             					where fn:contains($listaFAFIDs, "SMS ANY")
             					return xf:expiryDateFormatter(data($listaFAFIDs/expiryDate))
             				}
             		</SMSAny_ExpirationDate>,
             		<IsFAPossible>{ if( fn:contains(data($reglasNegocioResponse/MENSAJE/SUSCRIPTOR_OCS/*:FAF_LIST), "FA")) then 'TRUE' else 'FALSE'}</IsFAPossible>,
             		<FA_ActivationEndTime>
             				{
		             		for $listaFAFIDs in $reglasNegocioResponse/MENSAJE/SUSCRIPTOR_OCS/FAF_LIST/fafInformationList/Detail
		             					where fn:contains($listaFAFIDs, "FA")
		             					return xf:expiryDateFormatter(data($listaFAFIDs/expiryDate))
		            		}
		            </FA_ActivationEndTime>,
		            <FA_Destination>
		            		{
			            	for $listaFAFIDs in $reglasNegocioResponse/MENSAJE/SUSCRIPTOR_OCS/FAF_LIST/fafInformationList/Detail
	             					where fn:contains($listaFAFIDs, "FA")
	             					return for $listaFAF in $listaFAFIDs/DetailNumber/fafNumber return <Detail>{fn:substring(data($listaFAF),4)}</Detail>
	             			}				
	             	</FA_Destination>,	             					
             		<OnPeakAccountID>
             			<Balance>{
             				if(data($reglasNegocioResponse/MENSAJE/SUSCRIPTOR_OCS/BALANCES/accountValue)!= "") then
        		  				data($reglasNegocioResponse/MENSAJE/SUSCRIPTOR_OCS/BALANCES/accountValue)
        		 			else
        		 			 	"0"
        		 	   }</Balance>
             			<ExpiryDate>{
	             			if(data($reglasNegocioResponse/MENSAJE/SUSCRIPTOR_OCS/BALANCES/expiryDate) != "") then
	        		  			xf:expiryDateFormatter(data($reglasNegocioResponse/MENSAJE/SUSCRIPTOR_OCS/BALANCES/expiryDate))
	        		  		else 
	        		  			"1970-01-01 23:59:59"
             			}</ExpiryDate>             			
             		</OnPeakAccountID>,
             		<OffPeakAccountID>
             			<Balance>{xf:calcularSaldoCuentas("7003;10400;10401;10402;10403;7007;10404;10405;10406;10407;10408;10409;7010;7013", $reglasNegocioResponse)}</Balance>
             			<ExpiryDate>{concat(fn-bea:dateTime-to-string-with-format("yyyy-MM-dd",xf:calcularFechaMayor("7003;10400;10401;10402;10403;7007;10404;10405;10406;10407;10408;10409;7010;7013", $reglasNegocioResponse))," 23:59:59")}</ExpiryDate> 
             		</OffPeakAccountID>,
             		<FreeSMSAccountID>
             			<Balance>{xf:calcularSaldoCuentas("20130;20131;20132;20133;20001;20002;20003;20004;20005;20006;20007;20008;20009;20010;20011;20012;20013;20014;20015;20027;20018;20019;20016;20017", $reglasNegocioResponse)}</Balance>
             			<ExpiryDate>{concat(fn-bea:dateTime-to-string-with-format("yyyy-MM-dd",xf:calcularFechaMayor("20130;20131;20132;20133;20001;20002;20003;20004;20005;20006;20007;20008;20009;20010;20011;20012;20013;20014;20015;20027;20018;20019;20016;20017", $reglasNegocioResponse))," 23:59:59")}</ExpiryDate> 
             		</FreeSMSAccountID>,
             		<BonusAccountID>
             			<Balance>{xf:calcularSaldoCuentas("7000;10351;10350;10353;10361;10500;7001;7002;10421;7004;7005;7006;7008;7109;7009;7011;7012;7014", $reglasNegocioResponse)}</Balance>
             			<ExpiryDate>{concat(fn-bea:dateTime-to-string-with-format("yyyy-MM-dd",xf:calcularFechaMayor("7000;10351;10350;10353;10361;10500;7001;7002;10421;7004;7005;7006;7008;7109;7009;7011;7012;7014", $reglasNegocioResponse))," 23:59:59")}</ExpiryDate> 
             		</BonusAccountID>,
             		<MinutesAccountID2>
             			<Balance>{xf:calcularSaldoCuentas("10370;10371;10372;10373;10374", $reglasNegocioResponse)}</Balance>
             			<ExpiryDate>{concat(fn-bea:dateTime-to-string-with-format("yyyy-MM-dd",xf:calcularFechaMayor("10370;10371;10372;10373;10374", $reglasNegocioResponse))," 23:59:59")}</ExpiryDate>
             		</MinutesAccountID2>,	
             		<MinutesAccountID3>
             			<Balance>{xf:calcularSaldoCuentas("10380;10381;10382;10383;10384", $reglasNegocioResponse)}</Balance>
             			<ExpiryDate>{concat(fn-bea:dateTime-to-string-with-format("yyyy-MM-dd",xf:calcularFechaMayor("10380;10381;10382;10383;10384", $reglasNegocioResponse))," 23:59:59")}</ExpiryDate> 
             		</MinutesAccountID3>,
             		<MinutesAccountID4>
             			<Balance>{xf:calcularSaldoCuentas("10390;10391;10392;10393;10394", $reglasNegocioResponse)}</Balance>
             			<ExpiryDate>{concat(fn-bea:dateTime-to-string-with-format("yyyy-MM-dd",xf:calcularFechaMayor("10390;10391;10392;10393;10394", $reglasNegocioResponse))," 23:59:59")}</ExpiryDate>
             		</MinutesAccountID4>,
             		<MonetaryAccountID2>
             			<Balance>{xf:calcularSaldoCuentas("10422", $reglasNegocioResponse)}</Balance>
             			<ExpiryDate>{concat(fn-bea:dateTime-to-string-with-format("yyyy-MM-dd",xf:calcularFechaMayor("10422", $reglasNegocioResponse))," 23:59:59")}</ExpiryDate> 
             		</MonetaryAccountID2>,
             		<MonetaryAccountID3>
             			<Balance>0</Balance>
             			<ExpiryDate>1970-01-01 23:59:59</ExpiryDate>
             		</MonetaryAccountID3>,
             		<PreActiveEndDate>2037-12-31 23:59:59</PreActiveEndDate>,
             		<LastKnownPeriod>Grace</LastKnownPeriod>,
             		<ActiveEndDate>{fn:concat(fn-bea:date-to-string-with-format("yyyy-MM-dd",fn:current-date())," 23:59:59")}</ActiveEndDate>,
             		<GraceEndDate>2037-12-31 23:59:59</GraceEndDate>,
             		<BestFnF_ActivationEndTime>
             				{
		             		for $listaFAFIDs in $reglasNegocioResponse/MENSAJE/SUSCRIPTOR_OCS/FAF_LIST/fafInformationList/Detail
		             					where fn:contains($listaFAFIDs, "ILIMITADO")
		             					return xf:expiryDateFormatter(data($listaFAFIDs/expiryDate))
		            		}
             		</BestFnF_ActivationEndTime>
             		)
             	else()
            }
            </SUSCRIPTOR_ORIGEN>            
            <SUSCRIPTOR_OCS>
            {  if(number(xf:swapOrigenDestino($validarResponse)/*:IN_DESTINO) >= 50 
             	and number(xf:swapOrigenDestino($validarResponse)/*:IN_ORIGEN) < 50) 
             	then (
             		<BALANCES>{
             			if(number($reglasNegocioResponse/MENSAJE/SUSCRIPTOR_DESTINO/*:OnPeakAccountID/*:Balance) > 0 
             			or xf:cuentaVigenteOCS(xf:AIRDateConverter(data($reglasNegocioResponse/MENSAJE/SUSCRIPTOR_DESTINO/*:OnPeakAccountID/*:ExpiryDate)))) then (
	             			<accountValue>{data($reglasNegocioResponse/MENSAJE/SUSCRIPTOR_DESTINO/*:OnPeakAccountID/*:Balance)}</accountValue>,
	             			<expiryDate>{xf:calcularFechaOCS(xf:AIRDateConverter(data($reglasNegocioResponse/MENSAJE/SUSCRIPTOR_DESTINO/*:OnPeakAccountID/*:ExpiryDate)))}</expiryDate>
	             		)else(),
             			<DedicatedAccounts> 
             				{
             				if(number($reglasNegocioResponse/MENSAJE/SUSCRIPTOR_DESTINO/*:OffPeakAccountID/*:Balance) > 0
             				or xf:cuentaVigenteOCS(xf:AIRDateConverter(data($reglasNegocioResponse/MENSAJE/SUSCRIPTOR_DESTINO/*:OffPeakAccountID/*:ExpiryDate)))) then (
	             				<Detail>
	             					<Name>7001</Name>
	             					<Balance>{data($reglasNegocioResponse/MENSAJE/SUSCRIPTOR_DESTINO/*:OffPeakAccountID/*:Balance)}</Balance>
	             					<ExpiryDate>{xf:AIRDateConverter(data($reglasNegocioResponse/MENSAJE/SUSCRIPTOR_DESTINO/*:OffPeakAccountID/*:ExpiryDate))}</ExpiryDate>
	             					<UnitType>0</UnitType>
	             				</Detail>
             				)else(),
             				if(number($reglasNegocioResponse/MENSAJE/SUSCRIPTOR_DESTINO/*:FreeSMSAccountID/*:Balance) > 0
             				or xf:cuentaVigenteOCS(xf:AIRDateConverter(data($reglasNegocioResponse/MENSAJE/SUSCRIPTOR_DESTINO/*:FreeSMSAccountID/*:ExpiryDate)))) then (
	             				<Detail>
	             					<Name>20130</Name>
	             					<Balance>{data($reglasNegocioResponse/MENSAJE/SUSCRIPTOR_DESTINO/*:FreeSMSAccountID/*:Balance)}</Balance>
	             					<ExpiryDate>{xf:AIRDateConverter(data($reglasNegocioResponse/MENSAJE/SUSCRIPTOR_DESTINO/*:FreeSMSAccountID/*:ExpiryDate))}</ExpiryDate>
	             					<UnitType>5</UnitType>
	             				</Detail>
             				)else(),
             				if(number($reglasNegocioResponse/MENSAJE/SUSCRIPTOR_DESTINO/*:BonusAccountID/*:Balance) > 0
             				or xf:cuentaVigenteOCS(xf:AIRDateConverter(data($reglasNegocioResponse/MENSAJE/SUSCRIPTOR_DESTINO/*:BonusAccountID/*:ExpiryDate)))) then (
	             				<Detail>
	             					<Name>7000</Name>
	             					<Balance>{data($reglasNegocioResponse/MENSAJE/SUSCRIPTOR_DESTINO/*:BonusAccountID/*:Balance)}</Balance>
	             					<ExpiryDate>{xf:AIRDateConverter(data($reglasNegocioResponse/MENSAJE/SUSCRIPTOR_DESTINO/*:BonusAccountID/*:ExpiryDate))}</ExpiryDate>
	             					<UnitType>1</UnitType>
	             				</Detail>
             				)else(),
             				if(number($reglasNegocioResponse/MENSAJE/SUSCRIPTOR_DESTINO/*:MinutesAccountID2/*:Balance) > 0
             				or xf:cuentaVigenteOCS(xf:AIRDateConverter(data($reglasNegocioResponse/MENSAJE/SUSCRIPTOR_DESTINO/*:MinutesAccountID2/*:ExpiryDate)))) then (
	             				<Detail>
	             					<Name>10370</Name>
	             					<Balance>{data($reglasNegocioResponse/MENSAJE/SUSCRIPTOR_DESTINO/*:MinutesAccountID2/*:Balance)}</Balance>
	             					<ExpiryDate>{xf:AIRDateConverter(data($reglasNegocioResponse/MENSAJE/SUSCRIPTOR_DESTINO/*:MinutesAccountID2/*:ExpiryDate))}</ExpiryDate>
	             					<UnitType>0</UnitType>
	             				</Detail>
             				)else(),
             				if(number($reglasNegocioResponse/MENSAJE/SUSCRIPTOR_DESTINO/*:MinutesAccountID3/*:Balance) > 0
             				or xf:cuentaVigenteOCS(xf:AIRDateConverter(data($reglasNegocioResponse/MENSAJE/SUSCRIPTOR_DESTINO/*:MinutesAccountID3/*:ExpiryDate)))) then (
	             				<Detail>
	             					<Name>10380</Name>
	             					<Balance>{data($reglasNegocioResponse/MENSAJE/SUSCRIPTOR_DESTINO/*:MinutesAccountID3/*:Balance)}</Balance>
	             					<ExpiryDate>{xf:AIRDateConverter(data($reglasNegocioResponse/MENSAJE/SUSCRIPTOR_DESTINO/*:MinutesAccountID3/*:ExpiryDate))}</ExpiryDate>
	             					<UnitType>0</UnitType>
	             				</Detail>
             				)else(),
             				if(number($reglasNegocioResponse/MENSAJE/SUSCRIPTOR_DESTINO/*:MinutesAccountID4/*:Balance) > 0
             				or xf:cuentaVigenteOCS(xf:AIRDateConverter(data($reglasNegocioResponse/MENSAJE/SUSCRIPTOR_DESTINO/*:MinutesAccountID4/*:ExpiryDate)))) then (
	             				<Detail>
	             					<Name>10390</Name>
	             					<Balance>{data($reglasNegocioResponse/MENSAJE/SUSCRIPTOR_DESTINO/*:MinutesAccountID4/*:Balance)}</Balance>
	             					<ExpiryDate>{xf:AIRDateConverter(data($reglasNegocioResponse/MENSAJE/SUSCRIPTOR_DESTINO/*:MinutesAccountID4/*:ExpiryDate))}</ExpiryDate>
	             					<UnitType>0</UnitType>
	             				</Detail>
             				)else(),
             				if(number($reglasNegocioResponse/MENSAJE/SUSCRIPTOR_DESTINO/*:MonetaryAccountID2/*:Balance) > 0
             				or xf:cuentaVigenteOCS(xf:AIRDateConverter(data($reglasNegocioResponse/MENSAJE/SUSCRIPTOR_DESTINO/*:MonetaryAccountID2/*:ExpiryDate)))) then (
	             				<Detail>
	             					<Name>10350</Name>
	             					<Balance>{data($reglasNegocioResponse/MENSAJE/SUSCRIPTOR_DESTINO/*:MonetaryAccountID2/*:Balance)}</Balance>
	             					<ExpiryDate>{xf:AIRDateConverter(data($reglasNegocioResponse/MENSAJE/SUSCRIPTOR_DESTINO/*:MonetaryAccountID2/*:ExpiryDate))}</ExpiryDate>
	             					<UnitType>1</UnitType>
	             				</Detail>
             				)else()             				
             				}           			
             			</DedicatedAccounts>             		
             		}</BALANCES>,
             		<FAF_LIST>
             		<fafInformationList>
             			{
             			if(data($reglasNegocioResponse/MENSAJE/SUSCRIPTOR_DESTINO/*:IsBestFnFPossible) = "TRUE" and fn:exists($reglasNegocioResponse/MENSAJE/SUSCRIPTOR_DESTINO/*:BestFnF_Numbers/*:Detail)) then
             			<Detail>
             				<expiryDate>{xf:AIRDateConverter(data($reglasNegocioResponse/MENSAJE/SUSCRIPTOR_DESTINO/*:BestFnF_ActivationEndTime))}</expiryDate>
             				<fafIndicator>{
             					for $listaFAFIDs in fn:tokenize($reglasNegocioResponse/MENSAJE/SUSCRIPTOR_DESTINO/FAFIDS, ";")
             					where fn:contains($listaFAFIDs, "ILIMITADO")
             					return concat(fn:tokenize($listaFAFIDs, "\|")[1],"|",fn:tokenize($listaFAFIDs, "\|")[3]) 
             				}</fafIndicator>
             				<DetailNumber>{
             					for	$listaFnFs in $reglasNegocioResponse/MENSAJE/SUSCRIPTOR_DESTINO/*:BestFnF_Numbers/*:Detail
             					return <fafNumber>{concat("132",$listaFnFs)}</fafNumber>
             					}
             				</DetailNumber>
             			</Detail>
             			else()
             			}
             			{
             			if(data($reglasNegocioResponse/MENSAJE/SUSCRIPTOR_DESTINO/*:IsFnFPossible) = "TRUE" and fn:exists($reglasNegocioResponse/MENSAJE/SUSCRIPTOR_DESTINO/*:FnF_Numbers/*:Detail)) then
             			<Detail>
             				<expiryDate>99991231T12:00:00+0000</expiryDate>
             				<fafIndicator>{
             					for $listaFAFIDs in fn:tokenize($reglasNegocioResponse/MENSAJE/SUSCRIPTOR_DESTINO/FAFIDS, ";")
             					where fn:contains($listaFAFIDs, "FNF")
             					return concat(fn:tokenize($listaFAFIDs, "\|")[1],"|",fn:tokenize($listaFAFIDs, "\|")[3])
             				}</fafIndicator>
             				<DetailNumber>{
             					for	$listaFnFs in $reglasNegocioResponse/MENSAJE/SUSCRIPTOR_DESTINO/*:FnF_Numbers/*:Detail
             					return <fafNumber>{concat("132",$listaFnFs)}</fafNumber>
             					}
             				</DetailNumber>
             			</Detail>
             			else()
             			}
             			{
             			if(data($reglasNegocioResponse/MENSAJE/SUSCRIPTOR_DESTINO/*:IsFAPossible) = "TRUE" and fn:exists($reglasNegocioResponse/MENSAJE/SUSCRIPTOR_DESTINO/*:FA_Destination/*:Detail)) then
             			<Detail>
             				<expiryDate>99991231T12:00:00+0000</expiryDate>
             				<fafIndicator>{
             					for $listaFAFIDs in fn:tokenize($reglasNegocioResponse/MENSAJE/SUSCRIPTOR_DESTINO/FAFIDS, ";")
             					where fn:contains($listaFAFIDs, "FA")
             					return concat(fn:tokenize($listaFAFIDs, "\|")[1],"|",fn:tokenize($listaFAFIDs, "\|")[3])
             				}</fafIndicator>
             				<DetailNumber>{
             					for	$listaFnFs in $reglasNegocioResponse/MENSAJE/SUSCRIPTOR_DESTINO/*:FA_Destination/*:Detail
             					return <fafNumber>{$listaFnFs}</fafNumber>
             					}
             				</DetailNumber>
             			</Detail>
             			else()
             			}
             			{
             			if(exists($reglasNegocioResponse/MENSAJE/SUSCRIPTOR_DESTINO/*:SMSOnNet_Numbers/*:Detail)) then
             			<Detail>
             				<expiryDate>{xf:AIRDateConverter(data($reglasNegocioResponse/MENSAJE/SUSCRIPTOR_DESTINO/*:SMSOnNet_ExpirationDate))}</expiryDate>
             				<fafIndicator>{
             					for $listaFAFIDs in fn:tokenize($reglasNegocioResponse/MENSAJE/SUSCRIPTOR_DESTINO/FAFIDS, ";")
             					where fn:contains($listaFAFIDs, "SMS ONNET")
             					return concat(fn:tokenize($listaFAFIDs, "\|")[1],"|",fn:tokenize($listaFAFIDs, "\|")[3])
             				}</fafIndicator>
             				<DetailNumber>{
             					for	$listaFnFs in $reglasNegocioResponse/MENSAJE/SUSCRIPTOR_DESTINO/*:SMSOnNet_Numbers/*:Detail
             					return <fafNumber>{concat("132",$listaFnFs)}</fafNumber>
             					}
             				</DetailNumber>
             			</Detail>
             			else()
             			}
             			{
             			if(exists($reglasNegocioResponse/MENSAJE/SUSCRIPTOR_DESTINO/*:SMSOffNet_Numbers/*:Detail)) then
             			<Detail>
             				<expiryDate>{xf:AIRDateConverter(data($reglasNegocioResponse/MENSAJE/SUSCRIPTOR_DESTINO/*:SMSOffNet_ExpirationDate))}</expiryDate>
             				<fafIndicator>{
             					for $listaFAFIDs in fn:tokenize($reglasNegocioResponse/MENSAJE/SUSCRIPTOR_DESTINO/FAFIDS, ";")
             					where fn:contains($listaFAFIDs, "SMS OFFNET")
             					return concat(fn:tokenize($listaFAFIDs, "\|")[1],"|",fn:tokenize($listaFAFIDs, "\|")[3])
             				}</fafIndicator>
             				<DetailNumber>{
             					for	$listaFnFs in $reglasNegocioResponse/MENSAJE/SUSCRIPTOR_DESTINO/*:SMSOffNet_Numbers/*:Detail
             					return <fafNumber>{$listaFnFs}</fafNumber>
             					}
             				</DetailNumber>
             			</Detail>
             			else()
             			}
             			{
             			if(exists($reglasNegocioResponse/MENSAJE/SUSCRIPTOR_DESTINO/*:SMSAny_Numbers/*:Detail)) then
             			<Detail>
             				<expiryDate>{xf:AIRDateConverter(data($reglasNegocioResponse/MENSAJE/SUSCRIPTOR_DESTINO/*:SMSAny_ExpirationDate))}</expiryDate>
             				<fafIndicator>{
             					for $listaFAFIDs in fn:tokenize($reglasNegocioResponse/MENSAJE/SUSCRIPTOR_DESTINO/FAFIDS, ";")
             					where fn:contains($listaFAFIDs, "SMS ANY")
             					return concat(fn:tokenize($listaFAFIDs, "\|")[1],"|",fn:tokenize($listaFAFIDs, "\|")[3])
             				}</fafIndicator>
             				<DetailNumber>{
             					for	$listaFnFs in $reglasNegocioResponse/MENSAJE/SUSCRIPTOR_DESTINO/*:SMSAny_Numbers/*:Detail
             					return <fafNumber>{$listaFnFs}</fafNumber>
             					}
             				</DetailNumber>
             			</Detail>
             			else()
             			}
             			</fafInformationList>
             		</FAF_LIST>             			
             	)             		
               	else()
            }
            {  if(number(xf:swapOrigenDestino($validarResponse)/*:IN_DESTINO) >= 50 
             	and number(xf:swapOrigenDestino($validarResponse)/*:IN_ORIGEN) >= 50) 
             	then (
             	<BALANCES>{ if(number($reglasNegocioResponse/MENSAJE/SUSCRIPTOR_OCS/BALANCES/accountValue) > 0
             			or xf:cuentaVigenteOCS($reglasNegocioResponse/MENSAJE/SUSCRIPTOR_OCS/BALANCES/expiryDate))
             				then (
             					$reglasNegocioResponse/MENSAJE/SUSCRIPTOR_OCS/BALANCES/accountValue, 
             					<expiryDate>{xf:calcularFechaOCS($reglasNegocioResponse/MENSAJE/SUSCRIPTOR_OCS/BALANCES/expiryDate)}</expiryDate>
             				)else (),
             				<DedicatedAccounts>{             				
             				for $balance in $reglasNegocioResponse/MENSAJE/SUSCRIPTOR_OCS/BALANCES/DedicatedAccounts/Detail 
             				where (number($balance/Balance) > 0 or xf:cuentaVigenteOCS($balance/ExpiryDate))
             				return (<Detail>{
             					($balance/@*, $balance/node())
             					}</Detail>
             				)}</DedicatedAccounts>
             	}</BALANCES>,
             	<FAF_LIST>{$reglasNegocioResponse/MENSAJE/SUSCRIPTOR_OCS/@* , $reglasNegocioResponse/MENSAJE/SUSCRIPTOR_OCS/FAF_LIST/node()}</FAF_LIST>,
             	<DATOS_SUSCRIPCION>
             		{
             			for $offersList in $reglasNegocioResponse/MENSAJE/SUSCRIPTOR_OCS/DATOS_SUSCRIPCION/result
             			where not(fn:contains($offersList,"Elegido"))
             			return ($offersList/@*, $offersList/node())
             		}
             	</DATOS_SUSCRIPCION>
             	)
             	else ()
            }            
            </SUSCRIPTOR_OCS>
            <TIEMPO_INICIO>{ $tiempoInicio }</TIEMPO_INICIO>
            <TIMEOUT>{ data($validarResponse/MENSAJE/TIMEOUT_PROVISION) }</TIMEOUT>
        </ns0:Input_Parameters>
};

declare variable $validarResponse as element(ns1:WS_Result) external;
declare variable $reglasNegocioResponse as element(ns3:WS_Result) external;
declare variable $tiempoInicio as xs:dateTime external;

xf:ejecutarTrama_Req_ejecutador($validarResponse,
    $reglasNegocioResponse,
    $tiempoInicio)
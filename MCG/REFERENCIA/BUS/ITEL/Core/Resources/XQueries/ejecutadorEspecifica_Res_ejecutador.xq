(:: pragma bea:global-element-parameter parameter="$wS_Result1" element="ns0:WS_Result" location="../Schemas/PS_ITEL_EJECUTARTRAMA.xsd" ::)
(:: pragma bea:global-element-return element="ns0:WS_Result" location="../Schemas/PS_ITEL_EJECUTARTRAMA_ESPECIFICA.xsd" ::)

declare namespace ns0 = "http://www.comcel.com.co/EjecutarTrama/";
declare namespace xf = "http://tempuri.org/ITEL/Core/Resources/XQueries/ejecutadorEspecifica_Res_ejecutador/";

declare function xf:trama200($datos as xs:string)
   as element()  {
   		let $valores := fn:tokenize(data($datos),";") 
   		return
    	<PARAMETROS>
    	<PARAMETRO>
			<NOMBRE>{"Successful_Queries"}</NOMBRE>
			<VALOR>{ $valores[1] }</VALOR>
		</PARAMETRO>
		<PARAMETRO>
			<NOMBRE>{"Value_Charged"}</NOMBRE>
			<VALOR>{ $valores[2] }</VALOR>
		</PARAMETRO>
		<PARAMETRO>
			<NOMBRE>{"OnPeakBalance"}</NOMBRE>
			<VALOR>{ $valores[3] }</VALOR>
		</PARAMETRO>
		<PARAMETRO>
			<NOMBRE>{"OnPeakFechaVencimiento"}</NOMBRE>
			<VALOR>{ $valores[4] }</VALOR>
		</PARAMETRO>
		<PARAMETRO>
			<NOMBRE>{"OffPeakBalance"}</NOMBRE>
			<VALOR>{ $valores[5] }</VALOR>
		</PARAMETRO>
		<PARAMETRO>
			<NOMBRE>{"OffPeakFechaVencimiento"}</NOMBRE>
			<VALOR>{ $valores[6] }</VALOR>
		</PARAMETRO>
		<PARAMETRO>
			<NOMBRE>{"FreeSMSBalance"}</NOMBRE>
			<VALOR>{ $valores[7] }</VALOR>
		</PARAMETRO>
		<PARAMETRO>
			<NOMBRE>{"FreeSMSFechaVencimiento"}</NOMBRE>
			<VALOR>{ $valores[8] }</VALOR>
		</PARAMETRO>
		<PARAMETRO>
			<NOMBRE>{"BonusBalance"}</NOMBRE>
			<VALOR>{ $valores[9] }</VALOR>
		</PARAMETRO>
		<PARAMETRO>
			<NOMBRE>{"BonusFechaVencimiento"}</NOMBRE>
			<VALOR>{ $valores[10] }</VALOR>
		</PARAMETRO>
		<PARAMETRO>
			<NOMBRE>{"Minutes2Balance"}</NOMBRE>
			<VALOR>{ $valores[11] }</VALOR>
		</PARAMETRO>
		<PARAMETRO>
			<NOMBRE>{"Minutes2FechaVencimiento"}</NOMBRE>
			<VALOR>{ $valores[12] }</VALOR>
		</PARAMETRO>
		<PARAMETRO>
			<NOMBRE>{"Minutes3Balance"}</NOMBRE>
			<VALOR>{ $valores[13] }</VALOR>
		</PARAMETRO>
		<PARAMETRO>
			<NOMBRE>{"Minutes3FechaVencimiento"}</NOMBRE>
			<VALOR>{ $valores[14] }</VALOR>
		</PARAMETRO>
		<PARAMETRO>
			<NOMBRE>{"Minutes4Balance"}</NOMBRE>
			<VALOR>{ $valores[15] }</VALOR>
		</PARAMETRO>
		<PARAMETRO>
			<NOMBRE>{"Minutes4FechaVencimiento"}</NOMBRE>
			<VALOR>{ $valores[16] }</VALOR>
		</PARAMETRO>
		<PARAMETRO>
			<NOMBRE>{"Monetary2Balance"}</NOMBRE>
			<VALOR>{ $valores[17] }</VALOR>
		</PARAMETRO>
		<PARAMETRO>
			<NOMBRE>{"Monetary2FechaVencimiento"}</NOMBRE>
			<VALOR>{ $valores[18] }</VALOR>
		</PARAMETRO>
		<PARAMETRO>
			<NOMBRE>{"Monetary3Balance"}</NOMBRE>
			<VALOR>{ $valores[19] }</VALOR>
		</PARAMETRO>
		<PARAMETRO>
			<NOMBRE>{"Monetary3FechaVencimiento"}</NOMBRE>
			<VALOR>{ $valores[20] }</VALOR>
		</PARAMETRO>
		</PARAMETROS>
};

declare function xf:trama201($datos as xs:string, $fecha as xs:string)
   as element()  {
   		let $valores := fn:tokenize(data($datos),";")
   		return
    	<PARAMETROS>
    	<PARAMETRO>
			<NOMBRE>{"Provider"}</NOMBRE>
			<VALOR>{ $valores[1] }</VALOR>
		</PARAMETRO>
		<PARAMETRO>
			<NOMBRE>{"Tariff"}</NOMBRE>
			<VALOR>{ $valores[2] }</VALOR>
		</PARAMETRO>
		<PARAMETRO>
			<NOMBRE>{"Contract"}</NOMBRE>
			<VALOR>{ $valores[3] }</VALOR>
		</PARAMETRO>
		<PARAMETRO>
			<NOMBRE>{"IsFnFPossible"}</NOMBRE>
			<VALOR>{ $valores[4] }</VALOR>
		</PARAMETRO>
		<PARAMETRO>
			<NOMBRE>{"FnF_Numbers"}</NOMBRE>
			<VALOR>{
			     let $valores := fn:tokenize(data($datos),";")
			     let $cadena := concat($valores[5],";",$valores[6],";",$valores[7],";",$valores[8],";",$valores[9],";",$valores[10],";",$valores[11],";",$valores[12],";",$valores[13]) 
			     return 
			      $cadena
			 }</VALOR>
		</PARAMETRO>
		<PARAMETRO>
			<NOMBRE>{"IsFraudLocked"}</NOMBRE>
			<VALOR>{ $valores[14] }</VALOR>
		</PARAMETRO>
		<PARAMETRO>
			<NOMBRE>{"IsLocked"}</NOMBRE>
			<VALOR>{ $valores[15] }</VALOR>
		</PARAMETRO>
		<PARAMETRO>
			<NOMBRE>{"IsBestFnFPossible"}</NOMBRE>
			<VALOR>{ $valores[16] }</VALOR>
		</PARAMETRO>
		<PARAMETRO>
			<NOMBRE>{"BestFnF_Numbers"}</NOMBRE>
			<VALOR>{ $valores[17] }</VALOR>
		</PARAMETRO>
		<PARAMETRO>
			<NOMBRE>{"OnPeakAccountID"}</NOMBRE>
			<VALOR>{ $valores[18] }</VALOR>
		</PARAMETRO>
		<PARAMETRO>
			<NOMBRE>{"OnPeakAccountIDExpiryDate"}</NOMBRE>
			<VALOR>{ $valores[19] }</VALOR>
		</PARAMETRO>
		<PARAMETRO>
			<NOMBRE>{"OffPeakAccountID"}</NOMBRE>
			<VALOR>{ $valores[20] }</VALOR>
		</PARAMETRO>
		<PARAMETRO>
			<NOMBRE>{"OffPeakAccountIDExpiryDate"}</NOMBRE>
			<VALOR>{ $valores[21] }</VALOR>
		</PARAMETRO>
		<PARAMETRO>
			<NOMBRE>{"FreeSMSAccountID"}</NOMBRE>
			<VALOR>{ $valores[22] }</VALOR>
		</PARAMETRO>
		<PARAMETRO>
			<NOMBRE>{"FreeSMSAccountIDExpiryDate"}</NOMBRE>
			<VALOR>{ $valores[23] }</VALOR>
		</PARAMETRO>
		<PARAMETRO>
			<NOMBRE>{"BonusAccount"}</NOMBRE>
			<VALOR>{ $valores[24] }</VALOR>
		</PARAMETRO>
		<PARAMETRO>
			<NOMBRE>{"BonusAccountExpiryDate"}</NOMBRE>
			<VALOR>{ $valores[25] }</VALOR>
		</PARAMETRO>
		<PARAMETRO>
			<NOMBRE>{"MinutesAccountID2"}</NOMBRE>
			<VALOR>{ $valores[26] }</VALOR>
		</PARAMETRO>
		<PARAMETRO>
			<NOMBRE>{"MinutesAccountID2ExpiryDate"}</NOMBRE>
			<VALOR>{ $valores[27] }</VALOR>
		</PARAMETRO>
		<PARAMETRO>
			<NOMBRE>{"MinutesAccountID3"}</NOMBRE>
			<VALOR>{ $valores[28] }</VALOR>
		</PARAMETRO>
		<PARAMETRO>
			<NOMBRE>{"MinutesAccountID3ExpiryDate"}</NOMBRE>
			<VALOR>{ $valores[29] }</VALOR>
		</PARAMETRO>
		<PARAMETRO>
			<NOMBRE>{"MinutesAccountID4"}</NOMBRE>
			<VALOR>{ $valores[30] }</VALOR>
		</PARAMETRO>
		<PARAMETRO>
			<NOMBRE>{"MinutesAccountID4ExpiryDate"}</NOMBRE>
			<VALOR>{ $valores[31] }</VALOR>
		</PARAMETRO>
		<PARAMETRO>
			<NOMBRE>{"MonetaryAccountID2"}</NOMBRE>
			<VALOR>{ $valores[32] }</VALOR>
		</PARAMETRO>
		<PARAMETRO>
			<NOMBRE>{"MonetaryAccountID2ExpiryDate"}</NOMBRE>
			<VALOR>{ $valores[33] }</VALOR>
		</PARAMETRO>
		<PARAMETRO>
			<NOMBRE>{"MonetaryAccountID3"}</NOMBRE>
			<VALOR>{ $valores[34] }</VALOR>
		</PARAMETRO>
		<PARAMETRO>
			<NOMBRE>{"MonetaryAccountID3ExpiryDate"}</NOMBRE>
			<VALOR>{ $valores[35] }</VALOR>
		</PARAMETRO>
		
		<PARAMETRO>
			<NOMBRE>{"ActivationDate"}</NOMBRE>
			<VALOR>{
					if(fn:string-length($fecha)>0 and fn:string-length($fecha)>4) then
					 fn-bea:dateTime-to-string-with-format("yyyy-MM-dd", fn-bea:dateTime-from-string-with-format("yyyyMMdd'T'HH:mm:ss+SSSS", $fecha)) 
			        else 
			        ()
			}</VALOR>
		</PARAMETRO>
		
		</PARAMETROS>
};

declare function xf:trama202($datos as xs:string)
   as element()  {
   		let $valores := fn:tokenize(data($datos),";")
   		return
    	<PARAMETROS>
    	<PARAMETRO>
			<NOMBRE>{"BestFnFNumbers"}</NOMBRE>
			<VALOR>{
			     let $cadena := concat($valores[1],";",$valores[2],";",$valores[3],";",$valores[4],";",$valores[5],";",$valores[6],";",$valores[7],";",$valores[8],";",$valores[9]) 
			     return 
			      $cadena
			 }</VALOR>
		</PARAMETRO>
		<PARAMETRO>
			<NOMBRE>{"FnFNumbers"}</NOMBRE>
			<VALOR>{
			     let $cadena := concat($valores[10],";",$valores[11],";",$valores[12],";",$valores[13],";",$valores[14],";",$valores[15],";",$valores[16],";",$valores[17],";",$valores[18]) 
			     return 
			      $cadena
			 }</VALOR>
		</PARAMETRO>
		<PARAMETRO>
			<NOMBRE>{"FANumbers"}</NOMBRE>
			<VALOR>{
			     let $cadena := concat($valores[19]) 
			     return 
			      $cadena
			 }</VALOR>
		</PARAMETRO>
		</PARAMETROS>
};

declare function xf:trama203($datos as xs:string)
   as element()  {
   		let $valores := fn:tokenize(data($datos),";")
   		return
    	<PARAMETROS>
    	<PARAMETRO>
			<NOMBRE>{"BestFnFNumbers"}</NOMBRE>
			<VALOR>{ $valores[1] }</VALOR>
		</PARAMETRO>
		<PARAMETRO>
			<NOMBRE>{"FnFNumbers"}</NOMBRE>
			<VALOR>{
			     let $cadena := concat($valores[2],";",$valores[3],";",$valores[4],";",$valores[5],";",$valores[6],";",$valores[7],";",$valores[8],";",$valores[9],";",$valores[10]) 
			     return 
			      $cadena
			 }</VALOR>
		</PARAMETRO>
		<PARAMETRO>
			<NOMBRE>{"MLC"}</NOMBRE>
			<VALOR>{
			     let $cadena := concat($valores[11]) 
			     return 
			      $cadena
			 }</VALOR>
		</PARAMETRO>
		</PARAMETROS>
};

declare function xf:trama204($datos as xs:string)
   as element()  {
   		let $valores := fn:tokenize(data($datos),";")
   		return
    	<PARAMETROS>
    	<PARAMETRO>
			<NOMBRE>{"BestFnFNumbers"}</NOMBRE>
			<VALOR>{
			     let $cadena := concat($valores[2],";",$valores[3],";",$valores[4],";",$valores[5],";",$valores[6],";",$valores[7],";",$valores[8],";",$valores[9],";",$valores[10]) 
			     return 
			      $cadena
			 }</VALOR>
		</PARAMETRO>
		<PARAMETRO>
			<NOMBRE>{"BestFnF_ExpirationDate"}</NOMBRE>
			<VALOR>{ fn:normalize-space($valores[11])}</VALOR>
		</PARAMETRO>
		<PARAMETRO>
			<NOMBRE>{"FnFNumbers"}</NOMBRE>
			<VALOR>{
			     let $cadena := concat($valores[13],";",$valores[14],";",$valores[15],";",$valores[16],";",$valores[17],";",$valores[18],";",$valores[19],";",$valores[20],";",$valores[21]) 
			     return 
			      $cadena
			 }</VALOR>
		</PARAMETRO>
		<PARAMETRO>
			<NOMBRE>{"FnF_ExpirationDate"}</NOMBRE>
			<VALOR>{ fn:normalize-space($valores[22])}</VALOR>
		</PARAMETRO>
		<PARAMETRO>
			<NOMBRE>{"SMSFnFOnNetNumbers"}</NOMBRE>
			<VALOR>{
			     let $cadena := concat($valores[24],";",$valores[25],";",$valores[26],";",$valores[27],";",$valores[28]) 
			     return 
			      $cadena
			 }</VALOR>
		</PARAMETRO>
		<PARAMETRO>
			<NOMBRE>{"SMSFnFOnNet_ExpirationDate"}</NOMBRE>
			<VALOR>{ fn:normalize-space($valores[29])}</VALOR>
		</PARAMETRO>
		<PARAMETRO>
			<NOMBRE>{"SMSFnFOffNetNumbers"}</NOMBRE>
			<VALOR>{
			     let $cadena := concat($valores[31],";",$valores[32],";",$valores[33],";",$valores[34],";",$valores[35]) 
			     return 
			      $cadena
			 }</VALOR>
		</PARAMETRO>
		<PARAMETRO>
			<NOMBRE>{"SMSFnFOffNet_ExpirationDate"}</NOMBRE>
			<VALOR>{ fn:normalize-space($valores[36])}</VALOR>
		</PARAMETRO>
		<PARAMETRO>
			<NOMBRE>{"SMSFnFAnyNumbers"}</NOMBRE>
			<VALOR>{
			     let $cadena := concat($valores[38],";",$valores[39],";",$valores[40],";",$valores[41],";",$valores[42]) 
			     return 
			      $cadena
			 }</VALOR>
		</PARAMETRO>
		<PARAMETRO>
			<NOMBRE>{"SMSFnFAny_ExpirationDate"}</NOMBRE>
			<VALOR>{ 
			    let $fecha := fn:tokenize(fn:normalize-space($valores[43]),"!")
		        return 
		        $fecha[1]   	
			}</VALOR>
		</PARAMETRO>
		</PARAMETROS>
};

declare function xf:trama206($datos as xs:string)
   as element()  {
   		let $valores := fn:tokenize(data($datos),";")
   		return
    	<PARAMETROS>
    	<PARAMETRO>
			<NOMBRE>{"Oferta"}</NOMBRE>
			<VALOR>{ $valores[1]}</VALOR>
		</PARAMETRO>
		<PARAMETRO>
			<NOMBRE>{"Vigencia"}</NOMBRE>
			<VALOR>{ $valores[2] }</VALOR>
		</PARAMETRO>
		{
		for $i in (3 to count($valores))
    	  return 
	    	<PARAMETRO>
			<NOMBRE>{fn:concat("Elegido Oferta( ", fn:normalize-space( string($i - 3) )),")"}</NOMBRE>
			<VALOR>{ $valores[$i] }</VALOR>
			</PARAMETRO>
		}
		</PARAMETROS>
};


declare function xf:trama212($datos as xs:string)
   as element()  {  
   		let $valores := fn:tokenize($datos,";")
   		return
    	<PARAMETROS>
    	<PARAMETRO>
			<NOMBRE>{"PAQUETES"}</NOMBRE>
			<VALOR>		
				{
					for $i in (1 to count($valores))[. mod 7 = 1]		 
			    	  return 
				    	<PAQUETE>
							<TIPO>{$valores[$i]}</TIPO>
							<CODIGO>{$valores[$i+1]}</CODIGO>
							<NOMBRE>{$valores[$i+2]}</NOMBRE>
							<CAPACIDAD>{ $valores[$i+3] }</CAPACIDAD>
							<CONSUMO>{ $valores[$i+4] }</CONSUMO>
							<FECHAEXPIRACION>{ $valores[$i+5] }</FECHAEXPIRACION>
							<FECHAACTIVACION>{ $valores[$i+6] }</FECHAACTIVACION>
						</PAQUETE>
				}</VALOR>
		</PARAMETRO>
		</PARAMETROS>
};


declare function xf:trama208($datos as xs:string)
   as element()  {
   		let $valores := fn:tokenize(data($datos),";")
   		return
    	<PARAMETROS>
    	<PARAMETRO>
			<NOMBRE>{"CobrarCambioPlan"}</NOMBRE>
			<VALOR>{ $valores[1]}</VALOR>
		</PARAMETRO>
		</PARAMETROS>
};

declare function xf:trama213($datos as xs:string)
   as element()  {
   		let $valores := fn:tokenize(data($datos),";")
   		return
    	<PARAMETROS>
    	<PARAMETRO>
			<NOMBRE>{"CobrarCambioFNF"}</NOMBRE>
			<VALOR>{ $valores[1]}</VALOR>
		</PARAMETRO>
		</PARAMETROS>
};

declare function xf:trama215($datos as xs:string)
   as element()  {  
   		let $valores := fn:tokenize($datos,";")
   		return
    	<PARAMETROS>
    	<PARAMETRO>
			<NOMBRE>{"PAQUETES"}</NOMBRE>
			<VALOR>		
				{
					for $i in (1 to count($valores))[. mod 6 = 1]		 
			    	  return 
				    	<PAQUETE>
							<PRODUCTID>{$valores[$i]}</PRODUCTID>
							<FECHAINICIO>{$valores[$i+1]}</FECHAINICIO>
							<FECHAFIN>{$valores[$i+2]}</FECHAFIN>
							<ESTADO>{ $valores[$i+3] }</ESTADO>
							<SUSCRIPCION>{ $valores[$i+4] }</SUSCRIPCION>
							<NOMBRE>{ $valores[$i+5] }</NOMBRE>
						</PAQUETE>
				}</VALOR>
		</PARAMETRO>
		</PARAMETROS>
};

declare function xf:trama205($datos as xs:string)
   as element()  {
   		let $parametros := fn:tokenize(data($datos),"!")
   		let $parametro  := fn:tokenize(data($parametros[5]),";")
   		return
    	<PARAMETROS>{
    	 for $i in (1 to count($parametro))[. mod 3 = 1]
    	  return 
	    	<PARAMETRO>
				<Name>{$parametro[$i]}</Name>
				<Balance>{ $parametro[$i+1] }</Balance>
				<expiryDate>{ $parametro[$i+2] }</expiryDate>
			</PARAMETRO>}
		</PARAMETROS>
};


declare function xf:trama211($datos as xs:string)
   as element()  {
   		let $parametros := fn:tokenize(data($datos),"!")
   		let $parametro  := fn:tokenize(data($parametros[5]),";")
   		return
    	<PARAMETROS>{
    	
	    	<PARAMETRO>
	    		<NOMBRE>{"PAQUETES"}</NOMBRE>
				<VALOR>{
				 for $i in (1 to count($parametro))[. mod 7 = 1]
    	  			return
    	  			<PAQUETE> 
						<PAQUETE_ID>{$parametro[$i]}</PAQUETE_ID>
						<VALOR>{ $parametro[$i+1] }</VALOR>
						<DESCRIPCION_CORTA>{ $parametro[$i+2] }</DESCRIPCION_CORTA>
						<VIGENCIA>{ $parametro[$i+3] }</VIGENCIA>
						<CANTIDAD>{ $parametro[$i+4] }</CANTIDAD>
						<TIPO>{ $parametro[$i+5] }</TIPO>						
						<DESCRIPCION_LARGA>{ $parametro[$i+6] }</DESCRIPCION_LARGA>						
					</PAQUETE>
				}</VALOR>				
			</PARAMETRO>}
		</PARAMETROS>
};

declare function xf:trama210($datos as xs:string)
   as element()  {
   		let $parametros := fn:tokenize(data($datos),"!")
   		let $parametro  := fn:tokenize(data($parametros[5]),";")
   		return
    	<PARAMETROS>{
    	
	    	<PARAMETRO>
	    		<NOMBRE>{"PaquetesActivos"}</NOMBRE>
				<VALOR>{
				 for $i in (1 to count($parametro))[. mod 4 = 1]
    	  			return
    	  			<PAQUETE> 
						<NOMBRE_PAQUETE>{$parametro[$i]}</NOMBRE_PAQUETE>
						<VOLUMEN_CONSUMIDO>{ $parametro[$i+1] }</VOLUMEN_CONSUMIDO>
						<FECHA_EXPIRACION>{ $parametro[$i+2] }</FECHA_EXPIRACION>
						<TIPO_PAQUETE>{ $parametro[$i+3] }</TIPO_PAQUETE>
					</PAQUETE>
				}</VALOR>				
			</PARAMETRO>}
		</PARAMETROS>
};

declare function xf:trama400($datos as xs:string)
   as element()  {
   		let $valores := fn:tokenize(data($datos),";")
   		return
    	<PARAMETROS>
    	<PARAMETRO>
			<NOMBRE>{"Monto"}</NOMBRE>
			<VALOR>{ fn:normalize-space($valores[1])}</VALOR>
		</PARAMETRO>
		<PARAMETRO>
			<NOMBRE>{"Bono"}</NOMBRE>
			<VALOR>{ fn:normalize-space($valores[2])}</VALOR>
		</PARAMETRO>
		<PARAMETRO>
			<NOMBRE>{"Vigencia"}</NOMBRE>
			<VALOR>{ fn:normalize-space($valores[3])}</VALOR>
		</PARAMETRO>
		<PARAMETRO>
			<NOMBRE>{"OnPeakAccountID"}</NOMBRE>
			<VALOR>{ fn:normalize-space($valores[4])}</VALOR>
		</PARAMETRO>
		<PARAMETRO>
			<NOMBRE>{"OnPeakAccountExpiryDate"}</NOMBRE>
			<VALOR>{ fn:normalize-space($valores[5])}</VALOR>
		</PARAMETRO>
		<PARAMETRO>
			<NOMBRE>{"OffPeakAccount"}</NOMBRE>
			<VALOR>{ fn:normalize-space($valores[6])}</VALOR>
		</PARAMETRO>
		<PARAMETRO>
			<NOMBRE>{"OffPeakAccountExpiryDate"}</NOMBRE>
			<VALOR>{ fn:normalize-space($valores[7])}</VALOR>
		</PARAMETRO>
		<PARAMETRO>
			<NOMBRE>{"FreeSmsAccount"}</NOMBRE>
			<VALOR>{ fn:normalize-space($valores[8])}</VALOR>
		</PARAMETRO>
		<PARAMETRO>
			<NOMBRE>{"FreeSmsAccountExpiryDate"}</NOMBRE>
			<VALOR>{ fn:normalize-space($valores[9])}</VALOR>
		</PARAMETRO>
		<PARAMETRO>
			<NOMBRE>{"BonusAccount"}</NOMBRE>
			<VALOR>{ fn:normalize-space($valores[10])}</VALOR>
		</PARAMETRO>
		<PARAMETRO>
			<NOMBRE>{"BonusAccountExpiryDate"}</NOMBRE>
			<VALOR>{ fn:normalize-space($valores[11])}</VALOR>
		</PARAMETRO>
		<PARAMETRO>
			<NOMBRE>{"MinutesAccountID2"}</NOMBRE>
			<VALOR>{ fn:normalize-space($valores[12])}</VALOR>
		</PARAMETRO>
		<PARAMETRO>
			<NOMBRE>{"MinutesAccountID2ExpiryDate"}</NOMBRE>
			<VALOR>{ fn:normalize-space($valores[13])}</VALOR>
		</PARAMETRO>
		<PARAMETRO>
			<NOMBRE>{"MinutesAccountID3"}</NOMBRE>
			<VALOR>{ fn:normalize-space($valores[14])}</VALOR>
		</PARAMETRO>
		<PARAMETRO>
			<NOMBRE>{"MinutesAccountID3ExpiryDate"}</NOMBRE>
			<VALOR>{ fn:normalize-space($valores[15])}</VALOR>
		</PARAMETRO>
		<PARAMETRO>
			<NOMBRE>{"MinutesAccountID4"}</NOMBRE>
			<VALOR>{ fn:normalize-space($valores[16])}</VALOR>
		</PARAMETRO>
		<PARAMETRO>
			<NOMBRE>{"MinutesAccountID4ExpiryDate"}</NOMBRE>
			<VALOR>{ fn:normalize-space($valores[17])}</VALOR>
		</PARAMETRO>
		<PARAMETRO>
			<NOMBRE>{"MonetaryAccountID2"}</NOMBRE>
			<VALOR>{ fn:normalize-space($valores[18])}</VALOR>
		</PARAMETRO>
		<PARAMETRO>
			<NOMBRE>{"MonetaryAccountID2ExpiryDate"}</NOMBRE>
			<VALOR>{ fn:normalize-space($valores[19])}</VALOR>
		</PARAMETRO>
		<PARAMETRO>
			<NOMBRE>{"MonetaryAccountID3"}</NOMBRE>
			<VALOR>{ fn:normalize-space($valores[20])}</VALOR>
		</PARAMETRO>
		<PARAMETRO>
			<NOMBRE>{"MonetaryAccountID3ExpiryDate"}</NOMBRE>
			<VALOR>{ fn:normalize-space($valores[21])}</VALOR>
		</PARAMETRO>
		<PARAMETRO>
			<NOMBRE>{"Contract"}</NOMBRE>
			<VALOR>{ fn:normalize-space($valores[22])}</VALOR>
		</PARAMETRO>
		</PARAMETROS>
};


declare function xf:trama407($datos as xs:string)
   as element()  {
   		let $valores := fn:tokenize(data($datos),";")
   		return
    	<PARAMETROS>
    	<PARAMETRO>
			<NOMBRE>{"OnPeakAccountID"}</NOMBRE>
			<VALOR>{ fn:normalize-space($valores[1])}</VALOR>
		</PARAMETRO>
		<PARAMETRO>
			<NOMBRE>{"OnPeakAccountExpiryDate"}</NOMBRE>
			<VALOR>{ fn:normalize-space($valores[2])}</VALOR>
		</PARAMETRO>
		<PARAMETRO>
			<NOMBRE>{"OffPeakAccount"}</NOMBRE>
			<VALOR>{ fn:normalize-space($valores[3])}</VALOR>
		</PARAMETRO>
		<PARAMETRO>
			<NOMBRE>{"OffPeakAccountExpiryDate"}</NOMBRE>
			<VALOR>{ fn:normalize-space($valores[4])}</VALOR>
		</PARAMETRO>
		<PARAMETRO>
			<NOMBRE>{"FreeSmsAccount"}</NOMBRE>
			<VALOR>{ fn:normalize-space($valores[5])}</VALOR>
		</PARAMETRO>
		<PARAMETRO>
			<NOMBRE>{"FreeSmsAccountExpiryDate"}</NOMBRE>
			<VALOR>{ fn:normalize-space($valores[6])}</VALOR>
		</PARAMETRO>
		<PARAMETRO>
			<NOMBRE>{"BonusAccount"}</NOMBRE>
			<VALOR>{ fn:normalize-space($valores[7])}</VALOR>
		</PARAMETRO>
		<PARAMETRO>
			<NOMBRE>{"BonusAccountExpiryDate"}</NOMBRE>
			<VALOR>{ fn:normalize-space($valores[8])}</VALOR>
		</PARAMETRO>
		<PARAMETRO>
			<NOMBRE>{"MinutesAccountID2"}</NOMBRE>
			<VALOR>{ fn:normalize-space($valores[9])}</VALOR>
		</PARAMETRO>
		<PARAMETRO>
			<NOMBRE>{"MinutesAccountID2ExpiryDate"}</NOMBRE>
			<VALOR>{ fn:normalize-space($valores[10])}</VALOR>
		</PARAMETRO>
		<PARAMETRO>
			<NOMBRE>{"MinutesAccountID3"}</NOMBRE>
			<VALOR>{ fn:normalize-space($valores[11])}</VALOR>
		</PARAMETRO>
		<PARAMETRO>
			<NOMBRE>{"MinutesAccountID3ExpiryDate"}</NOMBRE>
			<VALOR>{ fn:normalize-space($valores[12])}</VALOR>
		</PARAMETRO>
		<PARAMETRO>
			<NOMBRE>{"MinutesAccountID4"}</NOMBRE>
			<VALOR>{ fn:normalize-space($valores[13])}</VALOR>
		</PARAMETRO>
		<PARAMETRO>
			<NOMBRE>{"MinutesAccountID4ExpiryDate"}</NOMBRE>
			<VALOR>{ fn:normalize-space($valores[14])}</VALOR>
		</PARAMETRO>
		<PARAMETRO>
			<NOMBRE>{"MonetaryAccountID2"}</NOMBRE>
			<VALOR>{ fn:normalize-space($valores[15])}</VALOR>
		</PARAMETRO>
		<PARAMETRO>
			<NOMBRE>{"MonetaryAccountID2ExpiryDate"}</NOMBRE>
			<VALOR>{ fn:normalize-space($valores[16])}</VALOR>
		</PARAMETRO>
		<PARAMETRO>
			<NOMBRE>{"MonetaryAccountID3"}</NOMBRE>
			<VALOR>{ fn:normalize-space($valores[17])}</VALOR>
		</PARAMETRO>
		<PARAMETRO>
			<NOMBRE>{"MonetaryAccountID3ExpiryDate"}</NOMBRE>
			<VALOR>{ fn:normalize-space($valores[18])}</VALOR>
		</PARAMETRO>
		</PARAMETROS>
};


declare function xf:trama500($datos as xs:string)
   as element()  {
   		let $valores := fn:tokenize(data($datos),"!")
   		let $cadena1 := concat($valores[1],"!",$valores[2],"!",$valores[3],"!",$valores[4],"!")
   		let $cadena2 := fn:substring-after($datos, $cadena1)
   		let $final   := fn:substring($cadena2, 1, string-length($cadena2) - 2)
   		return
    	<PARAMETROS>
    		<PARAMETRO>
				<NOMBRE>{"Trama"}</NOMBRE>
				<VALOR>{ $final }</VALOR>
			</PARAMETRO>
		</PARAMETROS>
};

declare function xf:trama700($datos as xs:string)
   as element()  {
   		let $valores := fn:tokenize(data($datos),";")
   		return
    	<PARAMETROS>
    	<PARAMETRO>
			<NOMBRE>{"SMSFnFOnNetNumbers"}</NOMBRE>
			<VALOR>{
			     let $cadena := concat($valores[2],";",$valores[3],";",$valores[4],";",$valores[5],";",$valores[6]) 
			     return 
			      $cadena
			 }</VALOR>
		</PARAMETRO>
		<PARAMETRO>
			<NOMBRE>{"SMSFnFOnNet_ExpirationDate"}</NOMBRE>
			<VALOR>{ fn:normalize-space($valores[7])}</VALOR>
		</PARAMETRO>
		<PARAMETRO>
			<NOMBRE>{"SMSFnFOffNetNumbers"}</NOMBRE>
			<VALOR>{
			     let $cadena := concat($valores[9],";",$valores[10],";",$valores[11],";",$valores[12],";",$valores[13]) 
			     return 
			      $cadena
			 }</VALOR>
		</PARAMETRO>
		<PARAMETRO>
			<NOMBRE>{"SMSFnFOffNet_ExpirationDate"}</NOMBRE>
			<VALOR>{ fn:normalize-space($valores[14])}</VALOR>
		</PARAMETRO>
		<PARAMETRO>
			<NOMBRE>{"SMSFnFAnyNumbers"}</NOMBRE>
			<VALOR>{
			     let $cadena := concat($valores[16],";",$valores[17],";",$valores[18],";",$valores[19],";",$valores[20]) 
			     return 
			      $cadena
			 }</VALOR>
		</PARAMETRO>
		<PARAMETRO>
			<NOMBRE>{"SMSFnFAny_ExpirationDate"}</NOMBRE>
			<VALOR>{ fn:normalize-space($valores[21])}</VALOR>
		</PARAMETRO>
		</PARAMETROS>
};

declare function xf:ejecutadorEspecifica_Res_ejecutador($wS_Result1 as element(ns0:WS_Result))
    as element(ns0:WS_Result) {
    	let $datos := fn:tokenize(data($wS_Result1/MENSAJE),"!")
    	let $metodo := string(fn:normalize-space($datos[2]))
    	let $codigoRespuesta := data($wS_Result1/CODIGO)
    	return
        <ns0:WS_Result>
            <CODIGO>{ $codigoRespuesta }</CODIGO>
            <MENSAJE>
                <USUARIO>{ fn:normalize-space($datos[1]) }</USUARIO>
                <METODO>{ $metodo }</METODO>
                <CODIGO_RESPUESTA>{ $codigoRespuesta }</CODIGO_RESPUESTA>
                <DESCRIPCION>{ fn:normalize-space($datos[4]) }</DESCRIPCION>
                
                {
                	if($codigoRespuesta = "1") then   
	                  if ( $metodo = "200" ) then                    
	                  	xf:trama200(string($datos[5]))
	                  else if ( $metodo= "201" or $metodo = "207" ) then                    
	                    xf:trama201(string($datos[5]),  data($wS_Result1/DESCRIPCION))
	                  else if ( $metodo= "202" ) then                    
	                    xf:trama202(string($datos[5]))  
	                  else if ( $metodo= "203" ) then                    
	                    xf:trama203(string($datos[5]))  
	                  else if ( $metodo = "204" ) then
	                    xf:trama204($wS_Result1/MENSAJE)  
	                  else if ( $metodo = "205" ) then
	                    xf:trama205($wS_Result1/MENSAJE)
	                  else if ( $metodo = "210" ) then
	                    xf:trama210($wS_Result1/MENSAJE)
	                  else if ( $metodo = "211" ) then
	                    xf:trama211($wS_Result1/MENSAJE)   
	                  else if ( $metodo = "206" ) then
	                    xf:trama206(string($datos[5]))
	                  else if ( $metodo = "208" ) then
	                    xf:trama208(string($datos[5]))
	                  else if ( $metodo = "213" ) then
	                    xf:trama213(string($datos[5]))	                    
	                  else if ( $metodo = "212" ) then
	                    xf:trama212(string($datos[5]))
	                  else if ( $metodo = "215" ) then
	                    xf:trama215(string($datos[5]))
	                  else if ( $metodo = ("400","401","402","403","408") ) then                    
	                    xf:trama400(string($datos[5]))  
	                  else if ( $metodo = ("407") ) then                    
	                    xf:trama407(string($datos[5]))
	                  else if ( $metodo = ("500") ) then                    
	                    xf:trama500(data($wS_Result1/MENSAJE))
	                  else if ( $metodo = ("700") ) then                    
	                    xf:trama700(string($datos[5]))    
	                  else
	                  <PARAMETROS/>
	               else    
	               	 <PARAMETROS/>
                }                
            </MENSAJE>
            <DESCRIPCION>{ fn:normalize-space($datos[4]) }</DESCRIPCION>
        </ns0:WS_Result>
};

declare variable $wS_Result1 as element(ns0:WS_Result) external;

xf:ejecutadorEspecifica_Res_ejecutador($wS_Result1)
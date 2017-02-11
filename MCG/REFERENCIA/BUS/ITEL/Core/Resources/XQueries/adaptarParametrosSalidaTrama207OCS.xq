(:: pragma bea:global-element-parameter parameter="$wS_Result" element="ns1:WS_Result" location="../Schemas/PS_ITEL_EJECUTARREGLASNEGOCIO.xsd" ::)

declare namespace ns1 = "http://www.comcel.com.co/EjecutarReglasNegocio/";
declare namespace ns0 = "http://www.comcel.com.co/IN/OperacionCorba";
declare namespace xf = "http://tempuri.org/ITEL/Core/Resources/XQueries/adaptarParametrosSalidaTrama207/";

declare function xf:expiryDateFormatter($expiryDate as xs:string) as xs:string{	
	concat(fn-bea:dateTime-to-string-with-format("yyyy-MM-dd", fn-bea:dateTime-from-string-with-format("yyyyMMdd'T'HH:mm:ss+SSSS", $expiryDate)), " 23:59:59")
};



declare function xf:adaptarParametrosSalidaTrama207($wS_Result as element(ns1:WS_Result))
    as xs:string {
    		        		   		
        fn:concat(data($wS_Result/MENSAJE/SUSCRIPTOR_OCS/DATOS_CONTRATO/PROVIDER),
        		  ";",
        		  data($wS_Result/MENSAJE/SUSCRIPTOR_OCS/DATOS_CONTRATO/TARIFF),
        		  ";",
        		  data($wS_Result/MENSAJE/SUSCRIPTOR_OCS/DATOS_CONTRATO/CONTRATO),
        		   ";",
        		  "FALSE",
        		   ";", 	  
        		   ";",        		  
        		   ";",        		  
        		   ";",        		 
        		   ";",        		  
        		   ";",        		  
        		   ";",        		  
        		   ";",        		  
        		   ";",        		  
        		   ";",
        		  if(data($wS_Result/MENSAJE/SUSCRIPTOR_OCS/DATOS_SUSCRIPTOR/*:RefillBarredUntil) != "") then "TRUE" else "FALSE", (: fraudLocked:)
        		   ";",
        		  if(data($wS_Result/MENSAJE/SUSCRIPTOR_OCS/DATOS_SUSCRIPTOR/*:ContractStatus) = 3) then "TRUE" else "FALSE",  (: IsLocked :)
        		   ";",
        		  "FALSE",
        		   ";",
        		  
        		   ";",
        		   (:ONPEAK ACCOUNT:)
        		  if(data($wS_Result/MENSAJE/SUSCRIPTOR_OCS/BALANCES/accountValue)!= "") then
        		  	data($wS_Result/MENSAJE/SUSCRIPTOR_OCS/BALANCES/accountValue)
        		  else
        		  	"0",
        		   ";",        		   
        		  if(data($wS_Result/MENSAJE/SUSCRIPTOR_OCS/BALANCES/expiryDate) != "") then
        		  	xf:expiryDateFormatter(data($wS_Result/MENSAJE/SUSCRIPTOR_OCS/BALANCES/expiryDate))
        		  else 
        		  	"1970-01-01 23:59:59",
        		   ";",
        		   (:OFFPEAK ACCOUNT:)
        		   "0",
        		   ";",
        		   "1970-01-01 23:59:59",
        		   ";",
        		   (:FREESMS ACCOUNT:)
        		   "0",
        		   ";",
        		   "1970-01-01 23:59:59",
        		   ";",
        		   (:BONUS ACCOUNT:)
        		   "0",
        		   ";",
        		   "1970-01-01 23:59:59",
        		   ";",
        		   (:MINUTES2 ACCOUNT:)
        		   "0",
        		   ";",
        		   "1970-01-01 23:59:59",
        		   ";",
        		   (:MINUTES3 ACCOUNT:)
        		  "0",
        		   ";",
        		   "1970-01-01 23:59:59",
        		   ";",
        		   (:MINUTES4 ACCOUNT:)
        		   "0",
        		   ";",
        		   "1970-01-01 23:59:59",
        		   ";",
        		   (:MONETARY2 ACCOUNT:)
        		   "0",
        		   ";",
        		   "1970-01-01 23:59:59",
        		   ";",
        		   (: MonetaryAccountID3 :)        		   
				   "0",
				   ";",
				   "1970-01-01 23:59:59"         		   
        		 )
    		  
};

declare variable $wS_Result as element(ns1:WS_Result) external;


xf:adaptarParametrosSalidaTrama207($wS_Result)
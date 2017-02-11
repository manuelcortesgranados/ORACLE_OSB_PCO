(:: pragma bea:global-element-parameter parameter="$wS_Result" element="ns1:WS_Result" location="../Schemas/PS_ITEL_EJECUTARREGLASNEGOCIO.xsd" ::)

declare namespace ns1 = "http://www.comcel.com.co/EjecutarReglasNegocio/";
declare namespace ns0 = "http://www.comcel.com.co/IN/OperacionCorba";
declare namespace xf = "http://tempuri.org/ITEL/Core/Resources/XQueries/adaptarParametrosSalidaTrama201/";

declare function xf:adaptarParametrosSalidaTrama201($wS_Result as element(ns1:WS_Result))
    as xs:string {
        fn:concat(data($wS_Result/MENSAJE/SUSCRIPTOR_DESTINO/PROVIDER),
        		  ";",
        		  data($wS_Result/MENSAJE/SUSCRIPTOR_DESTINO/TARIFF),
        		  ";",
        		  data($wS_Result/MENSAJE/SUSCRIPTOR_DESTINO/*:Contract),
        		   ";",
        		  data($wS_Result/MENSAJE/SUSCRIPTOR_DESTINO/*:IsFnFPossible),
        		   ";",
        		  data($wS_Result/MENSAJE/SUSCRIPTOR_DESTINO/*:FnF_Numbers/*:Detail[1]),
        		   ";",
        		  data($wS_Result/MENSAJE/SUSCRIPTOR_DESTINO/*:FnF_Numbers/*:Detail[2]),
        		   ";",
        		  data($wS_Result/MENSAJE/SUSCRIPTOR_DESTINO/*:FnF_Numbers/*:Detail[3]),
        		   ";",
        		  data($wS_Result/MENSAJE/SUSCRIPTOR_DESTINO/*:FnF_Numbers/*:Detail[4]),
        		   ";",
        		  data($wS_Result/MENSAJE/SUSCRIPTOR_DESTINO/*:FnF_Numbers/*:Detail[5]),
        		   ";",
        		  data($wS_Result/MENSAJE/SUSCRIPTOR_DESTINO/*:FnF_Numbers/*:Detail[6]),
        		   ";",
        		  data($wS_Result/MENSAJE/SUSCRIPTOR_DESTINO/*:FnF_Numbers/*:Detail[7]),
        		   ";",
        		  data($wS_Result/MENSAJE/SUSCRIPTOR_DESTINO/*:FnF_Numbers/*:Detail[8]),
        		   ";",
        		  data($wS_Result/MENSAJE/SUSCRIPTOR_DESTINO/*:FnF_Numbers/*:Detail[9]),
        		   ";",
        		  data($wS_Result/MENSAJE/SUSCRIPTOR_DESTINO/*:IsFraudLocked),
        		   ";",
        		  data($wS_Result/MENSAJE/SUSCRIPTOR_DESTINO/*:IsLocked),
        		   ";",
        		  data($wS_Result/MENSAJE/SUSCRIPTOR_DESTINO/*:IsBestFnFPossible),
        		   ";",
        		  data($wS_Result/MENSAJE/SUSCRIPTOR_DESTINO/*:BestFnF_Numbers/*:Detail[1]),
        		   ";",
        		  data($wS_Result/MENSAJE/SUSCRIPTOR_DESTINO/*:OnPeakAccountID/*:Balance),
        		   ";",
        		  data($wS_Result/MENSAJE/SUSCRIPTOR_DESTINO/*:OnPeakAccountID/*:ExpiryDate),
        		   ";",
        		  data($wS_Result/MENSAJE/SUSCRIPTOR_DESTINO/*:OffPeakAccountID/*:Balance),
        		   ";",
        		  data($wS_Result/MENSAJE/SUSCRIPTOR_DESTINO/*:OffPeakAccountID/*:ExpiryDate),
        		   ";",
        		  data($wS_Result/MENSAJE/SUSCRIPTOR_DESTINO/*:FreeSMSAccountID/*:Balance),
        		   ";",
        		  data($wS_Result/MENSAJE/SUSCRIPTOR_DESTINO/*:FreeSMSAccountID/*:ExpiryDate),
        		   ";",
        		  data($wS_Result/MENSAJE/SUSCRIPTOR_DESTINO/*:BonusAccountID/*:Balance),
        		   ";",
        		  data($wS_Result/MENSAJE/SUSCRIPTOR_DESTINO/*:BonusAccountID/*:ExpiryDate),
        		   ";",
        		  data($wS_Result/MENSAJE/SUSCRIPTOR_DESTINO/*:MinutesAccountID2/*:Balance),
        		   ";",
        		  data($wS_Result/MENSAJE/SUSCRIPTOR_DESTINO/*:MinutesAccountID2/*:ExpiryDate),
        		   ";",
        		  data($wS_Result/MENSAJE/SUSCRIPTOR_DESTINO/*:MinutesAccountID3/*:Balance),
        		   ";",
        		  data($wS_Result/MENSAJE/SUSCRIPTOR_DESTINO/*:MinutesAccountID3/*:ExpiryDate),
        		   ";",
        		  data($wS_Result/MENSAJE/SUSCRIPTOR_DESTINO/*:MinutesAccountID4/*:Balance),
        		   ";",
        		  data($wS_Result/MENSAJE/SUSCRIPTOR_DESTINO/*:MinutesAccountID4/*:ExpiryDate),
        		   ";",
        		  data($wS_Result/MENSAJE/SUSCRIPTOR_DESTINO/*:MonetaryAccountID2/*:Balance),
        		   ";",
        		  data($wS_Result/MENSAJE/SUSCRIPTOR_DESTINO/*:MonetaryAccountID2/*:ExpiryDate),
        		   ";",
        		  data($wS_Result/MENSAJE/SUSCRIPTOR_DESTINO/*:MonetaryAccountID3/*:Balance),
        		   ";",
        		  data($wS_Result/MENSAJE/SUSCRIPTOR_DESTINO/*:MonetaryAccountID3/*:ExpiryDate)
        		  )
        		  
        		  
        		  
        		  
};

declare variable $wS_Result as element(ns1:WS_Result) external;

xf:adaptarParametrosSalidaTrama201($wS_Result)
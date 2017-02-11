xquery version "1.0" encoding "Cp1252";
(:: pragma bea:global-element-parameter parameter="$reglasNegocio" element="ns2:WS_Result" location="../Schemas/PS_ITEL_EJECUTARREGLASNEGOCIO.xsd" ::)
(:: pragma bea:global-element-parameter parameter="$ejecutador" element="ns0:WS_Result" location="../Schemas/PS_ITEL_EJECUTADOR.xsd" ::)

declare namespace xf = "http://tempuri.org/ITEL/Core/Resources/XQueries/adaptarParametrosSalidaTrama200/";
declare namespace ns2 = "http://www.comcel.com.co/EjecutarReglasNegocio/";
declare namespace ns1 = "http://www.comcel.com.co/IN/OperacionCorba";
declare namespace ns0 = "http://www.comcel.com.co/Ejecutador/";

declare function xf:adaptarParametrosSalidaTrama200($reglasNegocio as element(ns2:WS_Result),
    $ejecutador as element(ns0:WS_Result))
    as xs:string {
        
        let $balanceOnPeak := if( fn:exists($ejecutador/MENSAJE/BALANCES/BALANCE[CUENTA='1']) ) then $ejecutador/MENSAJE/BALANCES/BALANCE[CUENTA='1']/VALOR else data($reglasNegocio/MENSAJE/SUSCRIPTOR_DESTINO/*:OnPeakAccountID/*:Balance)
        let $balanceBonus := if( fn:exists($ejecutador/MENSAJE/BALANCES/BALANCE[CUENTA='4']) ) then $ejecutador/MENSAJE/BALANCES/BALANCE[CUENTA='4']/VALOR else data($reglasNegocio/MENSAJE/SUSCRIPTOR_DESTINO/*:BonusAccountID/*:Balance)
        let $balanceMonetaria := if( fn:exists($ejecutador/MENSAJE/BALANCES/BALANCE[CUENTA='5']) ) then $ejecutador/MENSAJE/BALANCES/BALANCE[CUENTA='5']/VALOR else data($reglasNegocio/MENSAJE/SUSCRIPTOR_DESTINO/*:MonetaryAccountID2/*:Balance)
        let $consultas := if( data($reglasNegocio/MENSAJE/PARAMETROS_REGLAS/PARAMETRO[NOMBRE='TIPOCONSULTA']/VALOR) = "1" ) then xs:integer(data($reglasNegocio/MENSAJE/PARAMETROS_REGLAS/PARAMETRO[NOMBRE='CONSULTASREALIZADAS']/VALOR)) + 1 else xs:integer(data($reglasNegocio/MENSAJE/PARAMETROS_REGLAS/PARAMETRO[NOMBRE='CONSULTASREALIZADAS']/VALOR))
        return 
        fn:concat($consultas,
        		  ";",
        		  data($reglasNegocio/MENSAJE/PARAMETROS_REGLAS/PARAMETRO[NOMBRE='MONTOCUENTA']/VALOR),
        		  ";",
        		  $balanceOnPeak,
        		  ";",
        		  data($reglasNegocio/MENSAJE/SUSCRIPTOR_DESTINO/*:OnPeakAccountID/*:ExpiryDate),
        		  ";",
        		  data($reglasNegocio/MENSAJE/SUSCRIPTOR_DESTINO/*:OffPeakAccountID/*:Balance),
        		   ";",
        		  data($reglasNegocio/MENSAJE/SUSCRIPTOR_DESTINO/*:OffPeakAccountID/*:ExpiryDate),
        		   ";",
        		  data($reglasNegocio/MENSAJE/SUSCRIPTOR_DESTINO/*:FreeSMSAccountID/*:Balance),
        		   ";",
        		  data($reglasNegocio/MENSAJE/SUSCRIPTOR_DESTINO/*:FreeSMSAccountID/*:ExpiryDate),
        		   ";",
        		  $balanceBonus,
        		   ";",
        		  data($reglasNegocio/MENSAJE/SUSCRIPTOR_DESTINO/*:BonusAccountID/*:ExpiryDate),
        		   ";",
        		  data($reglasNegocio/MENSAJE/SUSCRIPTOR_DESTINO/*:MinutesAccountID2/*:Balance),
        		   ";",
        		  data($reglasNegocio/MENSAJE/SUSCRIPTOR_DESTINO/*:MinutesAccountID2/*:ExpiryDate),
        		   ";",
        		  data($reglasNegocio/MENSAJE/SUSCRIPTOR_DESTINO/*:MinutesAccountID3/*:Balance),
        		   ";",
        		  data($reglasNegocio/MENSAJE/SUSCRIPTOR_DESTINO/*:MinutesAccountID3/*:ExpiryDate),
        		   ";",
        		  data($reglasNegocio/MENSAJE/SUSCRIPTOR_DESTINO/*:MinutesAccountID4/*:Balance),
        		   ";",
        		  data($reglasNegocio/MENSAJE/SUSCRIPTOR_DESTINO/*:MinutesAccountID4/*:ExpiryDate),
        		   ";",
        		  $balanceMonetaria,
        		   ";",
        		  data($reglasNegocio/MENSAJE/SUSCRIPTOR_DESTINO/*:MonetaryAccountID2/*:ExpiryDate),
        		   ";",
        		  data($reglasNegocio/MENSAJE/SUSCRIPTOR_DESTINO/*:MonetaryAccountID3/*:Balance),
        		   ";",
        		  data($reglasNegocio/MENSAJE/SUSCRIPTOR_DESTINO/*:MonetaryAccountID3/*:ExpiryDate)
        		  )
};

declare variable $reglasNegocio as element(ns2:WS_Result) external;
declare variable $ejecutador as element(ns0:WS_Result) external;

xf:adaptarParametrosSalidaTrama200($reglasNegocio,
    $ejecutador)
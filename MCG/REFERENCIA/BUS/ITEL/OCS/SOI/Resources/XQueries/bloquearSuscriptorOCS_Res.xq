xquery version "1.0" encoding "Cp1252";
(:: pragma bea:global-element-parameter parameter="$wS_Result1" element="ns0:WS_Result" location="../../../AIR/Resources/Schemas/PS_ITEL_ACTUALIZAR_BLOQUEO_RECARGA.xsd" ::)
(:: pragma bea:global-element-parameter parameter="$wS_Result2" element="ns1:WS_Result" location="../../../AIR/Resources/Schemas/PS_ITEL_ACTUALIZAR_BLOQUEO_TEMPORAL.xsd" ::)
(:: pragma bea:global-element-return element="ns3:WS_Result" location="../Schemas/PS_ITEL_BLOQUEAR_SUSCRIPTOR.xsd" ::)

declare namespace xf = "http://tempuri.org/ITEL/OCS/SOI/Resources/XQueries/bloquearSuscriptorOCS_Res/";
declare namespace ns0 = "http://www.comcel.com.co/ActualizarBloqueoRecargaOCS/";
declare namespace ns2 = "http://www.comcel.com.co/OCS/OperacionCorbaOCS";
declare namespace ns1 = "http://www.comcel.com.co/ActualizarBloqueoTemporalOCS/";
declare namespace ns4 = "http://www.comcel.com.co/OCS/OperacionOCS_AIR";
declare namespace ns3 = "http://www.comcel.com.co/BloquearSuscriptorOCS/";

declare function xf:bloquearSuscriptorOCS_Res($wS_Result1 as element(ns0:WS_Result),
    $wS_Result2 as element(ns1:WS_Result))
    as element(ns3:WS_Result) {
            let $servicio := if(exists($wS_Result1/CODIGO) and data($wS_Result1/CODIGO)!= "") then "2" else (if(exists($wS_Result2/CODIGO) and data($wS_Result2/CODIGO)!= "") then "1" else "0")  
	return
        <ns3:WS_Result>
            <CODIGO>{ if ($servicio="0") then "901" else (if($servicio="2") then if(data($wS_Result1/CODIGO)="104") then "902" else data($wS_Result1/CODIGO) else if(data($wS_Result2/CODIGO)="104") then "902" else data($wS_Result2/CODIGO)) }</CODIGO>
            <MENSAJE>
                <BLOQUEAR_SUSCRIPTOR exito = "{ if ($servicio="1" or $servicio="2" ) then "true" else "false" }"
                                     mensaje = "{ if ($servicio="0") then "901" else (if($servicio="2") then data($wS_Result1/DESCRIPCION) else data($wS_Result2/DESCRIPCION)) }"/>
            </MENSAJE>
            <DESCRIPCION>{ if ($servicio="0") then "901" else (if($servicio="2") then data($wS_Result1/DESCRIPCION) else data($wS_Result2/DESCRIPCION)) }</DESCRIPCION>
        </ns3:WS_Result>
};

declare variable $wS_Result1 as element(ns0:WS_Result) external;
declare variable $wS_Result2 as element(ns1:WS_Result) external;

xf:bloquearSuscriptorOCS_Res($wS_Result1,
    $wS_Result2)
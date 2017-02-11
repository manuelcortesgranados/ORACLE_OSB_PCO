(:: pragma bea:global-element-parameter parameter="$oCSResponse1" element="ns0:OCSResponse" location="../Schemas/DA_ITEL_OPERACION_OCS_SOI.xsd" ::)
(:: pragma bea:global-element-return element="ns1:WS_Result" location="../Schemas/PS_ITEL_CONSULTAR_SUSCRIPTOR.xsd" ::)

declare namespace xf = "http://tempuri.org/ITEL/OCS/Resources/XQueries/consultarDetalleSuscriptorOCSSOI_Res/";
declare namespace ns1 = "http://www.comcel.com.co/OCS/ConsultarDetalleSuscriptorOCS/";
declare namespace ns0 = "http://www.comcel.com.co/OCS/OperacionOCS_SOI";

declare function xf:consultarDetalleSuscriptorOCSSOI_Res($oCSResponse1 as element(ns0:OCSResponse))
    as element(ns1:WS_Result) {
        <ns1:WS_Result>
            <CODIGO/>
            <MENSAJE>
                <CONSULTAR_DETALLE_SUSCRIPTOR>                   
                   {$oCSResponse1/node()}
                </CONSULTAR_DETALLE_SUSCRIPTOR>
            </MENSAJE>
            <DESCRIPCION/>
       </ns1:WS_Result>     
};

declare variable $oCSResponse1 as element(ns0:OCSResponse) external;

xf:consultarDetalleSuscriptorOCSSOI_Res($oCSResponse1)
(:: pragma bea:global-element-parameter parameter="$wS_Result1" element="ns2:WS_Result" location="../../../OCS/AIR/Resources/Schemas/PS_ITEL_CONSULTAR_OFFER_ODM.xsd" ::)
(:: pragma bea:global-element-return element="ns1:WS_Result" location="../Schemas/PS_ITEL_CONSULTAR_DATOS_MIN_PS.xsd" ::)

declare namespace ns2 = "http://www.comcel.com.co/ConsultarOfferOCS/";
declare namespace ns1 = "http://www.comcel.com.co/consultarPaquetesDatosMin/";
declare namespace ns0 = "http://www.comcel.com.co/OCS/OperacionOCS_AIR";
declare namespace xf = "http://tempuri.org/ITEL/Core/Resources/XQueries/consultarPaquetesDatosMin_Res/";

declare function xf:consultarPaquetesDatosMin_Res($wS_Result1 as element(ns2:WS_Result))
    as element(ns1:WS_Result) {
        <ns1:WS_Result>
            <CODIGO>{ data($wS_Result1/CODIGO) }</CODIGO>
            <MENSAJE>
            	{
            	for $SERVICIO in $wS_Result1/*:MENSAJE/*:CONSULTAR_OFFER/*:offerInformationList/*:Detail
                    return
                	<PAQUETE>

         				<PRODUCTID>153</PRODUCTID>
                    	<FECHAINICIO>{ data($SERVICIO/*:startDate) }</FECHAINICIO>
                        <FECHAFIN>{ data($SERVICIO/*:expiryDate) }</FECHAFIN>
                        <ESTADO>{ data($SERVICIO/*:offerState) }</ESTADO>
                        <SUSCRIPCION>{ data($SERVICIO/*:offerID) }</SUSCRIPCION>
                        
               		
                	</PAQUETE>
                }
            </MENSAJE>
            <DESCRIPCION>{ data($wS_Result1/DESCRIPCION) }</DESCRIPCION>
        </ns1:WS_Result>
};

declare variable $wS_Result1 as element(ns2:WS_Result) external;

xf:consultarPaquetesDatosMin_Res($wS_Result1)

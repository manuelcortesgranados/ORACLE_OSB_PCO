xquery version "1.0" encoding "Cp1252";
(:: pragma  parameter="$proceso" type="xs:anyType" ::)
(:: pragma bea:global-element-parameter parameter="$wS_Result1" element="ns2:WS_Result" location="../../../OCS/AIR/Resources/Schemas/PS_ITEL_CONSULTAR_OFFER_ODM.xsd" ::)
(:: pragma bea:global-element-return element="ns1:WS_Result" location="../Schemas/PS_ITEL_CONSULTAR_DATOS_MIN_PS.xsd" ::)

declare namespace xf = "http://tempuri.org/ITEL/Core/Resources/XQueries/consultarDatosMin_Res/";
declare namespace ns2 = "http://www.comcel.com.co/ConsultarOfferOCS/";
declare namespace ns1 = "http://www.comcel.com.co/consultarPaquetesDatosMin/";
declare namespace ns0 = "http://www.comcel.com.co/OCS/OperacionOCS_AIR";

declare function xf:consultarDatosMin_Res($proceso as element(*))
    as element(ns1:WS_Result) {
         <ns1:WS_Result>
            <CODIGO>1</CODIGO>
            <MENSAJE>
            	{
            	 $proceso
                }
            </MENSAJE>
            <DESCRIPCION>Ejecucion Exitosa</DESCRIPCION>
        </ns1:WS_Result>
};

declare variable $proceso as element(*) external; 

xf:consultarDatosMin_Res($proceso)

(:: pragma bea:global-element-return element="ns0:Input_Parameters" location="../Schemas/PS_ITEL_CONSULTARVIGENCIAELEGIDOSMS.xsd" ::)

declare namespace ns0 = "http://www.comcel.com.co/ConsultarVigenciaElegidoSMS/";
declare namespace xf = "http://tempuri.org/ITEL/Core/Resources/XQueries/consultarVigenciaElegidoSMSPS_Req/";

declare function xf:consultarVigenciaElegidoSMSPS_Req($min as xs:decimal,
    $elegido as xs:decimal)
    as element(ns0:Input_Parameters) {
        <ns0:Input_Parameters>
            <MIN>{ $min }</MIN>
            <MIN_ELEGIDO>{ $elegido }</MIN_ELEGIDO>
        </ns0:Input_Parameters>
};

declare variable $min as xs:decimal external;
declare variable $elegido as xs:decimal external;

xf:consultarVigenciaElegidoSMSPS_Req($min,
    $elegido)
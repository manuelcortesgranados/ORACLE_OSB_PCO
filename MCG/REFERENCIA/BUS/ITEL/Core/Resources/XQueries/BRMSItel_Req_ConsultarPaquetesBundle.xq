(:: pragma bea:global-element-return element="ns0:Input_Parameters" location="../Schemas/PS_ITEL_CONSULTARPAQUETES_TAT.xsd" ::)

declare namespace ns0 = "http://www.comcel.com.co/ConsultarPaquetesTAT/";
declare namespace xf = "http://tempuri.org/ITEL/Core/Resources/XQueries/BRMStoItel_Req_ConsultarPaquetesBundle/";

declare function xf:BRMStoItel_Req_ConsultarPaquetesBundle($paquete as xs:string)
    as element(ns0:Input_Parameters) {
        <ns0:Input_Parameters>
            <CODIGO>{ $paquete }</CODIGO>
        </ns0:Input_Parameters>
};

declare variable $paquete as xs:string external;

xf:BRMStoItel_Req_ConsultarPaquetesBundle($paquete)
(:: pragma bea:global-element-return element="ns0:Input_Parameters" location="../Schemas/PS_ITEL_CONSULTARCONTPROVTAR.xsd" ::)

declare namespace ns0 = "http://www.comcel.com.co/ConsultarContProvTar/";
declare namespace xf = "http://tempuri.org/ITEL/Core/Resources/XQueries/consultarContProvTarPS_Req/";

declare function xf:consultarContProvTarPS_Req($serviceClass as xs:string, $fafIdGroup as xs:decimal)
    as element(ns0:Input_Parameters) {
        <ns0:Input_Parameters>
            <SERVICE_CLASS>{ $serviceClass }</SERVICE_CLASS>
            <FAFIDGROUP>{ $fafIdGroup }</FAFIDGROUP>
        </ns0:Input_Parameters>
};

declare variable $serviceClass as xs:string external;
declare variable $fafIdGroup as xs:decimal external;

xf:consultarContProvTarPS_Req($serviceClass, $fafIdGroup)
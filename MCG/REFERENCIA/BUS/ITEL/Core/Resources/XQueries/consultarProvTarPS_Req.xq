(:: pragma bea:global-element-return element="ns0:Input_Parameters" location="../Schemas/PS_ITEL_CONSULTARPROVTAR.xsd" ::)

declare namespace ns0 = "http://www.comcel.com.co/ConsultarProvTar/";
declare namespace xf = "http://tempuri.org/ITEL/Core/Resources/XQueries/consultarProvTarPS_Req/";

declare function xf:consultarProvTarPS_Req($contrato as xs:string)
    as element(ns0:Input_Parameters) {
        <ns0:Input_Parameters>
            <CONTRATO>{ $contrato }</CONTRATO>
        </ns0:Input_Parameters>
};

declare variable $contrato as xs:string external;

xf:consultarProvTarPS_Req($contrato)
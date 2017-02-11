(:: pragma bea:global-element-return element="ns0:Input_Parameters" location="../Schemas/PS_ITEL_CONSULTARPAQUETES_TAT.xsd" ::)

declare namespace ns0 = "http://www.comcel.com.co/ConsultarPaquetesTAT/";
declare namespace xf = "http://tempuri.org/ITEL/Core/Resources/XQueries/ConsultarPaquetesTATPS_Req/";

declare function xf:ConsultarPaquetesTATPS_Req($codigo as xs:string)
    as element(ns0:Input_Parameters) {
        <ns0:Input_Parameters>
            <CODIGO>{ $codigo }</CODIGO>
        </ns0:Input_Parameters>
};

declare variable $codigo as xs:string external;

xf:ConsultarPaquetesTATPS_Req($codigo)
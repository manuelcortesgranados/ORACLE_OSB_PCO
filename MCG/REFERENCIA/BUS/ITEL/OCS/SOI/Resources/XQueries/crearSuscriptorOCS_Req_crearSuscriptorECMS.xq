(:: pragma bea:local-element-parameter parameter="$sUSCRIPTOR1" type="ns1:Input_Parameters/SUSCRIPTOR" location="../Schemas/PS_ITEL_CREAR_SUSCRIPTOR.xsd" ::)
(:: pragma bea:global-element-return element="ns0:Input_Parameters" location="../Schemas/PS_ITEL_CREAR_SUSCRIPTOR_ECMS.xsd" ::)

declare namespace ns0 = "http://www.comcel.com.co/CrearSuscriptorECMS/";
declare namespace ns2 = "http://www.comcel.com.co/OCS/OperacionCorbaOCS";
declare namespace ns1 = "http://www.comcel.com.co/CrearSuscriptorOCS/";
declare namespace xf = "http://tempuri.org/ITEL/OCS/SOI/Resources/XQueries/crearSuscriptorOCS_Req_crearSuscriptorECMS/";

declare function xf:crearSuscriptorOCS_Req_crearSuscriptorECMS($sUSCRIPTOR1 as element())
    as element(ns0:Input_Parameters) {
        <ns0:Input_Parameters>
            <SUSCRIPTOR>{ $sUSCRIPTOR1/@* , $sUSCRIPTOR1/node() }</SUSCRIPTOR>
        </ns0:Input_Parameters>
};

declare variable $sUSCRIPTOR1 as element() external;

xf:crearSuscriptorOCS_Req_crearSuscriptorECMS($sUSCRIPTOR1)

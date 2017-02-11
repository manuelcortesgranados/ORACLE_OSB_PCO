(:: pragma bea:global-element-return element="ns0:Input_Parameters" location="../Schemas/PS_ITEL_CONSULTARHOSTID.xsd" ::)

declare namespace ns0 = "http://www.comcel.com.co/ConsultarHostId/";
declare namespace xf = "http://tempuri.org/ITEL/Core/Resources/XQueries/consultarHostId_Req/";

declare function xf:consultarHostIdReq($hostId as xs:string)
    as element(ns0:Input_Parameters) {
        <ns0:Input_Parameters>
            <HIDCODIGO>{ $hostId }</HIDCODIGO>
        </ns0:Input_Parameters>
};

declare variable $hostId as xs:string external;

xf:consultarHostIdReq($hostId)
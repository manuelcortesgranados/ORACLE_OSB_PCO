(:: pragma bea:global-element-return element="ns0:Input_Parameters" location="../../../RTC/Resources/Schemas/PS_PROVISION_SPR_RTC.xsd" ::)

declare namespace ns0 = "http://www.comcel.com.co/ITEL/provisionSPR_RTC/";
declare namespace xf = "http://tempuri.org/ITEL/Core/Resources/XQueries/ejecutador_Req_provisionSPR_RTC/";

declare function xf:ejecutador_Req_provisionSPR_RTC($msisdn as xs:string,
    $spr_type as xs:string,
    $operacion as xs:string)
    as element(ns0:Input_Parameters) {
        <ns0:Input_Parameters>
            <xmlSubscriberRequest>
                <msisdn>{ $msisdn }</msisdn>
                <spr_type>{ $spr_type }</spr_type>
                <operacion>{ $operacion }</operacion>
            </xmlSubscriberRequest>
        </ns0:Input_Parameters>
};

declare variable $msisdn as xs:string external;
declare variable $spr_type as xs:string external;
declare variable $operacion as xs:string external;

xf:ejecutador_Req_provisionSPR_RTC($msisdn,
    $spr_type,
    $operacion)
(:: pragma bea:global-element-return element="ns0:Input_Parameters" location="../../../RTC/Resources/Schemas/PS_PROVISION_PAQUETE_DATOS_SM.xsd" ::)

declare namespace ns0 = "http://www.comcel.com.co/SuscriptionAddRequestSM/";
declare namespace xf = "http://tempuri.org/ITEL/Core/Resources/XQueries/consumirAuditoriaDiaSorpresaElegidos_provisionPaqueteDatosSM_Req/";

declare function xf:consumirAuditoriaDiaSorpresaElegidos_provisionPaqueteDatosSM_Req($evemin as xs:string,
    $bono as xs:string)
    as element(ns0:Input_Parameters) {
        <ns0:Input_Parameters>        	
            <msisdn>{ fn:concat('57',data($evemin)) }</msisdn>
            <user>ITEL_TEST</user>
        	<password>IT1235$</password>
            <productid>{ data($bono) }</productid>
        </ns0:Input_Parameters>
};

declare variable $evemin as xs:string external;
declare variable $bono as xs:string external;

xf:consumirAuditoriaDiaSorpresaElegidos_provisionPaqueteDatosSM_Req($evemin,
    $bono)

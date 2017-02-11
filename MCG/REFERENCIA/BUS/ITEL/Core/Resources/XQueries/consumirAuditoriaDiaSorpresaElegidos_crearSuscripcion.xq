(:: pragma bea:global-element-return element="ns0:Input_Parameters" location="../../../OCS/OLM/Resources/Schemas/PS_ITEL_CREAR_SUSCRIPCION.xsd" ::)

declare namespace ns0 = "http://www.comcel.com.co/CrearSuscripcionOCS/";
declare namespace xf = "http://tempuri.org/ITEL/Core/Resources/XQueries/consumirAuditoriaDiaSorpresaElegidos_crearSuscripcion/";

declare function xf:consumirAuditoriaDiaSorpresaElegidos_crearSuscripcion($min as xs:string,
    $paquete as xs:string)
    as element(ns0:Input_Parameters) {
        <ns0:Input_Parameters>
            <REQUESTID>0</REQUESTID>
            <OPERATION>createNewSubscription</OPERATION>
            <PRODUCTNAME>{ $paquete }</PRODUCTNAME>
            <SUBSCRIBERID>0</SUBSCRIBERID>
            <MSISDN>{ concat('57', $min) }</MSISDN>
            <IMSI>0</IMSI>
            <IMEI>0</IMEI>
            <ICCID>0</ICCID>
            <EMAIL>itel@claro.com.co</EMAIL>
            <SUBSCRIBERTYPE>prepaid</SUBSCRIBERTYPE>
            <DEVICETYPE>handset</DEVICETYPE>
            <ORIGINATINGNODEINFO>ITEL</ORIGINATINGNODEINFO>
            <EXTERNALDATA>test</EXTERNALDATA>
            <CHARGED>no</CHARGED>
        </ns0:Input_Parameters>
};

declare variable $min as xs:string external;
declare variable $paquete as xs:string external;

xf:consumirAuditoriaDiaSorpresaElegidos_crearSuscripcion($min,
    $paquete)

(:: pragma bea:global-element-return element="ns0:Input_Parameters" location="../../../OCS/AIR/Resources/Schemas/PS_ITEL_CONSULTAR_FAFLIST.xsd" ::)

declare namespace xf = "http://tempuri.org/ITEL/Core/Resources/XQueries/consultarFaFListPS_Req/";
declare namespace ns0 = "http://www.comcel.com.co/ConsultarFaFListOCS/";

declare function xf:consultarFaFListPS_Req($min as xs:string)
    as element(ns0:Input_Parameters) {
        <ns0:Input_Parameters>
            <TIPO_NODO>{ "EXT" }</TIPO_NODO>
            <HOST_ORIGEN>{ "ITEL" }</HOST_ORIGEN>
            <ID_TRANSACCION>{ "12345" }</ID_TRANSACCION>
            <FECHA_TRANSACCION>{ "20130214T12:00:00+0000" }</FECHA_TRANSACCION>
            <MIN>{ concat("57" ,$min) }</MIN>
            <REQUESTED_OWNER>{ "1" }</REQUESTED_OWNER>
        </ns0:Input_Parameters>
};

declare variable $min as xs:string external;

xf:consultarFaFListPS_Req($min)
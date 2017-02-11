(:: pragma bea:global-element-return element="ns0:Input_Parameters" location="../Schemas/PS_ITEL_CONSULTAR_UNIT_TYPE.xsd" ::)

declare namespace ns0 = "http://www.comcel.com.co/ConsultarUnitType/";
declare namespace xf = "http://tempuri.org/ITEL/Core/Resources/XQueries/consultarUnitType_Req_ejecutarReglasNegocio/";

declare function xf:consultarUnitType_Req_ejecutarReglasNegocio($cuentaID as xs:decimal)
    as element(ns0:Input_Parameters) {
        <ns0:Input_Parameters>
            <OFFERID>{ $cuentaID }</OFFERID>
        </ns0:Input_Parameters>
};

declare variable $cuentaID as xs:decimal external;

xf:consultarUnitType_Req_ejecutarReglasNegocio($cuentaID)
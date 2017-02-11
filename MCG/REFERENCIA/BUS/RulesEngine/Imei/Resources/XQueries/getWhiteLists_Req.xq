(:: pragma bea:global-element-parameter parameter="$input_Parameters1" element="ns1:Input_Parameters" location="../Schemas/PS_GET_WHITELISTS.xsd" ::)
(:: pragma bea:global-element-return element="ns0:consulta" location="../Schemas/BS_GET_WHITELISTS_ACTIVATION1.xsd" ::)

declare namespace ns1 = "http://www.claro.com.co/rulesEngine/getWhiteLists";
declare namespace ns0 = "http://consultaActivacion.ws.imei.iecisa.co/";
declare namespace xf = "http://tempuri.org/RulesEngine/Imei/Resources/XQueries/getWhiteList_Req/";

declare function xf:getWhiteList_Req($input_Parameters1 as element(ns1:Input_Parameters))
    as element(ns0:consulta) {
        <ns0:consulta>
            <tipoIdentificacion>{ data($input_Parameters1/customerDocument/type/code) }</tipoIdentificacion>
            <numeroIdentificacion>{ data($input_Parameters1/customerDocument/identifierNumber) }</numeroIdentificacion>
            <imei>{ data($input_Parameters1/customerOrder/product[1]/code) }</imei>
            <equipoTraido>{ data($input_Parameters1/customerOrder/acquisitionType) }</equipoTraido>
        </ns0:consulta>
};

declare variable $input_Parameters1 as element(ns1:Input_Parameters) external;

xf:getWhiteList_Req($input_Parameters1)

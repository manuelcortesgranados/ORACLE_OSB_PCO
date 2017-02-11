(:: pragma bea:global-element-parameter parameter="$input_Parameters1" element="ns1:Input_Parameters" location="../Schemas/PS_GET_BLACKLISTS.xsd" ::)
(:: pragma bea:global-element-return element="ns0:consulta" location="../Schemas/BS_GET_BLACKLISTS.xsd" ::)

declare namespace ns1 = "http://www.claro.com.co/rulesEngine/getBlackLists";
declare namespace ns0 = "http://consultaNegativa.ws.imei.iecisa.co/";
declare namespace xf = "http://tempuri.org/RulesEngine/Imei/Resources/XQueries/getBlackLists_Req/";

declare function xf:getBlackLists_Req($input_Parameters1 as element(ns1:Input_Parameters))
    as element(ns0:consulta) {
        <ns0:consulta>
            <imei>{ data($input_Parameters1/product/code) }</imei>
        </ns0:consulta>
};

declare variable $input_Parameters1 as element(ns1:Input_Parameters) external;

xf:getBlackLists_Req($input_Parameters1)

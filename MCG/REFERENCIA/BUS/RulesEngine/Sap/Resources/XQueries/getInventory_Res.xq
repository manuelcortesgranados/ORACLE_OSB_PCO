(:: pragma bea:global-element-parameter parameter="$zMM_VALIDAR_SERIAL.Response1" element="ns0:ZMM_VALIDAR_SERIAL.Response" location="../Schemas/BS_VALIDATE_SERIAL_RES.xsd" ::)
(:: pragma bea:global-element-return element="ns1:WS_Result" location="../Schemas/PS_GET_INVENTORY.xsd" ::)

declare namespace ns2 = "http://www.claro.com.co/rulesEngine/canonicalModel/CommonBusinessEntities";
declare namespace ns1 = "http://www.claro.com.co/rulesEngine/getInventory";
declare namespace ns3 = "http://www.claro.com.co/rulesEngine/canonicalModel/ProductDomain";
declare namespace ns0 = "urn:sap-com:document:sap:rfc:functions.response";
declare namespace xf = "http://tempuri.org/RulesEngine/Sap/Resources/XQueries/getInventory_Res/";

declare function xf:getInventory_Res($zMM_VALIDAR_SERIAL.Response1 as element(ns0:ZMM_VALIDAR_SERIAL.Response))
    as element(ns1:WS_Result) {
        <ns1:WS_Result>
            <code>1</code>
            <message>
                <stockInventory>
                    <status>
                            <description>{ data($zMM_VALIDAR_SERIAL.Response1/ns0:E_STATUS) }</description>
                    </status>
                    <type>{ data($zMM_VALIDAR_SERIAL.Response1/ns0:E_TIPO_STOCK) }</type>
                    <assessment>{ data($zMM_VALIDAR_SERIAL.Response1/ns0:E_VALORACION) }</assessment>
                    <material>{ data($zMM_VALIDAR_SERIAL.Response1/ns0:E_MATERIAL) }</material>
                    <stock>{ data($zMM_VALIDAR_SERIAL.Response1/ns0:E_EXISTENCIA) }</stock>
                </stockInventory>
            </message>
            <description>{ data($zMM_VALIDAR_SERIAL.Response1/ns0:E_MESSAGE) }</description>
        </ns1:WS_Result>
};

declare variable $zMM_VALIDAR_SERIAL.Response1 as element(ns0:ZMM_VALIDAR_SERIAL.Response) external;

xf:getInventory_Res($zMM_VALIDAR_SERIAL.Response1)

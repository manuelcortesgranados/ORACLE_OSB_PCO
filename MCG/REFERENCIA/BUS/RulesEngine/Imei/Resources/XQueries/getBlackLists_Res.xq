(:: pragma bea:global-element-parameter parameter="$consultaResponse1" element="ns3:consultaResponse" location="../Schemas/BS_GET_BLACKLISTS.xsd" ::)
(:: pragma bea:global-element-parameter parameter="$input_Parameters1" element="ns4:Input_Parameters" location="../Schemas/PS_GET_BLACKLISTS.xsd" ::)
(:: pragma bea:global-element-return element="ns4:WS_Result" location="../Schemas/PS_GET_BLACKLISTS.xsd" ::)

declare namespace ns2 = "http://www.claro.com.co/rulesEngine/canonicalModel/ProductDomain";
declare namespace ns1 = "http://www.claro.com.co/rulesEngine/canonicalModel/CommonBusinessEntities";
declare namespace ns4 = "http://www.claro.com.co/rulesEngine/getBlackLists";
declare namespace ns3 = "http://consultaNegativa.ws.imei.iecisa.co/";
declare namespace ns0 = "http://www.claro.com.co/rulesEngine/canonicalModel/SupplierDomain";
declare namespace xf = "http://tempuri.org/RulesEngine/Imei/Resources/XQueries/getBlackLists_Res/";

declare function xf:getBlackLists_Res($consultaResponse1 as element(ns3:consultaResponse),
    $input_Parameters1 as element(ns4:Input_Parameters))
    as element(ns4:WS_Result) {
        <ns4:WS_Result>
            <code>1</code>
            <message>
                <platformStatus>
                    {
                        for $activa in $input_Parameters1/product/platformStatus/activa
                        return
                            <activa>{ data($activa) }</activa>
                    }
                    {
                        for $amdocs in $input_Parameters1/product/platformStatus/amdocs
                        return
                            <amdocs>{ data($amdocs) }</amdocs>
                    }
                    {
                        for $bscs in $input_Parameters1/product/platformStatus/bscs
                        return
                            <bscs>{ data($bscs) }</bscs>
                    }
                    {
                        for $whiteLists in $input_Parameters1/product/platformStatus/whiteLists
                        return
                            <whiteLists>{ data($whiteLists) }</whiteLists>
                    }
                    {
                        for $consultaResponse in $consultaResponse1/consultaResponse
                        return
                            <blackLists>{ data($consultaResponse) }</blackLists>
                    }
                </platformStatus>
            </message>
            <description>Operacion ejecutada</description>
        </ns4:WS_Result>
};

declare variable $consultaResponse1 as element(ns3:consultaResponse) external;
declare variable $input_Parameters1 as element(ns4:Input_Parameters) external;

xf:getBlackLists_Res($consultaResponse1,
    $input_Parameters1)

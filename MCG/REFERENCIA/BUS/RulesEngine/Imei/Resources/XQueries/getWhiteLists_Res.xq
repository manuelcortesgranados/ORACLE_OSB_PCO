(:: pragma bea:global-element-parameter parameter="$consultaResponse1" element="ns3:consultaResponse" location="../Schemas/BS_GET_WHITELISTS_ACTIVATION1.xsd" ::)
(:: pragma bea:global-element-parameter parameter="$input_Parameters1" element="ns5:Input_Parameters" location="../Schemas/PS_GET_WHITELISTS.xsd" ::)
(:: pragma bea:global-element-return element="ns5:WS_Result" location="../Schemas/PS_GET_WHITELISTS.xsd" ::)

declare namespace ns2 = "http://www.claro.com.co/rulesEngine/canonicalModel/CommonBusinessEntities";
declare namespace ns1 = "http://www.claro.com.co/rulesEngine/canonicalModel/SupplierDomain";
declare namespace ns4 = "http://www.claro.com.co/rulesEngine/canonicalModel/ProductDomain";
declare namespace ns3 = "http://consultaActivacion.ws.imei.iecisa.co/";
declare namespace ns0 = "http://www.claro.com.co/rulesEngine/canonicalModel/CustomerDomain";
declare namespace ns5 = "http://www.claro.com.co/rulesEngine/getWhiteLists";
declare namespace xf = "http://tempuri.org/RulesEngine/Imei/Resources/XQueries/getWhiteLists_Res/";

declare function xf:getWhiteLists_Res($consultaResponse1 as element(ns3:consultaResponse),
    $input_Parameters1 as element(ns5:Input_Parameters))
    as element(ns5:WS_Result) {
        <ns5:WS_Result>
            <code>1</code>
            <message>
                <platformStatus>
                    {
                        for $activa in $input_Parameters1/customerOrder/product[1]/platformStatus/activa
                        return
                            <activa>{ data($activa) }</activa>
                    }
                    {
                        for $amdocs in $input_Parameters1/customerOrder/product[1]/platformStatus/amdocs
                        return
                            <amdocs>{ data($amdocs) }</amdocs>
                    }
                    {
                        for $bscs in $input_Parameters1/customerOrder/product[1]/platformStatus/bscs
                        return
                            <bscs>{ data($bscs) }</bscs>
                    }
                    {
                        for $activa in $consultaResponse1/consultaActivacionResponse/activa
                        return
                            <whiteLists>{ data($activa) }</whiteLists>
                    }
                    {
                        for $blackLists in $input_Parameters1/customerOrder/product[1]/platformStatus/blackLists
                        return
                            <blackLists>{ data($blackLists) }</blackLists>
                    }
                </platformStatus>
            </message>
            <description>Operacion Ejecutada</description>
        </ns5:WS_Result>
};

declare variable $consultaResponse1 as element(ns3:consultaResponse) external;
declare variable $input_Parameters1 as element(ns5:Input_Parameters) external;

xf:getWhiteLists_Res($consultaResponse1,
    $input_Parameters1)

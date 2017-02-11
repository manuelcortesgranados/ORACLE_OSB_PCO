(:: pragma bea:global-element-parameter parameter="$input_Parameters1" element="ns3:Input_Parameters" location="../../../../../RulesEngine/Amdocs/Resources/Schemas/PS_GET_STATUSICCIDSRM.xsd" ::)
(:: pragma bea:global-element-return element="ns3:WS_Result" location="../../../../../RulesEngine/Amdocs/Resources/Schemas/PS_GET_STATUSICCIDSRM.xsd" ::)

declare namespace ns2 = "http://www.claro.com.co/rulesEngine/canonicalModel/ProductDomain";
declare namespace ns1 = "http://www.claro.com.co/rulesEngine/canonicalModel/CommonBusinessEntities";
declare namespace ns3 = "http://www.claro.com.co/rulesEngine/getStatusIccidSrm";
declare namespace ns0 = "http://www.claro.com.co/rulesEngine/canonicalModel/SupplierDomain";
declare namespace xf = "http://tempuri.org/RulesEngine/Dummies/Resources/XQueries/getStatusIccidSrmLocal_PS/";

declare function xf:getStatusIccidSrmLocal_PS($input_Parameters1 as element(ns3:Input_Parameters))
    as element(ns3:WS_Result) {
        <ns3:WS_Result>
            <code>1</code>
            <message>
                <platformStatus>
                    {
                        for $activa in $input_Parameters1/product/platformStatus/activa
                        return
                            <activa>{ data($activa) }</activa>
                    }
                    <amdocs>true</amdocs>
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
                        for $blackLists in $input_Parameters1/product/platformStatus/blackLists
                        return
                            <blackLists>{ data($blackLists) }</blackLists>
                    }
                </platformStatus>
            </message>
            <description>Operacion ejecutada</description>
        </ns3:WS_Result>
};

declare variable $input_Parameters1 as element(ns3:Input_Parameters) external;

xf:getStatusIccidSrmLocal_PS($input_Parameters1)

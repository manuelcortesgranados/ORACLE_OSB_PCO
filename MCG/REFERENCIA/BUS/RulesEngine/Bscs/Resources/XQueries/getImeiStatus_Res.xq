(:: pragma bea:global-element-parameter parameter="$outputParameters1" element="ns1:OutputParameters" location="../Schemas/BD_GET_IMEISTATUSBSCS.xsd" ::)
(:: pragma bea:global-element-parameter parameter="$input_Parameters1" element="ns4:Input_Parameters" location="../Schemas/PS_GET_IMEISTATUSBSCS.xsd" ::)
(:: pragma bea:global-element-return element="ns4:WS_Result" location="../Schemas/PS_GET_IMEISTATUSBSCS.xsd" ::)

declare namespace ns2 = "http://www.claro.com.co/rulesEngine/canonicalModel/CommonBusinessEntities";
declare namespace ns1 = "http://xmlns.oracle.com/pcbpel/adapter/db/RULESENGINE/PKG_RULESENGINE_BSCS/PRC_GET_IMEI_BSCS/";
declare namespace ns4 = "http://www.claro.com.co/rulesEngine/getImeiStatusBscs";
declare namespace ns3 = "http://www.claro.com.co/rulesEngine/canonicalModel/ProductDomain";
declare namespace ns0 = "http://www.claro.com.co/rulesEngine/canonicalModel/SupplierDomain";
declare namespace xf = "http://tempuri.org/RulesEngine/Bscs/Resources/XQueries/getImeiStatus_Res/";

declare function xf:getImeiStatus_Res($outputParameters1 as element(ns1:OutputParameters),
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
                        for $P_STATUS in $outputParameters1/ns1:P_STATUS
                        return
                            <bscs>{ data($P_STATUS) }</bscs>
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
        </ns4:WS_Result>
};

declare variable $outputParameters1 as element(ns1:OutputParameters) external;
declare variable $input_Parameters1 as element(ns4:Input_Parameters) external;

xf:getImeiStatus_Res($outputParameters1,
    $input_Parameters1)

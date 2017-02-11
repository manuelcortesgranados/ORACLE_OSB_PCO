(:: pragma bea:global-element-parameter parameter="$outputParameters1" element="ns1:OutputParameters" location="../Schemas/BD_GET_IMEISTATUSACTIVA.xsd" ::)
(:: pragma bea:global-element-parameter parameter="$input_Parameters1" element="ns0:Input_Parameters" location="../Schemas/PS_GET_IMEISTATUSACTIVA.xsd" ::)
(:: pragma bea:global-element-return element="ns0:WS_Result" location="../Schemas/PS_GET_IMEISTATUSACTIVA.xsd" ::)

declare namespace ns2 = "http://www.claro.com.co/rulesEngine/canonicalModel/SupplierDomain";
declare namespace ns1 = "http://xmlns.oracle.com/pcbpel/adapter/db/INH_MOTORREGLAS/PKG_RULESENGINE_ACTIVA/PRC_GET_IMEI_ACTIVA/";
declare namespace ns4 = "http://www.claro.com.co/rulesEngine/canonicalModel/ProductDomain";
declare namespace ns3 = "http://www.claro.com.co/rulesEngine/canonicalModel/CommonBusinessEntities";
declare namespace ns0 = "http://www.claro.com.co/rulesEngine/getImeiStatusActiva";
declare namespace xf = "http://tempuri.org/RulesEngine/Activa/Resources/XQueries/getImeiStatus_Res/";

declare function xf:getImeiStatus_Res($outputParameters1 as element(ns1:OutputParameters),
    $input_Parameters1 as element(ns0:Input_Parameters))
    as element(ns0:WS_Result) {
        <ns0:WS_Result>
            <code>1</code>
            <message>
                <platformStatus>
                    {
                        for $P_STATUS in $outputParameters1/ns1:P_STATUS
                        return
                            <activa>{ data($P_STATUS) }</activa>
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
                        for $blackLists in $input_Parameters1/product/platformStatus/blackLists
                        return
                            <blackLists>{ data($blackLists) }</blackLists>
                    }
                </platformStatus>
            </message>
            <description>Operacion ejecutada</description>
        </ns0:WS_Result>
};

declare variable $outputParameters1 as element(ns1:OutputParameters) external;
declare variable $input_Parameters1 as element(ns0:Input_Parameters) external;

xf:getImeiStatus_Res($outputParameters1,
    $input_Parameters1)

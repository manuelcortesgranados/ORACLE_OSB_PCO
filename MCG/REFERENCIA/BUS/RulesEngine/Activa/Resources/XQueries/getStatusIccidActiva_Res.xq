(:: pragma bea:global-element-parameter parameter="$outputParameters1" element="ns4:OutputParameters" location="../Schemas/BD_GETSTATUSICCIDACTIVA.xsd" ::)
(:: pragma bea:global-element-parameter parameter="$input_Parameters1" element="ns3:Input_Parameters" location="../Schemas/PS_GET_STATUSICCIDACTIVA.xsd" ::)
(:: pragma bea:global-element-return element="ns3:WS_Result" location="../Schemas/PS_GET_STATUSICCIDACTIVA.xsd" ::)

declare namespace ns2 = "http://www.claro.com.co/rulesEngine/canonicalModel/ProductDomain";
declare namespace ns1 = "http://www.claro.com.co/rulesEngine/canonicalModel/CommonBusinessEntities";
declare namespace ns4 = "http://xmlns.oracle.com/pcbpel/adapter/db/RULESENGINE/PKG_RULESENGINE/PRC_GET_STATUS_ICCID_ACTIVA/";
declare namespace ns3 = "http://www.claro.com.co/rulesEngine/getStatusIccidActiva";
declare namespace ns0 = "http://www.claro.com.co/rulesEngine/canonicalModel/SupplierDomain";
declare namespace xf = "http://tempuri.org/RulesEngine/Activa/Resources/XQueries/getStatusIccidActiva_Res/";

declare function xf:getStatusIccidActiva_Res($outputParameters1 as element(ns4:OutputParameters),
    $input_Parameters1 as element(ns3:Input_Parameters))
    as element(ns3:WS_Result) {
        <ns3:WS_Result>
          		<code>1</code>
            <message>
                <platformStatus>
                    {
                        for $P_STATUS_ICCID_ACTIVA in $outputParameters1/ns4:P_STATUS_ICCID_ACTIVA
                        return
                            <activa>{ data($P_STATUS_ICCID_ACTIVA) }</activa>
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
            <description>Operacion Ejecutada</description>
        </ns3:WS_Result>
};

declare variable $outputParameters1 as element(ns4:OutputParameters) external;
declare variable $input_Parameters1 as element(ns3:Input_Parameters) external;

xf:getStatusIccidActiva_Res($outputParameters1,
    $input_Parameters1)

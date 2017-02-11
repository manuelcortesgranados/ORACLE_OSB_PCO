(:: pragma bea:global-element-parameter parameter="$getSerialStateInformationResponse1" element="ns0:GetSerialStateInformationResponse" location="../Schemas/BS_GET_SERIALSTATUSINFORMATION.xsd" ::)
(:: pragma bea:global-element-parameter parameter="$input_Parameters1" element="ns4:Input_Parameters" location="../Schemas/PS_GET_IMEISTATUSAMDOCS.xsd" ::)
(:: pragma bea:global-element-return element="ns4:WS_Result" location="../Schemas/PS_GET_IMEISTATUSAMDOCS.xsd" ::)

declare namespace ns2 = "http://www.claro.com.co/rulesEngine/canonicalModel/CommonBusinessEntities";
declare namespace ns1 = "http://www.claro.com.co/rulesEngine/canonicalModel/SupplierDomain";
declare namespace ns4 = "http://www.claro.com.co/rulesEngine/getImeiStatusAmdocs";
declare namespace ns3 = "http://www.claro.com.co/rulesEngine/canonicalModel/ProductDomain";
declare namespace ns0 = "http://getserialstateinformation.selfmanagement.schema.amx.com";
declare namespace xf = "http://tempuri.org/RulesEngine/Amdocs/Resources/XQueries/getImeiStatus_Res/";

declare function xf:getImeiStatus_Res($getSerialStateInformationResponse1 as element(ns0:GetSerialStateInformationResponse),
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
                    <amdocs>{ data($getSerialStateInformationResponse1/ns0:status) }</amdocs>
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
        </ns4:WS_Result>
};

declare variable $getSerialStateInformationResponse1 as element(ns0:GetSerialStateInformationResponse) external;
declare variable $input_Parameters1 as element(ns4:Input_Parameters) external;

xf:getImeiStatus_Res($getSerialStateInformationResponse1,
    $input_Parameters1)

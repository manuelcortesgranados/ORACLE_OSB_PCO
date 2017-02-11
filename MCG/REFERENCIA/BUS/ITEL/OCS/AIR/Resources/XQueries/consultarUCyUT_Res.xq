(:: pragma bea:schema-type-parameter parameter="$methodResponse1" type="ns0:methodResponse" location="../Schemas/DA_ITEL_OPERACION_OCS_TYPES.xsd" ::)
(:: pragma bea:global-element-return element="ns1:WS_Result" location="../Schemas/PS_ITEL_CONSULTAR_UCyUT.xsd" ::)

declare namespace ns0 = "http://www.comcel.com.co/OCS/OperacionTypes";
declare namespace ns2 = "http://www.comcel.com.co/OCS/OperacionOCS_AIR";
declare namespace ns1 = "http://www.comcel.com.co/ConsultarUCyUTOCS/";
declare namespace xf = "http://tempuri.org/ITEL/OCS/AIR/Resources/XQueries/consultarUCyUT_Res/";

declare function xf:consultarUCyUT_Res($methodResponse1 as element(),
    $codigo as xs:string,
    $descripcion as xs:string)
    as element(ns1:WS_Result) {
        <ns1:WS_Result>
            <CODIGO>{ $codigo }</CODIGO>
            <MENSAJE>
                <CONSULTAR_UCyUT>
                   <originTransactionID> { data($methodResponse1/params/param/value/struct/member[name = "originTransactionID"]/value/string) }	</originTransactionID>	
                   <responseCode> { data($methodResponse1/params/param/value/struct/member[name = "responseCode"]/value) }	</responseCode> 
                   <usageCounterUsageThresholdInformation> 
                      { 
                        let $usageCounterUsageThresholdInformation1 := $methodResponse1/params/param/value/struct/member[name = "usageCounterUsageThresholdInformation"]
                        for $usageCounterUsageThresholdInformation in $usageCounterUsageThresholdInformation1/value/array/data/value/struct  
                        return 
                        <usageCounterUsageThresholdInformation>
                           <usageCounterID>{data($usageCounterUsageThresholdInformation/member[name = "usageCounterID"]/value)}</usageCounterID>
                           <usageCounterValue>{data($usageCounterUsageThresholdInformation/member[name = "usageCounterValue"]/value)}</usageCounterValue>
                           <usageThresholdInformation> 
                                  <usageThresholdID>{data($usageCounterUsageThresholdInformation/member/value/array/data/value/struct/member[name = "usageThresholdID"]/value)}</usageThresholdID>
                                  <usageThresholdSource>{data($usageCounterUsageThresholdInformation/member/value/array/data/value/struct/member[name = "usageThresholdSource"]/value)}</usageThresholdSource>
                                  <usageThresholdValue>{data($usageCounterUsageThresholdInformation/member/value/array/data/value/struct/member[name = "usageThresholdValue"]/value)}</usageThresholdValue>
                           </usageThresholdInformation>
                        </usageCounterUsageThresholdInformation>                         
                      }
                    </usageCounterUsageThresholdInformation>
                </CONSULTAR_UCyUT>
            </MENSAJE>
            <DESCRIPCION>{ $descripcion }</DESCRIPCION>
        </ns1:WS_Result>
};

declare variable $methodResponse1 as element() external;
declare variable $codigo as xs:string external;
declare variable $descripcion as xs:string external;

xf:consultarUCyUT_Res($methodResponse1,
    $codigo,
    $descripcion)

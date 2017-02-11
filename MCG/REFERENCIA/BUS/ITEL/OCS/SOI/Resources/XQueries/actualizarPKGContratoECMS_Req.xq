(:: pragma bea:global-element-parameter parameter="$input_Parameters1" element="ns2:Input_Parameters" location="../Schemas/PS_ITEL_ACTUALIZAR_PKG_CONTRACT.xsd" ::)
(:: pragma bea:global-element-return element="ns0:contractPamPackageWriteRequest" location="../Schemas/DA_ITEL_OPERACION_OCS_ECMS_CONTRACTPAMPACKAGEWRITE.xsd" ::)

declare namespace ns0 = "http://ericsson.com/services/ws_cma3/contractpampackagewrite";
declare namespace ns2 = "http://www.comcel.com.co/ActualizarPKGContratoOCS/";
declare namespace ns1 = "http://ericsson.com/services/ws_cma3/sessionchange";
declare namespace xf = "http://tempuri.org/ITEL/OCS/AIR/Resources/XQueries/actualizarPKGContratoECMS_Req/";
declare namespace ns3 = "http://ericsson.com/services/ws_cma3/contractpampackageread";

declare function xf:actualizarPKGContratoECMS_Req($input_Parameters1 as element(ns2:Input_Parameters))
    as element(ns0:contractPamPackageWriteRequest) {
        <ns0:contractPamPackageWriteRequest>
            <ns0:inputAttributes>
                <ns0:contractPAMPackageWriteInput>
                    <ns0:contract>
                        <ns0:privateKey>{ data($input_Parameters1/PRIVATEKEY) }</ns0:privateKey>
                    </ns0:contract>
                    <ns0:pamPackageAction>A</ns0:pamPackageAction>
                    <ns0:pamPackages>
                        {
                            for $pamPackage in $input_Parameters1/CONTRACTPKG/CONSULTAR_PKG_CONTRACT/ns3:contractPAMPackageOutput/ns3:pamPackages/ns3:pamPackage
                            return
                                <ns0:pamPackage>
				                     <ns0:pamClass>
				                        <ns0:privateKey>{ data($pamPackage/ns3:pamClass/ns3:privateKey) }</ns0:privateKey>
				                     </ns0:pamClass>
				                     <ns0:pamSchedule>
				                        <ns0:privateKey>{ data($pamPackage/ns3:pamSchedule/ns3:privateKey) }</ns0:privateKey>
				                     </ns0:pamSchedule>			
				                     <ns0:pamServiceId>{ data($pamPackage/ns3:pamServiceId) }</ns0:pamServiceId>
                     				 <ns0:pamServicePriority>{ data($pamPackage/ns3:pamServicePriority) }</ns0:pamServicePriority>
                                </ns0:pamPackage>
                        }
                    </ns0:pamPackages>
                </ns0:contractPAMPackageWriteInput>
            </ns0:inputAttributes>
            <ns0:sessionChangeRequest>
                <ns1:values>
                    <ns1:item>
                        <ns1:key>BU_ID</ns1:key>
                        <ns1:value>2</ns1:value>
                    </ns1:item>
                </ns1:values>
            </ns0:sessionChangeRequest>
        </ns0:contractPamPackageWriteRequest>
};

declare variable $input_Parameters1 as element(ns2:Input_Parameters) external;

xf:actualizarPKGContratoECMS_Req($input_Parameters1)

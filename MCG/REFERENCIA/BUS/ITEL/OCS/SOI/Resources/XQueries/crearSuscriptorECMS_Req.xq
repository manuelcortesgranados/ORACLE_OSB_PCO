xquery version "1.0" encoding "Cp1252";
(:: pragma bea:global-element-parameter parameter="$input_Parameters1" element="ns2:Input_Parameters" location="../Schemas/PS_ITEL_CREAR_SUSCRIPTOR_ECMS.xsd" ::)
(:: pragma bea:global-element-return element="ns0:ccapiSubscriberCreateRequest" location="../Schemas/DA_ITEL_OPERACION_OCS_ECMS_SUBSCRIBERCREATE.xsd" ::)

declare namespace xf = "http://tempuri.org/ITEL/OCS/AIR/Resources/XQueries/crearSuscriptorECMS_Req/";
declare namespace ns8 = "http://ericsson.com/services/ws_cma3/customernew";
declare namespace ns7 = "http://www.comcel.com.co/OCS/OperacionCorbaOCS";
declare namespace ns6 = "http://ericsson.com/services/ws_cma3/sessionchange";
declare namespace ns5 = "http://ericsson.com/services/ws_cma3/contractnew";
declare namespace ns4 = "http://ericsson.com/services/ws_cma3/customerread";
declare namespace ns3 = "http://ericsson.com/services/ws_cma3/customerwrite";
declare namespace ns2 = "http://www.comcel.com.co/CrearSuscriptorECMS/";
declare namespace ns1 = "http://ericsson.com/services/ws_cma3/addresswrite";
declare namespace ns0 = "http://ericsson.com/services/ws_cma3/ccapisubscribercreate";

declare function xf:crearSuscriptorECMS_Req($input_Parameters1 as element(ns2:Input_Parameters))
    as element(ns0:ccapiSubscriberCreateRequest) {
     <ns0:ccapiSubscriberCreateRequest>
         <ns0:inputAttributes>
	    	<ns0:customerNew>
                <ns8:partyType>{ data($input_Parameters1/SUSCRIPTOR/ns7:PartyType) }</ns8:partyType>            
        	</ns0:customerNew>
            <ns0:addressWrite>
               <ns1:adrSeq>{ data($input_Parameters1/SUSCRIPTOR/ns7:AddressSeq) }</ns1:adrSeq>               
               <ns1:adrRoles>{ data($input_Parameters1/SUSCRIPTOR/ns7:AddressRoles) }</ns1:adrRoles>
            </ns0:addressWrite>
            <ns0:customerWrite>
               <ns3:paymentResp>F</ns3:paymentResp>  
               <ns3:csStatus>{ data($input_Parameters1/SUSCRIPTOR/ns7:CustomerStatus) }</ns3:csStatus>
               <ns3:rsCode>{ data($input_Parameters1/SUSCRIPTOR/ns7:ReasonCode) }</ns3:rsCode>       
 			   <ns3:partyRoleAssignments>
                  <ns3:item>
                     <ns3:partyRoleShname>CSSubscriber</ns3:partyRoleShname>
                  </ns3:item>
                </ns3:partyRoleAssignments>                   
            </ns0:customerWrite>
            <ns0:customerRead>
               <ns4:syncWithDb>yes</ns4:syncWithDb>
            </ns0:customerRead>
            <ns0:contractNew>
               <ns5:createContractInput>
               		<ns5:contractTypeId>{ data($input_Parameters1/SUSCRIPTOR/ns7:ContractType) }</ns5:contractTypeId>
					<ns5:contractTemplate>
                     	<ns5:publicKey>{ data($input_Parameters1/SUSCRIPTOR/ns7:PublicContractID) }</ns5:publicKey>
               		</ns5:contractTemplate>
					<ns5:technology>
                    	<ns5:publicKey>{ data($input_Parameters1/SUSCRIPTOR/ns7:PublicMarketCode) }</ns5:publicKey>
                    </ns5:technology>
                  	<ns5:technologyFlavour>
                    	<ns5:publicKey>{ data($input_Parameters1/SUSCRIPTOR/ns7:PublicSubMarketCode) }</ns5:publicKey>
                  	</ns5:technologyFlavour>
				  	<ns5:network>
                    	<ns5:publicKey>{ data($input_Parameters1/SUSCRIPTOR/ns7:PublicNetworkId) }</ns5:publicKey>
                  	</ns5:network>
                  	<ns5:language> 
                    	<ns5:publicKey>{ data($input_Parameters1/SUSCRIPTOR/ns7:PublicIVRLanguage) }</ns5:publicKey>
                  	</ns5:language>               		
					<ns5:afProvisioned>true</ns5:afProvisioned>
					<ns5:portNum>{ concat('99957',data($input_Parameters1/SUSCRIPTOR/ns7:DirectoryNumber)) }</ns5:portNum>
					<ns5:storMedNum>{ concat('99999957',data($input_Parameters1/SUSCRIPTOR/ns7:DirectoryNumber)) }</ns5:storMedNum>
					<ns5:dirNum>{ data($input_Parameters1/SUSCRIPTOR/ns7:DirectoryNumber) }</ns5:dirNum>
					<ns5:sdpId>{ data($input_Parameters1/SUSCRIPTOR/ns7:SdpID) }</ns5:sdpId>
					<ns5:accountGroupPublicKey>{ data($input_Parameters1/SUSCRIPTOR/ns7:AccountGroupID) }</ns5:accountGroupPublicKey>
               </ns5:createContractInput>
            </ns0:contractNew>
         </ns0:inputAttributes>
         <ns0:sessionChangeRequest>
            <ns6:values>
               <ns6:item>
                  <ns6:key>BU_ID</ns6:key>
                  <ns6:value>2</ns6:value>
               </ns6:item>
            </ns6:values>
         </ns0:sessionChangeRequest>
      </ns0:ccapiSubscriberCreateRequest>
};


declare variable $input_Parameters1 as element(ns2:Input_Parameters) external;

xf:crearSuscriptorECMS_Req($input_Parameters1)
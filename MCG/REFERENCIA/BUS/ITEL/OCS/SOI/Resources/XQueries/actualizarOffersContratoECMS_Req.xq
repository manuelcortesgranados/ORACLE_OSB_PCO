xquery version "1.0" encoding "Cp1252";
(:: pragma bea:global-element-parameter parameter="$input_Parameters1" element="ns2:Input_Parameters" location="../Schemas/PS_ITEL_ACTUALIZAR_OFFERS_CONTRACT.xsd" ::)
(:: pragma bea:global-element-return element="ns0:contractOffersWriteRequest" location="../Schemas/DA_ITEL_OPERACION_OCS_ECMS_CONTRACTOFFERSWRITE.xsd" ::)

declare namespace xf = "http://tempuri.org/ITEL/OCS/AIR/Resources/XQueries/actualizarOffersContratoECMS_Req/";
declare namespace ns2 = "http://www.comcel.com.co/ActualizarOffersContratoOCS/";
declare namespace ns1 = "http://ericsson.com/services/ws_cma3/sessionchange";
declare namespace ns0 = "http://ericsson.com/services/ws_cma3/contractofferswrite";

declare function xf:actualizarOffersContratoECMS_Req($input_Parameters1 as element(ns2:Input_Parameters))
    as element(ns0:contractOffersWriteRequest) {
      <ns0:contractOffersWriteRequest>
         <ns0:inputAttributes>
            <ns0:contractOffersWriteInput>
               <ns0:contract>
                  <ns0:privateKey>{ data($input_Parameters1/PRIVATEKEY) }</ns0:privateKey>
               </ns0:contract>
               <ns0:offerExternalKey>{ data($input_Parameters1/OFFER) }</ns0:offerExternalKey>
               <ns0:offerAction>C</ns0:offerAction>
            </ns0:contractOffersWriteInput>
         </ns0:inputAttributes>
         <ns0:sessionChangeRequest>
            <ns1:values>
               <ns1:item>
                  <ns1:key>BU_ID</ns1:key>
                  <ns1:value>2</ns1:value>
               </ns1:item>
            </ns1:values>
         </ns0:sessionChangeRequest>
      </ns0:contractOffersWriteRequest>      
};


declare variable $input_Parameters1 as element(ns2:Input_Parameters) external;

xf:actualizarOffersContratoECMS_Req($input_Parameters1)
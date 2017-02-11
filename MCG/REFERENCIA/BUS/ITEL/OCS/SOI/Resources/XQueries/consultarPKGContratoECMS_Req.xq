xquery version "1.0" encoding "Cp1252";
(:: pragma bea:global-element-parameter parameter="$input_Parameters1" element="ns2:Input_Parameters" location="../Schemas/PS_ITEL_CONSULTAR_PKG_CONTRACT.xsd" ::)
(:: pragma bea:global-element-return element="ns0:contractPamPackageReadRequest" location="../Schemas/DA_ITEL_OPERACION_OCS_ECMS_CONTRACTPAMPACKAGEREAD.xsd" ::)

declare namespace xf = "http://tempuri.org/ITEL/OCS/AIR/Resources/XQueries/consultarPKGContratoECMS_Req/";
declare namespace ns2 = "http://www.comcel.com.co/ConsultarPKGContratoOCS/";
declare namespace ns1 = "http://ericsson.com/services/ws_cma3/sessionchange";
declare namespace ns0 = "http://ericsson.com/services/ws_cma3/contractpampackageread";

declare function xf:consultarPKGContratoECMS_Req($input_Parameters1 as element(ns2:Input_Parameters))
    as element(ns0:contractPamPackageReadRequest) {
      <ns0:contractPamPackageReadRequest>
         <ns0:inputAttributes>
            <ns0:coIdPub>{ data($input_Parameters1/CONTRACTTEMPLATE) }</ns0:coIdPub>
         </ns0:inputAttributes>
         <ns0:sessionChangeRequest>
            <ns1:values>
               <ns1:item>
                  <ns1:key>BU_ID</ns1:key>
                  <ns1:value>2</ns1:value>
               </ns1:item>
            </ns1:values>
         </ns0:sessionChangeRequest>
      </ns0:contractPamPackageReadRequest>      
};


declare variable $input_Parameters1 as element(ns2:Input_Parameters) external;

xf:consultarPKGContratoECMS_Req($input_Parameters1)
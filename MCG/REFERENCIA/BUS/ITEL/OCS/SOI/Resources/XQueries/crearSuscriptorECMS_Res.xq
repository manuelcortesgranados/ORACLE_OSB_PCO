xquery version "1.0" encoding "Cp1252";
(:: pragma bea:schema-type-parameter parameter="$contractNew1" type="ns1:contractNewResponse" location="../Schemas/DA_ITEL_OPERACION_OCS_ECMS_CONTRACT.xsd" ::)
(:: pragma bea:global-element-return element="ns2:WS_Result" location="../Schemas/PS_ITEL_CREAR_SUSCRIPTOR_ECMS.xsd" ::)

declare namespace xf = "http://tempuri.org/ITEL/OCS/AIR/Resources/XQueries/crearSuscriptorECMS_Res/";
declare namespace ns3 = "http://ericsson.com/services/ws_cma3/ccapisubscribercreate";
declare namespace ns2 = "http://www.comcel.com.co/CrearSuscriptorECMS/";
declare namespace ns1 = "http://ericsson.com/services/ws_cma3/contractnew";

declare function xf:crearSuscriptorECMS_Res($contractNew1 as element(), $codigo as xs:string, $descripcion as xs:string)
    as element(ns2:WS_Result) {
        <ns2:WS_Result>
           <CODIGO>{ $codigo }</CODIGO>
           <MENSAJE>
                <CREAR_SUSCRIPTOR_ECMS>
                	<ns1:contractNew>
                		<ns1:createContractOutput>{ $contractNew1//ns3:ccapiSubscriberCreateResponse/ns3:contractNew/ns1:createContractOutput/@* , $contractNew1//ns3:ccapiSubscriberCreateResponse/ns3:contractNew/ns1:createContractOutput/node() }</ns1:createContractOutput>
                	</ns1:contractNew>
                </CREAR_SUSCRIPTOR_ECMS>
            </MENSAJE>
           <DESCRIPCION>{ $descripcion }</DESCRIPCION>
        </ns2:WS_Result>
};

declare variable $contractNew1 as element() external;
declare variable $codigo as xs:string external;
declare variable $descripcion as xs:string external;

xf:crearSuscriptorECMS_Res($contractNew1, $codigo, $descripcion)
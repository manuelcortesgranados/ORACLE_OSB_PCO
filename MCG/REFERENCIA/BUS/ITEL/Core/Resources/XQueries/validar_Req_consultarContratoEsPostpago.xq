(:: pragma bea:global-element-return element="ns0:Input_Parameters" location="../Schemas/PS_ITEL_CONSULTARCONTRATOESPOSTPAGO.xsd" ::)

declare namespace ns0 = "http://www.comcel.com.co/ConsultarContractEsPostPago";
declare namespace xf = "http://tempuri.org/ITEL/Core/Resources/XQueries/validar_Req_consultarContratoEsPostpago/";

declare function xf:validar_Req_consultarContrato($contract as xs:string)
    as element(ns0:Input_Parameters) {
        <ns0:Input_Parameters>
            <ns0:CONTRACT>{ $contract }</ns0:CONTRACT>
        </ns0:Input_Parameters>
};

declare variable $contract as xs:string external;

xf:validar_Req_consultarContrato($contract)
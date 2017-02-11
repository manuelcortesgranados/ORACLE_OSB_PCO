(:: pragma bea:global-element-return element="ns0:Input_Parameters" location="../Schemas/PS_ITEL_CONSULTARCONTRACTTEMP_CONTRACT.xsd" ::)

declare namespace ns0 = "http://www.comcel.com.co/ConsultarContractTemp_Contract/";
declare namespace xf = "http://tempuri.org/ITEL/Core/Resources/XQueries/consultarContractTempContractPS_Req/";

declare function xf:consultarContractTempContractPS_Req($serviceClass as xs:decimal,
    $fafidgroup as xs:decimal,
    $contract as xs:string)
    as element(ns0:Input_Parameters) {
        <ns0:Input_Parameters>{
        	if($serviceClass > 0) then(
            	<P_SERVCLASS>{ $serviceClass }</P_SERVCLASS>
            )
            else()
            }
            {
            if($fafidgroup > 0) then(
            	<P_FAFIDGROUP>{ $fafidgroup }</P_FAFIDGROUP>
            )
            else()
            }
            {
            if($contract != "") then(
            	<P_CONTRACT>{ $contract }</P_CONTRACT>
            )
            else()
            }
        </ns0:Input_Parameters>
};

declare variable $serviceClass as xs:decimal external;
declare variable $fafidgroup as xs:decimal external;
declare variable $contract as xs:string external;

xf:consultarContractTempContractPS_Req($serviceClass,
    $fafidgroup,
    $contract)
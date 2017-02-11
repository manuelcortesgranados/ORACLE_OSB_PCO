(:: pragma bea:local-element-parameter parameter="$cONSULTAR_PKG_CONTRACT1" type="ns1:WS_Result/MENSAJE/CONSULTAR_PKG_CONTRACT" location="../Schemas/PS_ITEL_CONSULTAR_PKG_CONTRACT.xsd" ::)
(:: pragma bea:global-element-return element="ns2:Input_Parameters" location="../Schemas/PS_ITEL_ACTUALIZAR_PKG_CONTRACT.xsd" ::)

declare namespace ns0 = "http://ericsson.com/services/ws_cma3/contractpampackageread";
declare namespace ns2 = "http://www.comcel.com.co/ActualizarPKGContratoOCS/";
declare namespace ns1 = "http://www.comcel.com.co/ConsultarPKGContratoOCS/";
declare namespace xf = "http://tempuri.org/ITEL/OCS/SOI/Resources/XQueries/crearSuscriptorOCS_Req_actualizarPKGContratoECMS/";

declare function xf:crearSuscriptorOCS_Req_actualizarPKGContratoECMS($privatekey as xs:string,
    $cONSULTAR_PKG_CONTRACT1 as element())
    as element(ns2:Input_Parameters) {
        <ns2:Input_Parameters>
            <PRIVATEKEY>{ $privatekey }</PRIVATEKEY>
            <CONTRACTPKG>
                <CONSULTAR_PKG_CONTRACT>
                    {
                        for $contractPAMPackageOutput in $cONSULTAR_PKG_CONTRACT1/ns0:contractPAMPackageOutput
                        return
                            <ns0:contractPAMPackageOutput>{ $contractPAMPackageOutput/@* , $contractPAMPackageOutput/node() }</ns0:contractPAMPackageOutput>
                    }
                </CONSULTAR_PKG_CONTRACT>
            </CONTRACTPKG>
        </ns2:Input_Parameters>
};

declare variable $privatekey as xs:string external;
declare variable $cONSULTAR_PKG_CONTRACT1 as element() external;

xf:crearSuscriptorOCS_Req_actualizarPKGContratoECMS($privatekey,
    $cONSULTAR_PKG_CONTRACT1)

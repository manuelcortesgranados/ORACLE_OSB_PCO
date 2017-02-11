(:: pragma bea:global-element-parameter parameter="$actualizar_saldoResponse1" element="ns0:Actualizar_saldoResponse" location="../Schemas/MayoristaService.xsd" ::)

declare namespace ns0 = "http://comcel/";
declare namespace xf = "http://tempuri.org/ITEL/RLM/Resources/XQueries/obtenerCodigoErrorRLM/";

declare function xf:obtenerCodigoErrorRLM($actualizar_saldoResponse1 as element(ns0:Actualizar_saldoResponse))
    as xs:string {
        if(data($actualizar_saldoResponse1/return/actualizar_saldo/cod_respuesta) = '1')  then 
          data($actualizar_saldoResponse1/return/actualizar_saldo/cod_respuesta)
        else if(data($actualizar_saldoResponse1/return/actualizar_saldo/cod_respuesta) = '3') then
        	"900"
        	else 
        		"61"
};

declare variable $actualizar_saldoResponse1 as element(ns0:Actualizar_saldoResponse) external;

xf:obtenerCodigoErrorRLM($actualizar_saldoResponse1)

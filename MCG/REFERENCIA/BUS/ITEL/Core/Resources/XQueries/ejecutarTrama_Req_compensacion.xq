(:: pragma bea:global-element-parameter parameter="$reglasNegocioResponse" element="ns2:WS_Result" location="../Schemas/PS_ITEL_EJECUTARREGLASNEGOCIO.xsd" ::)
(:: pragma bea:global-element-parameter parameter="$ejecutadorResponse" element="ns0:WS_Result" location="../Schemas/PS_ITEL_EJECUTADOR.xsd" ::)
(:: pragma bea:global-element-return element="ns3:Input_Parameters" location="../../../Compensacion/Resources/Schemas/PS_ITEL_COMPENSACION.xsd" ::)

declare namespace ns2 = "http://www.comcel.com.co/EjecutarReglasNegocio/";
declare namespace ns1 = "http://www.comcel.com.co/IN/OperacionCorba";
declare namespace ns3 = "http://www.comcel.com.co/CompensacionITEL/";
declare namespace ns0 = "http://www.comcel.com.co/Ejecutador/";
declare namespace xf = "http://tempuri.org/ITEL/Core/Resources/XQueries/ejecutarTrama_Req_compensacion/";

declare function xf:ejecutarTrama_Req_compensacion($metodo as xs:string,
    $reglasNegocioResponse as element(ns2:WS_Result),
    $ejecutadorResponse as element(ns0:WS_Result))
    as element(ns3:Input_Parameters) {
        <ns3:Input_Parameters>
            <METODO>{ $metodo }</METODO>
            <SUSCRIPTOR_DESTINO>{ $reglasNegocioResponse/MENSAJE/SUSCRIPTOR_DESTINO/@* , $reglasNegocioResponse/MENSAJE/SUSCRIPTOR_DESTINO/node() }</SUSCRIPTOR_DESTINO>
            <SUSCRIPTOR_ORIGEN>{ $reglasNegocioResponse/MENSAJE/SUSCRIPTOR_ORIGEN/@* , $reglasNegocioResponse/MENSAJE/SUSCRIPTOR_ORIGEN/node() }</SUSCRIPTOR_ORIGEN>
            <SERVICIOS_EJECUTADOS>
                {
                    for $SERVICIO in $ejecutadorResponse/MENSAJE/SERVICIOS_EJECUTADOS/SERVICIO
                    return
                        <SERVICIO>
                            <NOMBRE>{ data($SERVICIO/NOMBRE) }</NOMBRE>
                            <PARAMETROS>
                                {
                                    for $PARAMETRO in $SERVICIO/PARAMETROS/PARAMETRO
                                    return
                                        <PARAMETRO>{ $PARAMETRO/@* , $PARAMETRO/node() }</PARAMETRO>
                                }
                            </PARAMETROS>
                        </SERVICIO>
                }
            </SERVICIOS_EJECUTADOS>
            {
                for $BALANCES in $ejecutadorResponse/MENSAJE/BALANCES
                return
                    <BALANCES>{ $BALANCES/@* , $BALANCES/node() }</BALANCES>
            }
            {
                for $BALANCES_ANTERIOR in $ejecutadorResponse/MENSAJE/BALANCES_ANTERIOR
                return
                    <BALANCES_ANTERIOR>{ $BALANCES_ANTERIOR/@* , $BALANCES_ANTERIOR/node() }</BALANCES_ANTERIOR>
            }
            <SUSCRIPTOR_OCS>
                <MIN>{ data($reglasNegocioResponse/MENSAJE/SUSCRIPTOR_OCS/DATOS_SUSCRIPTOR/*:DirectoryNumber) }</MIN>
                <SERVICE_CLASS>{ data($reglasNegocioResponse/MENSAJE/SUSCRIPTOR_OCS/DATOS_SUSCRIPTOR/*:PublicRatePlanCode) }</SERVICE_CLASS>
                <ACC_GRP_ID>{ data($reglasNegocioResponse/MENSAJE/SUSCRIPTOR_OCS/DATOS_SUSCRIPTOR/*:AccountGroupID) }</ACC_GRP_ID>
            </SUSCRIPTOR_OCS>
        </ns3:Input_Parameters>
};

declare variable $metodo as xs:string external;
declare variable $reglasNegocioResponse as element(ns2:WS_Result) external;
declare variable $ejecutadorResponse as element(ns0:WS_Result) external;

xf:ejecutarTrama_Req_compensacion($metodo,
    $reglasNegocioResponse,
    $ejecutadorResponse)
(:: pragma bea:global-element-return element="ns3:Input_Parameters" location="../../../Compensacion/Resources/Schemas/PS_ITEL_COMPENSACION.xsd" ::)

declare namespace ns3 = "http://www.comcel.com.co/CompensacionITEL/";
declare namespace xf = "http://tempuri.org/ITEL/Core/Resources/XQueries/servicioProvision_Req_compensacion/";

declare function xf:servicioProvision_Req_compensacion($metodo as xs:string,
    $min as xs:string, $sc as xs:string, $accgrpid as xs:string,
    $serviciosEjecutados as element())
    as element(ns3:Input_Parameters) {
        <ns3:Input_Parameters>
            <METODO>{ $metodo }</METODO>
			<SUSCRIPTOR_DESTINO/>
			<SUSCRIPTOR_ORIGEN/>
            <SERVICIOS_EJECUTADOS>
                {
                    for $SERVICIO in $serviciosEjecutados/SERVICIO
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
			<BALANCES/>
			<BALANCES_ANTERIOR/>       
            <SUSCRIPTOR_OCS>
                <MIN>{ $min }</MIN>
                <SERVICE_CLASS>{ $sc }</SERVICE_CLASS>
                <ACC_GRP_ID>{ $accgrpid }</ACC_GRP_ID>
            </SUSCRIPTOR_OCS>
        </ns3:Input_Parameters>
};

declare variable $metodo as xs:string external;
declare variable $min as xs:string external;
declare variable $sc as xs:string external;
declare variable $accgrpid as xs:string external;
declare variable $serviciosEjecutados as element() external;

xf:servicioProvision_Req_compensacion($metodo,
    $min, $sc, $accgrpid,
    $serviciosEjecutados)
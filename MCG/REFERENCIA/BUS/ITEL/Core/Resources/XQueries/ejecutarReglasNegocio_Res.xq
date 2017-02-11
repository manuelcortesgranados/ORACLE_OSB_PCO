(:: pragma bea:global-element-parameter parameter="$parametros" element="ns2:WS_Result" location="../Schemas/PS_ITEL_CONSULTARREGLAS.xsd" ::)
(:: pragma bea:global-element-parameter parameter="$datosMines" element="ns0:WS_Result" location="../Schemas/PS_ITEL_CONSULTARDATOSMINES.xsd" ::)
(:: pragma bea:global-element-parameter parameter="$balancesOCS" element="ns4:WS_Result" location="../../../OCS/AIR/Resources/Schemas/PS_ITEL_CONSULTAR_BALANCES.xsd" ::)
(:: pragma bea:global-element-parameter parameter="$fafListOCS" element="ns7:WS_Result" location="../../../OCS/AIR/Resources/Schemas/PS_ITEL_CONSULTAR_FAFLIST.xsd" ::)
(:: pragma bea:global-element-parameter parameter="$suscripcionOCS" element="ns8:WS_Result" location="../../../OCS/OLM/Resources/Schemas/PS_ITEL_CONSULTAR_SUSCRIPCION.xsd" ::)
(:: pragma bea:global-element-parameter parameter="$datosOCS" element="ns5:WS_Result" location="../../../OCS/SOI/Resources/Schemas/PS_ITEL_CONSULTAR_SUSCRIPTOR.xsd" ::)
(:: pragma bea:global-element-parameter parameter="$datosContProvTar" element="ns6:WS_Result" location="../Schemas/PS_ITEL_CONSULTARCONTPROVTAR.xsd" ::)
(:: pragma bea:global-element-return element="ns3:WS_Result" location="../Schemas/PS_ITEL_EJECUTARREGLASNEGOCIO.xsd" ::)

declare namespace ns2 = "http://www.comcel.com.co/ConsultarReglas/";
declare namespace ns1 = "http://www.comcel.com.co/IN/OperacionCorba";
declare namespace ns4 = "http://www.comcel.com.co/ConsultarBalancesOCS/";
declare namespace ns7 = "http://www.comcel.com.co/ConsultarFaFListOCS/";
declare namespace ns8 = "http://www.comcel.com.co/ConsultarSuscripcionOCS/";
declare namespace ns3 = "http://www.comcel.com.co/EjecutarReglasNegocio/";
declare namespace ns0 = "http://www.comcel.com.co/ConsultarDatosMines/";
declare namespace ns5 = "http://www.comcel.com.co/ConsultarSuscriptorOCS/";
declare namespace ns6 = "http://www.comcel.com.co/ConsultarContProvTar/";
declare namespace xf = "http://tempuri.org/ITEL/Core/Resources/XQueries/ejecutarReglasNegocio_Res/";

declare function xf:ejecutarReglasNegocio_Res($codigo as xs:string,
    $parametros as element(ns2:WS_Result),
    $datosMines as element(ns0:WS_Result),
    $balancesOCS as element(ns4:WS_Result),
    $fafListOCS as element(ns7:WS_Result),
    $suscripcionOCS as element(ns8:WS_Result),
    $datosOCS as element(ns5:WS_Result),
    $datosContProvTar as element(ns6:WS_Result),
    $duracionReglas as xs:string,
    $duracionSuscriptor as xs:string,
    $descripcion as xs:string)
    as element(ns3:WS_Result) {
        <ns3:WS_Result>
            <CODIGO>{ $codigo }</CODIGO>
            <MENSAJE clusterDestino = "{ data($datosMines/MENSAJE/@clusterDestino) }"
                     clusterOrigen = "{ data($datosMines/MENSAJE/@clusterOrigen) }">
                <PARAMETROS_REGLAS>
                    {
                        for $PARAMETRO in $parametros/MENSAJE/PARAMETROS/PARAMETRO
                        return
                            <PARAMETRO>
                                <NOMBRE>{ data($PARAMETRO/NOMBRE) }</NOMBRE>
                                <TIPO>{ data($PARAMETRO/TIPO) }</TIPO>
                                <VALOR>{ $PARAMETRO/VALOR/node() }</VALOR>
                            </PARAMETRO>
                    }
                </PARAMETROS_REGLAS>
                <SUSCRIPTOR_DESTINO>{ $datosMines/MENSAJE/DatosDestino/@* , $datosMines/MENSAJE/DatosDestino/node() }</SUSCRIPTOR_DESTINO>
                <SUSCRIPTOR_ORIGEN>{ $datosMines/MENSAJE/DatosOrigen/@* , $datosMines/MENSAJE/DatosOrigen/node() }</SUSCRIPTOR_ORIGEN>
                <DURREGLASNEGOCIO>{ $duracionReglas }</DURREGLASNEGOCIO>
                <DURSUSCRIPTOR>{ $duracionSuscriptor }</DURSUSCRIPTOR>
                <SUSCRIPTOR_OCS>
                    <BALANCES>{ $balancesOCS/MENSAJE/CONSULTAR_BALANCES/MethodResponse/node() }</BALANCES>
                    <DATOS_SUSCRIPTOR>{ $datosOCS/MENSAJE/CONSULTAR_SUSCRIPTOR/*:suscriptor /node() }</DATOS_SUSCRIPTOR>
                    <DATOS_CONTRATO>
                        <CONTRATO>{ data($datosContProvTar/MENSAJE/CONTRACT) }</CONTRATO>
                        <PROVIDER>{ data($datosContProvTar/MENSAJE/PROVIDER) }</PROVIDER>
                        <TARIFF>{ data($datosContProvTar/MENSAJE/TARIFF) }</TARIFF>
                    </DATOS_CONTRATO>
                    <FAF_LIST>{ $fafListOCS/MENSAJE/CONSULTAR_FAFLIST/node() }</FAF_LIST>
                    <DATOS_SUSCRIPCION>{ $suscripcionOCS/MENSAJE/CONSULTAR_SUSCRIPCION/node() }</DATOS_SUSCRIPCION>
                </SUSCRIPTOR_OCS>
            </MENSAJE>
            <DESCRIPCION>{ $descripcion }</DESCRIPCION>
        </ns3:WS_Result>
};

declare variable $codigo as xs:string external;
declare variable $parametros as element(ns2:WS_Result) external;
declare variable $datosMines as element(ns0:WS_Result) external;
declare variable $balancesOCS as element(ns4:WS_Result) external;
declare variable $fafListOCS as element(ns7:WS_Result) external;
declare variable $suscripcionOCS as element(ns8:WS_Result) external;
declare variable $datosOCS as element(ns5:WS_Result) external;
declare variable $datosContProvTar as element(ns6:WS_Result) external;
declare variable $duracionReglas as xs:string external;
declare variable $duracionSuscriptor as xs:string external;
declare variable $descripcion as xs:string external;

xf:ejecutarReglasNegocio_Res($codigo,
    $parametros,
    $datosMines,
    $balancesOCS,
    $fafListOCS,
    $suscripcionOCS,
    $datosOCS,
    $datosContProvTar,
    $duracionReglas,
    $duracionSuscriptor,
    $descripcion)
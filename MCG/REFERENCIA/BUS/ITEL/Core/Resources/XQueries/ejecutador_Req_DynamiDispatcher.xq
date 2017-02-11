(:: pragma bea:global-element-parameter parameter="$wS_Result1" element="ns0:WS_Result" location="../Schemas/PS_ITEL_CONSULTARREGLASPROVISION.xsd" ::)
(:: pragma bea:global-element-return element="ns1:Input_Parameters" location="../Schemas/PS_ITEL_DYNAMICDISPATCHER.xsd" ::)

declare namespace ns1 = "http://www.comcel.com.co/DynamicDispatcher/";
declare namespace ns0 = "http://www.comcel.com.co/ConsultarReglasProvision/";
declare namespace xf = "http://tempuri.org/ITEL/Core/Resources/XQueries/ejecutador_Req_DynamiDispatcher/";

declare function xf:ejecutador_Req_DynamiDispatcher($wS_Result1 as element(ns0:WS_Result),
    $indice as xs:int)
    as element(ns1:Input_Parameters) {
        <ns1:Input_Parameters>
            {
                let $SERVICIO := $wS_Result1/MENSAJE/SERVICIO[$indice]
                return
                    <servicio>
                        <nombre_servicio>{ data($SERVICIO/NOMBRE) }</nombre_servicio>
                        <parametros>
                            {
                                for $PARAMETRO in $SERVICIO/PARAMETROS/PARAMETRO
                                return
                                    <parametro>
                                        <nombre>{ data($PARAMETRO/NOMBRE) }</nombre>
                                        <tipo>{ data($PARAMETRO/TIPO) }</tipo>
                                        <valor>{ $PARAMETRO/VALOR/node() }</valor>
                                    </parametro>
                            }
                        </parametros>
                    </servicio>
            }
        </ns1:Input_Parameters>
};

declare variable $wS_Result1 as element(ns0:WS_Result) external;
declare variable $indice as xs:int external;

xf:ejecutador_Req_DynamiDispatcher($wS_Result1,
    $indice)
xquery version "1.0" encoding "Cp1252";
(:: pragma  parameter="$wS_Result1" type="xs:anyType" ::)
(:: pragma bea:global-element-return element="ns0:Input_Parameters" location="../Schemas/PS_ITEL_DYNAMICDISPATCHER.xsd" ::)

declare namespace xf = "http://tempuri.org/ITEL/Core/Resources/XQueries/servicioProv_Req_DynamiDispatcher/";
declare namespace ns0 = "http://www.comcel.com.co/DynamicDispatcher/";

declare function xf:servicioProv_Req_DynamiDispatcher($indice as xs:int,
    $wS_Result1 as element(*))
    as element(ns0:Input_Parameters) {
        <ns0:Input_Parameters>
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
        </ns0:Input_Parameters>
};

declare variable $indice as xs:int external;
declare variable $wS_Result1 as element(*) external;

xf:servicioProv_Req_DynamiDispatcher($indice,
    $wS_Result1)
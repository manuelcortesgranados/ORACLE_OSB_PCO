(:: pragma bea:global-element-parameter parameter="$outputParameters1" element="ns1:OutputParameters" location="../Schemas/BD_ITEL_CONSULTAR_PAQUETES_TAT.xsd" ::)
(:: pragma bea:global-element-return element="ns0:WS_Result" location="../Schemas/PS_ITEL_CONSULTARPAQUETES_TAT.xsd" ::)

declare namespace ns1 = "http://xmlns.oracle.com/pcbpel/adapter/db/sp/bd_consultarPaquetesTAT";
declare namespace ns0 = "http://www.comcel.com.co/ConsultarPaquetesTAT/";
declare namespace xf = "http://tempuri.org/ITEL/Core/Resources/XQueries/consultarPaquetesTAT_Res/";

declare function xf:consultarPaquetesTAT_Res($outputParameters1 as element(ns1:OutputParameters),
    $descripcion as xs:string)
    as element(ns0:WS_Result) {
        <ns0:WS_Result>
            <CODIGO>OK</CODIGO>
            <MENSAJE>
                <VALOR>{ data($outputParameters1/ns1:P_VALOR) }</VALOR>
                <HOSTID>{ data($outputParameters1/ns1:P_HOSTID) }</HOSTID>
                <COMENTARIO>{ data($outputParameters1/ns1:P_COMENTARIO) }</COMENTARIO>
                <TIPO>{ data($outputParameters1/ns1:P_TIPO) }</TIPO>    
                <NOTIFICACION>{ data($outputParameters1/ns1:P_NOTIFICACION) }</NOTIFICACION>            
                <PAQUETES>
                    {
                        for $PAQUETE in $outputParameters1/ns1:P_PAQUETES/ns1:PAQUETE
                        return
                            <PAQUETE>
                                <CODIGO_PAQUETE>{ data($PAQUETE/ns1:CODIGO_PAQUETE) }</CODIGO_PAQUETE>
                                <PLATAFORMA>{ data($PAQUETE/ns1:PLATAFORMA) }</PLATAFORMA>
                            </PAQUETE>
                    }
                </PAQUETES>
            </MENSAJE>
            <DESCRIPCION>{ $descripcion }</DESCRIPCION>
        </ns0:WS_Result>
};

declare variable $outputParameters1 as element(ns1:OutputParameters) external;
declare variable $descripcion as xs:string external;

xf:consultarPaquetesTAT_Res($outputParameters1,
    $descripcion)
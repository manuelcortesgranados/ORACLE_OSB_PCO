(:: pragma bea:global-element-parameter parameter="$outputParameters1" element="ns1:OutputParameters" location="../Schemas/BD_ITEL_CONSULTAR_LISTAPAQUETES_TAT.xsd" ::)
(:: pragma bea:global-element-return element="ns0:WS_Result" location="../Schemas/PS_ITEL_CONSULTARLISTAPAQUETES_TAT.xsd" ::)

declare namespace ns1 = "http://xmlns.oracle.com/pcbpel/adapter/db/sp/bd_consultarListaPaquetesTAT";
declare namespace ns0 = "http://www.comcel.com.co/ConsultarListaPaquetesTAT/";
declare namespace xf = "http://tempuri.org/ITEL/Core/Resources/XQueries/consultarListaPaquetesTAT_Res/";

declare function xf:consultarListaPaquetesTAT_Res($outputParameters1 as element(ns1:OutputParameters),
    $descripcion as xs:string)
    as element(ns0:WS_Result) {
        <ns0:WS_Result>
            <CODIGO>OK</CODIGO>
            <MENSAJE>
                <PAQUETES>
                    {
                        for $PAQUETE in $outputParameters1/ns1:P_PAQUETES/ns1:PAQUETE
                        return
                            <PAQUETE>
                                <CODIGO_PAQUETE>{ data($PAQUETE/ns1:CODIGO_PAQUETE) }</CODIGO_PAQUETE>
                                <VALOR>{ data($PAQUETE/ns1:VALOR) }</VALOR>
                                <DESC_CORTA>{ data($PAQUETE/ns1:DES_CORTA) }</DESC_CORTA>
                                <VIGENCIA>{ data($PAQUETE/ns1:VIGENCIA) }</VIGENCIA>
                                <CANTIDAD>{ data($PAQUETE/ns1:CANTIDAD) }</CANTIDAD>
                                <TIPO>{ data($PAQUETE/ns1:TIPO) }</TIPO>
                                <DESC_LARGA>{ data($PAQUETE/ns1:DESC_LARGA) }</DESC_LARGA>
                            </PAQUETE>
                    }
                </PAQUETES>
            </MENSAJE>
            <DESCRIPCION>{ $descripcion }</DESCRIPCION>
        </ns0:WS_Result>
};

declare variable $outputParameters1 as element(ns1:OutputParameters) external;
declare variable $descripcion as xs:string external;

xf:consultarListaPaquetesTAT_Res($outputParameters1,
    $descripcion)

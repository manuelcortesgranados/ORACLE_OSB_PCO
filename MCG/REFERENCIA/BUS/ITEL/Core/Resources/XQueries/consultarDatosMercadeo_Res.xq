(:: pragma bea:global-element-parameter parameter="$outputParameters1" element="ns1:OutputParameters" location="../Schemas/BD_ITEL_CONSULTAR_DATOS_MERCADEO.xsd" ::)
(:: pragma bea:global-element-return element="ns0:WS_Result" location="../Schemas/PS_ITEL_CONSULTARDATOSMERCADEO.xsd" ::)

declare namespace ns1 = "http://xmlns.oracle.com/pcbpel/adapter/db/ITELSOA/PKG_SOA_ITEL/PRC_CONSULTAR_MERCADEO/";
declare namespace ns0 = "http://www.comcel.com.co/ConsultarDatosMercadeo";
declare namespace xf = "http://tempuri.org/ITEL/Core/Resources/XQueries/consultarDatosMercadeo_Res/";

declare function xf:consultarDatosMercadeo_Res($outputParameters1 as element(ns1:OutputParameters))
    as element(ns0:WS_Result) {
        <ns0:WS_Result>
            <ns0:CODIGO>{1}</ns0:CODIGO>
            <ns0:MENSAJE>
                <ns0:CARGAINICIAL>{ data($outputParameters1/ns1:P_CARGAINICIAL) }</ns0:CARGAINICIAL>
                <ns0:CATEGORIA>{ data($outputParameters1/ns1:P_CATEGORIA) }</ns0:CATEGORIA>
                <ns0:VIGENCIA>{ data($outputParameters1/ns1:P_VIGENCIA) }</ns0:VIGENCIA>
                <ns0:BLOQUEA>{ data($outputParameters1/ns1:P_BLOQUEA) }</ns0:BLOQUEA>
                <ns0:CANTSMS>{ data($outputParameters1/ns1:P_CANTSMS) }</ns0:CANTSMS>
                <ns0:VIGENCIASMS>{ data($outputParameters1/ns1:P_VIGENCIASMS) }</ns0:VIGENCIASMS>
                <ns0:EXITO>{ data($outputParameters1/ns1:P_EXITO) }</ns0:EXITO>
            </ns0:MENSAJE>
            <ns0:DESCRIPCION />
        </ns0:WS_Result>
};

declare variable $outputParameters1 as element(ns1:OutputParameters) external;

xf:consultarDatosMercadeo_Res($outputParameters1)
(:: pragma bea:global-element-parameter parameter="$outputParameters1" element="ns1:OutputParameters" location="../Schemas/BD_ITEL_CONSULTAR_PAQUETES.xsd" ::)
(:: pragma bea:global-element-return element="ns0:WS_Result" location="../Schemas/PS_ITEL_CONSULTARPAQUETES.xsd" ::)

declare namespace ns1 = "http://xmlns.oracle.com/pcbpel/adapter/db/sp/bd_consultarPaquetes";
declare namespace ns0 = "http://www.comcel.com.co/ConsultarPaquetes/";
declare namespace xf = "http://tempuri.org/ITEL/Core/Resources/XQueries/consultarPaquetes_Res/";

declare function xf:consultarPaquetes_Res($outputParameters1 as element(ns1:OutputParameters), $descripcion as xs:string)
    as element(ns0:WS_Result) {
        <ns0:WS_Result>
            <MENSAJE>
                <UNIDADES>{ data($outputParameters1/ns1:P_UNIDADES) }</UNIDADES>
                <VIGENCIA>{ data($outputParameters1/ns1:P_VIGENCIA) }</VIGENCIA>
                <VALOR>{ data($outputParameters1/ns1:P_VALOR) }</VALOR>
                <CUENTA>{ data($outputParameters1/ns1:P_CUENTA) }</CUENTA>
                <OFFEROLM>{ data($outputParameters1/ns1:P_OFFEROLM) }</OFFEROLM>
            </MENSAJE>
            <DESCRIPCION>{ $descripcion }</DESCRIPCION>
        </ns0:WS_Result>
};

declare variable $outputParameters1 as element(ns1:OutputParameters) external;
declare variable $descripcion as xs:string external;

xf:consultarPaquetes_Res($outputParameters1, $descripcion)
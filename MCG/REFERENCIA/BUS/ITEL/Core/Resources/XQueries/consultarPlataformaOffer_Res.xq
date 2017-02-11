(:: pragma bea:global-element-parameter parameter="$outputParameters1" element="ns0:OutputParameters" location="../Schemas/BD_CONSULTAR_PLATAFORMA_OFFER.xsd" ::)
(:: pragma bea:global-element-return element="ns1:WS_Result" location="../Schemas/PS_ITEL_CONSULTAR_PLATAFORMA_OFFER.xsd" ::)

declare namespace ns1 = "http://www.comcel.com.co/consultarPlataformaOffer/";
declare namespace ns0 = "http://xmlns.oracle.com/pcbpel/adapter/db/sp/db_consultarPlataformaOffer";
declare namespace xf = "http://tempuri.org/ITEL/Core/Resources/XQueries/consultarPlataformaOffer_Res/";

declare function xf:consultarPlataformaOffer_Res($outputParameters1 as element(ns0:OutputParameters))
    as element(ns1:WS_Result) {
        <ns1:WS_Result>
            <CODIGO>1</CODIGO>
            <MENSAJE>
                <PLATAFORMA>{ data($outputParameters1/ns0:P_PLATAFORMA) }</PLATAFORMA>
                <RESULTADO>{ data($outputParameters1/ns0:RESULTADO) }</RESULTADO>
            </MENSAJE>
            <DESCRIPCION>Ejecucion Exitosa</DESCRIPCION>
        </ns1:WS_Result>
};

declare variable $outputParameters1 as element(ns0:OutputParameters) external;

xf:consultarPlataformaOffer_Res($outputParameters1)

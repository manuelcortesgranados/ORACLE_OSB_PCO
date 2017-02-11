(:: pragma bea:global-element-parameter parameter="$outputParameters1" element="ns1:OutputParameters" location="../Schemas/BD_ITEL_CONSULTARDIASORPRESAELEGIDO.xsd" ::)
(:: pragma bea:global-element-return element="ns0:WS_Result" location="../Schemas/PS_ITEL_CONSULTARDIASORPRESAELEGIDO.xsd" ::)

declare namespace ns0 = "http://www.comcel.com.co/ConsultarDiaSorpresaElegido/";
declare namespace ns1 = "http://xmlns.oracle.com/pcbpel/adapter/db/sp/bd_consultarDiaSorpresaElegido";
declare namespace xf = "http://tempuri.org/ITEL/Core/Resources/XQueries/consultarDiaSorpresaElegido_Res/";

declare function xf:consultarDiaSorpresaElegido_Res($outputParameters1 as element(ns1:OutputParameters),
    $descripcion as xs:string)
    as element(ns0:WS_Result) {
        <ns0:WS_Result>
            <CODIGO>OK</CODIGO>
            <MENSAJE>
                <BONO>{ data($outputParameters1/ns1:P_BONO) }</BONO>
                <PLATAFORMA>{ data($outputParameters1/ns1:P_PLATAFORMA) }</PLATAFORMA>
            </MENSAJE>
            <DESCRIPCION>{ $descripcion }</DESCRIPCION>
        </ns0:WS_Result>
};

declare variable $outputParameters1 as element(ns1:OutputParameters) external;
declare variable $descripcion as xs:string external;

xf:consultarDiaSorpresaElegido_Res($outputParameters1,
    $descripcion)

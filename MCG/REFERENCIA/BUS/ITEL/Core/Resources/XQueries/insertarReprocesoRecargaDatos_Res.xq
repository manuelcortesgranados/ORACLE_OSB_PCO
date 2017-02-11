(:: pragma bea:global-element-parameter parameter="$outputParameters1" element="ns0:OutputParameters" location="../Schemas/BD_ITEL_INSERTAR_REPROCESORECARGADATOS.xsd" ::)
(:: pragma bea:global-element-return element="ns1:WS_Result" location="../Schemas/PS_ITEL_INSERTAR_REPROCESORECARGADATOS.xsd" ::)

declare namespace ns1 = "http://www.comcel.com.co/InsertarReprocesoRecargaDatos";
declare namespace ns0 = "http://xmlns.oracle.com/pcbpel/adapter/db/sp/bd_insertarReprocesoRecargaDatos";
declare namespace xf = "http://tempuri.org/ITEL/Core/Resources/XQueries/insertarReprocesoRecargaDatos_Res/";

declare function xf:insertarReprocesoRecargaDatos_Res($outputParameters1 as element(ns0:OutputParameters),
    $descripcion as xs:string)
    as element(ns1:WS_Result) {
        <ns1:WS_Result>
        	<CODIGO>OK</CODIGO>
            <MENSAJE>
                <EXITO>{ data($outputParameters1/*:P_EXITO) }</EXITO>
            </MENSAJE>
            <DESCRIPCION>{ $descripcion }</DESCRIPCION>
        </ns1:WS_Result>
};

declare variable $outputParameters1 as element(ns0:OutputParameters) external;
declare variable $descripcion as xs:string external;

xf:insertarReprocesoRecargaDatos_Res($outputParameters1,
    $descripcion)
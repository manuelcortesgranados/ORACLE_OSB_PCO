(:: pragma bea:global-element-parameter parameter="$outputParameters1" element="ns1:OutputParameters" location="../Schemas/BD_ITEL_PAQUETESRECURRENTES.xsd" ::)
(:: pragma bea:global-element-return element="ns0:WS_Result" location="../Schemas/PS_ITEL_PAQUETESRECURRENTES.xsd" ::)

declare namespace ns1 = "http://xmlns.oracle.com/pcbpel/adapter/db/sp/bd_paquetesRecurrentes";
declare namespace ns0 = "http://www.comcel.com.co/PaquetesRecurrentes/";
declare namespace xf = "http://tempuri.org/ITEL/Core/Resources/XQueries/paquetesRecurrente_Res/";

declare function xf:paquetesRecurrente_Res($outputParameters1 as element(ns1:OutputParameters), $descripcion as xs:string)
    as element(ns0:WS_Result) {
        <ns0:WS_Result>
			<CODIGO>OK</CODIGO>        
            <MENSAJE>
                <SALIDA>{ data($outputParameters1/ns1:SALIDA) }</SALIDA>
            </MENSAJE>
            <DESCRIPCION>{ $descripcion } </DESCRIPCION>
        </ns0:WS_Result>
};

declare variable $outputParameters1 as element(ns1:OutputParameters) external;
declare variable $descripcion as xs:string external;

xf:paquetesRecurrente_Res($outputParameters1, $descripcion)
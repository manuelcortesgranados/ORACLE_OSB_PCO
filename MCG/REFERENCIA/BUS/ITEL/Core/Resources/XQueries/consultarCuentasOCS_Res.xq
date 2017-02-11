(:: pragma bea:global-element-parameter parameter="$outputParameters1" element="ns0:OutputParameters" location="../Schemas/BD_ITEL_CONSULTARCUENTASOCS.xsd" ::)
(:: pragma bea:global-element-return element="ns1:WS_Result" location="../Schemas/PS_ITEL_CONSULTARCUENTASOCS.xsd" ::)

declare namespace ns1 = "http://www.comcel.com.co/ConsultarCuentasOCS/";
declare namespace ns0 = "http://xmlns.oracle.com/pcbpel/adapter/db/sp/bd_consultarCuentasOCS";
declare namespace xf = "http://tempuri.org/ITEL/Core/Resources/XQueries/consultarCuentasOCS_Res/";

declare function xf:consultarCuentasOCS_Res($outputParameters1 as element(ns0:OutputParameters),
    $descripcion as xs:string)
    as element(ns1:WS_Result) {
        <ns1:WS_Result>
            <CODIGO>OK</CODIGO>
            <MENSAJE>
                {
                    <CUENTA>{ 
                    concat(for $P_CUENTA_Row in $outputParameters1/ns0:P_CUENTAS/ns0:P_CUENTA_Row
                    return
                        concat(data($P_CUENTA_Row/*:CUENTA),'|')) }</CUENTA>
                }
            </MENSAJE>
            <DESCRIPCION>{ $descripcion }</DESCRIPCION>
        </ns1:WS_Result>
};

declare variable $outputParameters1 as element(ns0:OutputParameters) external;
declare variable $descripcion as xs:string external;

xf:consultarCuentasOCS_Res($outputParameters1,
    $descripcion)
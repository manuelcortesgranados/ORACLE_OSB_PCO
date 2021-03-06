(:: pragma bea:global-element-parameter parameter="$outputParameters1" element="ns1:OutputParameters" location="../Schemas/BD_ITEL_CONSULTARCUENTASOCSPAQ.xsd" ::)
(:: pragma bea:global-element-return element="ns0:WS_Result" location="../Schemas/PS_ITEL_CONSULTARCUENTASOCSPAQ.xsd" ::)

declare namespace ns1 = "http://xmlns.oracle.com/pcbpel/adapter/db/sp/bd_consultarCuentasOCSPaq";
declare namespace ns0 = "http://www.comcel.com.co/ConsultarCuentasOCS/";
declare namespace xf = "http://tempuri.org/ITEL/Core/Resources/XQueries/consultarCuentasOCSPAQ_Res/";

declare function xf:consultarCuentasOCSPAQ_Res($outputParameters1 as element(ns1:OutputParameters),
    $descripcion as xs:string)
    as element(ns0:WS_Result) {
        <ns0:WS_Result>
            <CODIGO>OK</CODIGO>
            <MENSAJE>{
                <CUENTA>
                    {
                        concat(for $P_CUENTA_Row in $outputParameters1/*:P_CUENTAS/*:P_CUENTAS_Row
                        return
                        concat(data($P_CUENTA_Row/*:CUENTA),'|'))
                    }
                </CUENTA>}
            </MENSAJE>
            <DESCRIPCION>{ $descripcion }</DESCRIPCION>
        </ns0:WS_Result>
};

declare variable $outputParameters1 as element(ns1:OutputParameters) external;
declare variable $descripcion as xs:string external;

xf:consultarCuentasOCSPAQ_Res($outputParameters1,
    $descripcion)

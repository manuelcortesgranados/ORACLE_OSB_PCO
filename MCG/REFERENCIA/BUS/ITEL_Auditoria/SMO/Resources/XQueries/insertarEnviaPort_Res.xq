(:: pragma bea:global-element-parameter parameter="$outputParameters1" element="ns0:OutputParameters" location="../Schemas/BD_INH_SMO_PRCINS_ENVIA_PORT_OUT.xsd" ::)
(:: pragma bea:global-element-return element="ns1:WS_Result" location="../Schemas/PS_INH_SMO_PRCINS_ENVIA_PORT_OUT.xsd" ::)

declare namespace ns1 = "http://www.comcel.com.co/AuditoriaITEL/";
declare namespace ns0 = "http://xmlns.oracle.com/pcbpel/adapter/db/INH_SMO/PRCINS_ENVIA_PORT_OUT/";
declare namespace xf = "http://tempuri.org/ITEL_Auditoria/Resources/XQueries/insertarEnviarPort_Res/";

declare function xf:insertarEnviarPort_Res($outputParameters1 as element(ns0:OutputParameters))
    as element(ns1:WS_Result) {
        <ns1:WS_Result>
            <MENSAJE>
                {
                    for $V_SQLCODE in $outputParameters1/ns0:V_SQLCODE
                    return
                        <SQLCODE>{ data($V_SQLCODE) }</SQLCODE>
                }
                {
                    for $V_SQLERRDESC in $outputParameters1/ns0:V_SQLERRDESC
                    return
                        <SQLERRDESC>{ data($V_SQLERRDESC) }</SQLERRDESC>
                }
            </MENSAJE>
        </ns1:WS_Result>
};

declare variable $outputParameters1 as element(ns0:OutputParameters) external;

xf:insertarEnviarPort_Res($outputParameters1)
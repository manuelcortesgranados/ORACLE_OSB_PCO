(:: pragma bea:global-element-parameter parameter="$outputParameters1" element="ns1:OutputParameters" location="../Schemas/BD_GET_RADICATEDMAACACTIVA.xsd" ::)
(:: pragma bea:global-element-return element="ns0:WS_Result" location="../Schemas/PS_GET_RADICATEDMAACACTIVA.xsd" ::)

declare namespace ns1 = "http://xmlns.oracle.com/pcbpel/adapter/db/INH_MOTORREGLAS/PKG_RULESENGINE_ACTIVA/PRC_GET_RADICATED_MAAC_ACTIVA/";
declare namespace ns0 = "http://www.claro.com.co/rulesEngine/getRadicatedMaacActiva";
declare namespace xf = "http://tempuri.org/RulesEngine/Activa/Resources/XQueries/getRadicatedMaacActiva_Res/";

declare function xf:getRadicatedMaacActiva_Res($outputParameters1 as element(ns1:OutputParameters))
    as element(ns0:WS_Result) {
        <ns0:WS_Result>
            <code>1</code>
            <message>
                {
                    for $P_LIST_RADICATED_Row in $outputParameters1/ns1:P_LIST_RADICATED/ns1:P_LIST_RADICATED_Row
                    return
                        <salesMatrixResult>
                            {
                                for $NOMBRE_GAMA in $P_LIST_RADICATED_Row/ns1:NOMBRE_GAMA
                                return
                                    <gama>{ data($NOMBRE_GAMA) }</gama>
                            }
                            {
                                for $NOMBRE_PLAN in $P_LIST_RADICATED_Row/ns1:NOMBRE_PLAN
                                return
                                    <plan>{ data($NOMBRE_PLAN) }</plan>
                            }
                            {
                                for $NUMLIN in $P_LIST_RADICATED_Row/ns1:NUMLIN
                                return
                                    <linesNumber>{ data($NUMLIN) }</linesNumber>
                            }
                            {
                                for $CFM in $P_LIST_RADICATED_Row/ns1:CFM
                                return
                                    <cfm>{ data($CFM) }</cfm>
                            }
                            
                        </salesMatrixResult>
                }
            </message>
            
            
            
            <description>Operacion Ejecutada</description>
        </ns0:WS_Result>
};

declare variable $outputParameters1 as element(ns1:OutputParameters) external;

xf:getRadicatedMaacActiva_Res($outputParameters1)

(:: pragma bea:global-element-parameter parameter="$outputParameters1" element="ns3:OutputParameters" location="../Schemas/BD_GET_CLIENTDOCUMENTSTATUS.xsd" ::)
(:: pragma bea:global-element-return element="ns2:WS_Result" location="../Schemas/PS_GET_CLIENTDOCUMENTSTATUS.xsd" ::)

declare namespace ns2 = "http://www.claro.com.co/rulesEngine/getClientDocumentStatus";
declare namespace ns1 = "http://www.claro.com.co/rulesEngine/canonicalModel/CommonBusinessEntities";
declare namespace ns3 = "http://xmlns.oracle.com/pcbpel/adapter/db/sp/getClientDocumentStatus";
declare namespace ns0 = "http://www.claro.com.co/rulesEngine/canonicalModel/CustomerDomain";
declare namespace xf = "http://tempuri.org/RulesEngine/Activa/Resources/XQueries/getClientDocumentStatus_Res/";

declare function xf:getClientDocumentStatus_Res($outputParameters1 as element(ns3:OutputParameters))
    as element(ns2:WS_Result) {
        <ns2:WS_Result>
            <code>1</code>
            <message>
                <customerDocumentStatus>
                    {
                        for $NUMERO_DOCUMENTO in $outputParameters1/ns3:P_ESTADOS/ns3:P_ESTADOS_Row[1]/ns3:NUMERO_DOCUMENTO
                        return
                            <identifierNumber>{ data($NUMERO_DOCUMENTO) }</identifierNumber>
                    }
                    <type>
                        {
                            for $TIPO_DOCUMENTO0 in $outputParameters1/ns3:P_ESTADOS/ns3:P_ESTADOS_Row[1]/ns3:TIPO_DOCUMENTO
                            return
                                <code>{ data($TIPO_DOCUMENTO0) }</code>
                        }
                    </type>
                    {
                        for $P_ESTADOS_Row in $outputParameters1/ns3:P_ESTADOS/ns3:P_ESTADOS_Row
                        return
                            <documentStatus>
                                {
                                    for $ESTADO in $P_ESTADOS_Row/ns3:ESTADO
                                    return
                                        <description>{ data($ESTADO) }</description>
                                }
                                <statusType>
                                    {
                                        for $OBSERVACIONES in $P_ESTADOS_Row/ns3:OBSERVACIONES
                                        return
                                            <description>{ data($OBSERVACIONES) }</description>
                                    }
                                </statusType>
                            </documentStatus>
                    }
                </customerDocumentStatus>
            </message>
            <description>Operacion ejecutada</description>
        </ns2:WS_Result>
};

declare variable $outputParameters1 as element(ns3:OutputParameters) external;

xf:getClientDocumentStatus_Res($outputParameters1)

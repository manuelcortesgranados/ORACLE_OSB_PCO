(:: pragma bea:global-element-parameter parameter="$enviarSMSResponse1" element="ns1:enviarSMSResponse" location="../Schemas/conectorSMPP.xsd" ::)
(:: pragma bea:global-element-return element="ns0:WS_Result" location="../Schemas/PS_ITEL_CONECTOR_SMPP.xsd" ::)

declare namespace ns0 = "http://www.comcel.com.co/conectorSMPP/";
declare namespace ns1 = "http://ws.conectorSMPP.claro.com.co/";
declare namespace xf = "http://tempuri.org/ITEL/Core/Resources/XQueries/conectorSMPP_Res/";

declare function xf:conectorSMPP_Res($enviarSMSResponse1 as element(ns1:enviarSMSResponse))
    as element(ns0:WS_Result) {
        <ns0:WS_Result>
            <CODIGO>1</CODIGO>
            <MENSAJE>
                <RESULTADO>{ data($enviarSMSResponse1/envia) }</RESULTADO>
            </MENSAJE>
            <DESCRIPCION>Succesful</DESCRIPCION>
        </ns0:WS_Result>
};

declare variable $enviarSMSResponse1 as element(ns1:enviarSMSResponse) external;

xf:conectorSMPP_Res($enviarSMSResponse1)

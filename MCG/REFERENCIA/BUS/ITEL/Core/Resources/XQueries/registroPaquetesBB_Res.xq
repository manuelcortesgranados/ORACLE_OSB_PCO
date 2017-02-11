(:: pragma bea:global-element-parameter parameter="$outputParameters1" element="ns0:OutputParameters" location="../Schemas/BD_ITEL_REGISTRO_PAQUETESBB.xsd" ::)
(:: pragma bea:global-element-return element="ns1:WS_Result" location="../Schemas/PS_ITEL_REGISTRO_PAQUETESBB.xsd" ::)

declare namespace ns1 = "http://www.comcel.com.co/registroPaquetesBB/";
declare namespace ns0 = "http://xmlns.oracle.com/pcbpel/adapter/db/sp/bd_registroPaquetesBB";
declare namespace xf = "http://tempuri.org/ITEL/Core/Resources/XQueries/registroPaquetesBB_Res/";

declare function xf:registroPaquetesBB_Res($outputParameters1 as element(ns0:OutputParameters))
    as element(ns1:WS_Result) {
        <ns1:WS_Result>
            <CODIGO>{
                if (data($outputParameters1/ns0:P_RESULT)= 'OK')then 
                 "1"
                else
                 data($outputParameters1/ns0:P_RESULT)
              }</CODIGO>
            <MENSAJE>
                <RESULTADO>{ data($outputParameters1/ns0:P_RESULT) }</RESULTADO>
            </MENSAJE>
            <DESCRIPCION>Ejecucion Exitosa</DESCRIPCION>
        </ns1:WS_Result>
};

declare variable $outputParameters1 as element(ns0:OutputParameters) external;

xf:registroPaquetesBB_Res($outputParameters1)

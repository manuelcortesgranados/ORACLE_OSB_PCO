(:: pragma bea:global-element-parameter parameter="$outputParameters1" element="ns1:OutputParameters" location="../Schemas/BD_BB_PREPAGO.xsd" ::)
(:: pragma bea:global-element-return element="ns0:WS_Result" location="../Schemas/PS_ITEL_BBPREPAGO.xsd" ::)

declare namespace ns1 = "http://xmlns.oracle.com/pcbpel/adapter/db/sp/bd_bbPrepago";
declare namespace ns0 = "http://www.comcel.com.co/BbPrepago/";
declare namespace xf = "http://tempuri.org/ITEL/BSCS/Resources/XQueries/bbPrepago_Res/";

declare function xf:bbPrepago_Res($outputParameters1 as element(ns1:OutputParameters))
    as element(ns0:WS_Result) {
        <ns0:WS_Result>
            <CODIGO>{
              if (data($outputParameters1/ns1:VV_ERROR)="Transaccion Exitosa" or data($outputParameters1/ns1:VV_ERROR)="El cliente paso OK") then 
               "1"
              else
              "ERROR"
            }
            </CODIGO>
            <MENSAJE>
                <R_ERROR>{ data($outputParameters1/ns1:VV_ERROR) }</R_ERROR>
            </MENSAJE>
            <DESCRIPCION>Ejecucion Exitosa</DESCRIPCION>
        </ns0:WS_Result>
};

declare variable $outputParameters1 as element(ns1:OutputParameters) external;

xf:bbPrepago_Res($outputParameters1)

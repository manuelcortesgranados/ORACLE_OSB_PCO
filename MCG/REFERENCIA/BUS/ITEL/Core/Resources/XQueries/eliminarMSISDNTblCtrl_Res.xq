(:: pragma bea:global-element-parameter parameter="$outputParameters1" element="ns1:OutputParameters" location="../Schemas/BD_ITEL_ELIMINARMSISDNTBLCTRL.xsd" ::)
(:: pragma bea:global-element-return element="ns0:WS_Result" location="../Schemas/PS_ITEL_ELIMINARMSISDNTBLCTRL.xsd" ::)

declare namespace ns1 = "http://xmlns.oracle.com/pcbpel/adapter/db/sp/bd_eliminarMSISDNTblCtrl";
declare namespace ns0 = "http://www.comcel.com.co/EliminarMSISDNTblCtrl/";
declare namespace xf = "http://tempuri.org/ITEL/Core/Resources/XQueries/eliminarMSISDNTblCtrl_Res/";

declare function xf:eliminarMSISDNTblCtrl_Res($outputParameters1 as element(ns1:OutputParameters),
    $codigo as xs:string,
    $descripcion as xs:string)
    as element(ns0:WS_Result) {
        <ns0:WS_Result>
            <CODIGO>{ $codigo }</CODIGO>
            <MENSAJE>
                <EXITO>{ data($outputParameters1/ns1:P_EXITO) }</EXITO>
            </MENSAJE>
            <DESCRIPCION>{ $descripcion }</DESCRIPCION>
        </ns0:WS_Result>
};

declare variable $outputParameters1 as element(ns1:OutputParameters) external;
declare variable $codigo as xs:string external;
declare variable $descripcion as xs:string external;

xf:eliminarMSISDNTblCtrl_Res($outputParameters1,
    $codigo,
    $descripcion)
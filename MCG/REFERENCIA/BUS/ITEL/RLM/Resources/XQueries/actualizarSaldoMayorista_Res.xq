(:: pragma bea:local-element-parameter parameter="$actualizar_saldo1" type="ns0:Actualizar_saldoResponse" location="../Schemas/MayoristaService.xsd" ::)
(:: pragma bea:global-element-return element="ns1:WS_Result" location="../Schemas/PS_ACTUALIZAR_SALDO_MAYORISTA.xsd" ::)

declare namespace ns1 = "http://www.comcel.com.co/ActualizarSaldoMayorista/";
declare namespace ns0 = "http://comcel/";
declare namespace xf = "http://tempuri.org/ITEL/RLM/Resources/XQueries/actualizarSaldoMayorista_Res/";

declare function xf:actualizarSaldoMayorista_Res($actualizar_saldo1 as element(),
    $codigo as xs:string,
    $descripcion as xs:string)
    as element(ns1:WS_Result) {
        <ns1:WS_Result>
            <CODIGO>{ $codigo }</CODIGO>
            <MENSAJE>
                {
                    for $cod_respuesta in $actualizar_saldo1/return/actualizar_saldo/cod_respuesta
                    return
                        <CODIGO_RESPUESTA>{ data($cod_respuesta) }</CODIGO_RESPUESTA>
                }
                {
                    for $msj_respuesta in $actualizar_saldo1/return/actualizar_saldo/msj_respuesta
                    return
                        <MENSAJE_RESPUESTA>{ data($msj_respuesta) }</MENSAJE_RESPUESTA>
                }
                {
                    for $saldo_final in $actualizar_saldo1/return/actualizar_saldo/saldo_final
                    return
                        <SALDO_FINAL>{ data($saldo_final) }</SALDO_FINAL>
                }
                {
                    for $saldo_inicial in $actualizar_saldo1/return/actualizar_saldo/saldo_inicial
                    return
                        <SALDO_INICIAL>{ data($saldo_inicial) }</SALDO_INICIAL>
                }
            </MENSAJE>
            <DESCRIPCION>{ $descripcion }</DESCRIPCION>
        </ns1:WS_Result>
};

declare variable $actualizar_saldo1 as element() external;
declare variable $codigo as xs:string external;
declare variable $descripcion as xs:string external;

xf:actualizarSaldoMayorista_Res($actualizar_saldo1,
    $codigo,
    $descripcion)

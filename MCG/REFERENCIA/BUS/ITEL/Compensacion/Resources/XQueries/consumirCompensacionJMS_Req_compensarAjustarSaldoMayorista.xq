(:: pragma bea:local-element-parameter parameter="$sERVICIO1" type="ns1:Input_Parameters/SERVICIOS_EJECUTADOS/SERVICIO" location="../Schemas/PS_ITEL_COMPENSACION.xsd" ::)
(:: pragma bea:global-element-return element="ns0:Input_Parameters" location="../../../RLM/Resources/Schemas/PS_ACTUALIZAR_SALDO_MAYORISTA.xsd" ::)

declare namespace ns1 = "http://www.comcel.com.co/CompensacionITEL/";
declare namespace ns0 = "http://www.comcel.com.co/ActualizarSaldoMayorista/";
declare namespace xf = "http://tempuri.org/ITEL/Compensacion/Resources/XQueries/consumirCompensacionJMS_Req_compensarAjustarSaldoMayorista/";

declare function xf:consumirCompensacionJMS_Req_compensarAjustarSaldoMayorista($sERVICIO1 as element())
    as element(ns0:Input_Parameters) {
        <ns0:Input_Parameters>
              <NIT>{ data($sERVICIO1/PARAMETROS/PARAMETRO[NOMBRE="NIT"]/VALOR) }</NIT>
              <TIPO>{ data($sERVICIO1/PARAMETROS/PARAMETRO[NOMBRE="TIPO"]/VALOR) }</TIPO>
              <VALOR>{ (number($sERVICIO1/PARAMETROS/PARAMETRO[NOMBRE="VALOR"]/VALOR)*-1) }</VALOR>
              <IDTRANSACCION>{ data($sERVICIO1/PARAMETROS/PARAMETRO[NOMBRE="IDTRANSACCION"]/VALOR) }</IDTRANSACCION>
        </ns0:Input_Parameters>
};

declare variable $sERVICIO1 as element() external;

xf:consumirCompensacionJMS_Req_compensarAjustarSaldoMayorista($sERVICIO1)

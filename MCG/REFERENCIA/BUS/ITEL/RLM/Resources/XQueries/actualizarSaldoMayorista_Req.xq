(:: pragma bea:global-element-parameter parameter="$input_Parameters1" element="ns1:Input_Parameters" location="../Schemas/PS_ACTUALIZAR_SALDO_MAYORISTA.xsd" ::)
(:: pragma bea:global-element-return element="ns0:Actualizar_saldo" location="../Schemas/MayoristaService.xsd" ::)

declare namespace ns1 = "http://www.comcel.com.co/ActualizarSaldoMayorista/";
declare namespace ns0 = "http://comcel/";
declare namespace xf = "http://tempuri.org/ITEL/RLM/Resources/XQueries/actualizarSaldoMayorista_Req/";

declare function xf:actualizarSaldoMayorista_Req($input_Parameters1 as element(ns1:Input_Parameters))
    as element(ns0:Actualizar_saldo) {
        <ns0:Actualizar_saldo>
            <nit>{ data($input_Parameters1/NIT) }</nit>
            <tipo>{ data($input_Parameters1/TIPO) }</tipo>
            <valor>{ data($input_Parameters1/VALOR) }</valor>
            <Idtransaccion>{ data($input_Parameters1/IDTRANSACCION) }</Idtransaccion>
        </ns0:Actualizar_saldo>
};

declare variable $input_Parameters1 as element(ns1:Input_Parameters) external;

xf:actualizarSaldoMayorista_Req($input_Parameters1)

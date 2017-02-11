(:: pragma bea:global-element-parameter parameter="$input_Parameters1" element="ns1:Input_Parameters" location="../Schemas/PS_ITEL_COMPENSACION.xsd" ::)
(:: pragma bea:global-element-return element="ns1:Input_Parameters" location="../Schemas/PS_ITEL_COMPENSACION.xsd" ::)

declare namespace ns1 = "http://www.comcel.com.co/CompensacionITEL/";
declare namespace ns0 = "http://www.comcel.com.co/IN/OperacionCorba";
declare namespace xf = "http://tempuri.org/ITEL/Compensacion/Resources/XQueries/serviciosEjecutadosSwap/";

declare function xf:serviciosEjecutadosSwap($input_Parameters1 as element(ns1:Input_Parameters))
    as element(ns1:Input_Parameters) {
        <ns1:Input_Parameters>
            <METODO>{ data($input_Parameters1/METODO) }</METODO>
            <SUSCRIPTOR_DESTINO>{ $input_Parameters1/SUSCRIPTOR_DESTINO/@* , $input_Parameters1/SUSCRIPTOR_DESTINO/node() }</SUSCRIPTOR_DESTINO>
            {
                for $SUSCRIPTOR_ORIGEN in $input_Parameters1/SUSCRIPTOR_ORIGEN
                return
                    <SUSCRIPTOR_ORIGEN>{ $SUSCRIPTOR_ORIGEN/@* , $SUSCRIPTOR_ORIGEN/node() }</SUSCRIPTOR_ORIGEN>
            }
            <SERVICIOS_EJECUTADOS>{ fn:reverse(($input_Parameters1/SERVICIOS_EJECUTADOS/@* , $input_Parameters1/SERVICIOS_EJECUTADOS/node())) }</SERVICIOS_EJECUTADOS>
            {
                for $BALANCES in $input_Parameters1/BALANCES
                return
                    <BALANCES>{ $BALANCES/@* , $BALANCES/node() }</BALANCES>
            }
            {
                for $BALANCES_ANTERIOR in $input_Parameters1/BALANCES_ANTERIOR
                return
                    <BALANCES_ANTERIOR>{ $BALANCES_ANTERIOR/@* , $BALANCES_ANTERIOR/node() }</BALANCES_ANTERIOR>
            }
            {
                for $SUSCRIPTOR_OCS in $input_Parameters1/SUSCRIPTOR_OCS
                return
                    <SUSCRIPTOR_OCS>{ $SUSCRIPTOR_OCS/@* , $SUSCRIPTOR_OCS/node() }</SUSCRIPTOR_OCS>
            }
        </ns1:Input_Parameters>
};

declare variable $input_Parameters1 as element(ns1:Input_Parameters) external;

xf:serviciosEjecutadosSwap($input_Parameters1)
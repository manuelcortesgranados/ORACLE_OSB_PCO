(:: pragma bea:global-element-parameter parameter="$input_Parameters1" element="ns0:Input_Parameters" location="../Schemas/PS_ITEL_BBPREPAGO.xsd" ::)
(:: pragma bea:global-element-return element="ns1:InputParameters" location="../Schemas/BD_BB_PREPAGO.xsd" ::)

declare namespace ns1 = "http://xmlns.oracle.com/pcbpel/adapter/db/sp/bd_bbPrepago";
declare namespace ns0 = "http://www.comcel.com.co/BbPrepago/";
declare namespace xf = "http://tempuri.org/ITEL/BSCS/Resources/XQueries/bbPrepago_Req/";

declare function xf:bbPrepago_Req($input_Parameters1 as element(ns0:Input_Parameters))
    as element(ns1:InputParameters) {
        <ns1:InputParameters>
            <ns1:PV_DNNUM>{ data($input_Parameters1/MIN) }</ns1:PV_DNNUM>
            <ns1:VACCION1>{ data($input_Parameters1/ACCION) }</ns1:VACCION1>
            <ns1:VTIPO1>{ data($input_Parameters1/TIPO) }</ns1:VTIPO1>
        </ns1:InputParameters>
};

declare variable $input_Parameters1 as element(ns0:Input_Parameters) external;

xf:bbPrepago_Req($input_Parameters1)

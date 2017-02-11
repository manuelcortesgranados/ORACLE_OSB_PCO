(:: pragma bea:global-element-parameter parameter="$input_Parameters1" element="ns0:Input_Parameters" location="../Schemas/PS_ITEL_ELIMINARMSISDNTBLCTRL.xsd" ::)
(:: pragma bea:global-element-return element="ns1:InputParameters" location="../Schemas/BD_ITEL_ELIMINARMSISDNTBLCTRL.xsd" ::)

declare namespace ns1 = "http://xmlns.oracle.com/pcbpel/adapter/db/sp/bd_eliminarMSISDNTblCtrl";
declare namespace ns0 = "http://www.comcel.com.co/EliminarMSISDNTblCtrl/";
declare namespace xf = "http://tempuri.org/ITEL/Core/Resources/XQueries/eliminarMSISDNTblCtrl_Req/";

declare function xf:eliminarMSISDNTblCtrl_Req($input_Parameters1 as element(ns0:Input_Parameters))
    as element(ns1:InputParameters) {
        <ns1:InputParameters>
            <ns1:P_MIN>{ data($input_Parameters1/MIN) }</ns1:P_MIN>
        </ns1:InputParameters>
};

declare variable $input_Parameters1 as element(ns0:Input_Parameters) external;

xf:eliminarMSISDNTblCtrl_Req($input_Parameters1)
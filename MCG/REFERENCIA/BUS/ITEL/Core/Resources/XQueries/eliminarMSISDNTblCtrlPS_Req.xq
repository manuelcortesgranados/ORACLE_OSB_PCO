(:: pragma bea:global-element-return element="ns0:Input_Parameters" location="../Schemas/PS_ITEL_ELIMINARMSISDNTBLCTRL.xsd" ::)

declare namespace ns0 = "http://www.comcel.com.co/EliminarMSISDNTblCtrl/";
declare namespace xf = "http://tempuri.org/ITEL/Core/Resources/XQueries/eliminarMSISDNTblCtrlPS_Req/";

declare function xf:eliminarMSISDNTblCtrlPS_Req($MIN as xs:string)
    as element(ns0:Input_Parameters) {
        <ns0:Input_Parameters>
            <MIN>{ $MIN }</MIN>
        </ns0:Input_Parameters>
};

declare variable $MIN as xs:string external;

xf:eliminarMSISDNTblCtrlPS_Req($MIN)
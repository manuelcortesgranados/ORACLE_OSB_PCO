(:: pragma bea:global-element-parameter parameter="$input_Parameters1" element="ns1:Input_Parameters" location="../Schemas/PS_ITEL_ACTUALIZAR_CAMBIOS_DE_PLAN.xsd" ::)
(:: pragma bea:global-element-return element="ns0:InputParameters" location="../Schemas/BD_ITEL_ACTUALIZAR_CAMBIOSDEPLAN.xsd" ::)

declare namespace ns1 = "http://www.comcel.com.co/ActualizarCambiosDePlan/";
declare namespace ns0 = "http://xmlns.oracle.com/pcbpel/adapter/db/SYSTEM/PKG_SOA_ITEL/PRC_AUMENTAR_CAMBIOSDEPLAN/";
declare namespace xf = "http://tempuri.org/ITEL/Core/Resources/XQueries/actualizarCambiosDePlan_Req/";

declare function xf:actualizarCambiosDePlan_Req($input_Parameters1 as element(ns1:Input_Parameters))
    as element(ns0:InputParameters) {
        <ns0:InputParameters>
        	<ns0:P_MIN>{ data($input_Parameters1/MIN) }</ns0:P_MIN>
            <ns0:P_MES>{ data($input_Parameters1/MES) }</ns0:P_MES>
            <ns0:P_ANIO>{ data($input_Parameters1/ANIO) }</ns0:P_ANIO>
        </ns0:InputParameters>
};

declare variable $input_Parameters1 as element(ns1:Input_Parameters) external;

xf:actualizarCambiosDePlan_Req($input_Parameters1)
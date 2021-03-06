(:: pragma bea:global-element-return element="ns0:Input_Parameters" location="../Schemas/PS_ITEL_ACTUALIZARMINRECARGAESC.xsd" ::)

declare namespace ns0 = "http://www.comcel.com.co/ActualizarMinRecargaEsc/";
declare namespace xf = "http://tempuri.org/ITEL/Core/Resources/XQueries/consumirAuditoriaRecargaEscalera_actualizarRecargaEscMin_Req/";

declare function xf:consumirAuditoriaRecargaEscalera_actualizarRecargaEscMin_Req($min as xs:string)
    as element(ns0:Input_Parameters) {
        <ns0:Input_Parameters>
            <MIN>{ $min }</MIN>
        </ns0:Input_Parameters>
};

declare variable $min as xs:string external;

xf:consumirAuditoriaRecargaEscalera_actualizarRecargaEscMin_Req($min)
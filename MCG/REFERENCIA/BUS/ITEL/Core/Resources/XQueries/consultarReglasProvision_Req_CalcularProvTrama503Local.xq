(:: pragma bea:global-element-parameter parameter="$input_Parameters1" element="ns0:Input_Parameters" location="../Schemas/PS_ITEL_CONSULTARREGLASPROVISION.xsd" ::)
(:: pragma bea:global-element-return element="ns1:Input_Parameters" location="../../../Trama503/Resources/Schemas/PS_ITEL_CALCULARPROVISIONTRAMA503.xsd" ::)

declare namespace ns1 = "http://www.comcel.com.co/CalcularProvisionTrama503/";
declare namespace ns0 = "http://www.comcel.com.co/ConsultarReglasProvision/";
declare namespace xf = "http://tempuri.org/ITEL/Core/Resources/XQueries/consultarReglasProvision_Req_CalcularProvTrama503Local/";

declare function xf:consultarReglasProvision_Req_CalcularProvTrama503Local($input_Parameters1 as element(ns0:Input_Parameters))
    as element(ns1:Input_Parameters) {
        <ns1:Input_Parameters>
            <TRAMA>{ data($input_Parameters1/TRAMA) }</TRAMA>
            <METODO>{ data($input_Parameters1/METODO) }</METODO>
            <MIN>{ data($input_Parameters1/MIN_DESTINO) }</MIN>
            <PARAMETROSTRAMA>{ $input_Parameters1/PARAMETROSTRAMA/@* , $input_Parameters1/PARAMETROSTRAMA/node() }</PARAMETROSTRAMA>
            <CODIGOIN>{ data($input_Parameters1/IN_DESTINO) }</CODIGOIN>
            <TIEMPO>{ data($input_Parameters1/TIEMPO) }</TIEMPO>
        </ns1:Input_Parameters>
};

declare variable $input_Parameters1 as element(ns0:Input_Parameters) external;

xf:consultarReglasProvision_Req_CalcularProvTrama503Local($input_Parameters1)
(:: pragma bea:global-element-parameter parameter="$input_Parameters1" element="ns0:Input_Parameters" location="../Schemas/PS_ITEL_CONSULTARPAQUETESDATOS.xsd" ::)
(:: pragma bea:global-element-return element="ns1:InputParameters" location="../Schemas/BD_ITEL_CONSULTAR_PAQUETES_DATOS.xsd" ::)

declare namespace ns1 = "http://xmlns.oracle.com/pcbpel/adapter/db/sp/bd_consultarPaquetesDatos";
declare namespace ns0 = "http://www.comcel.com.co/ConsultarPaquetesDatos/";
declare namespace xf = "http://tempuri.org/ITEL/Core/Resources/XQueries/consultarPaquetesDatos_Req/";

declare function xf:consultarPaquetesDatos_Req($input_Parameters1 as element(ns0:Input_Parameters))
    as element(ns1:InputParameters) {
        <ns1:InputParameters>
            <ns1:P_CODIGO>{ data($input_Parameters1/CODIGO) }</ns1:P_CODIGO>
            <ns1:P_TIPO>{ data($input_Parameters1/TIPO) }</ns1:P_TIPO>
            <ns1:P_CANAL>{ data($input_Parameters1/CANAL) }</ns1:P_CANAL>
        </ns1:InputParameters>
};

declare variable $input_Parameters1 as element(ns0:Input_Parameters) external;

xf:consultarPaquetesDatos_Req($input_Parameters1)

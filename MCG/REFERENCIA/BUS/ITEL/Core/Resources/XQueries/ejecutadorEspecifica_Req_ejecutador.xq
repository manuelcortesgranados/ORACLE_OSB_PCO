(:: pragma bea:global-element-parameter parameter="$input_Parameters1" element="ns0:Input_Parameters" location="../Schemas/PS_ITEL_EJECUTARTRAMA_ESPECIFICA.xsd" ::)
(:: pragma bea:global-element-return element="ns0:Input_Parameters" location="../Schemas/PS_ITEL_EJECUTARTRAMA.xsd" ::)

declare namespace ns0 = "http://www.comcel.com.co/EjecutarTrama/";
declare namespace xf = "http://tempuri.org/ITEL/Core/Resources/XQueries/ejecutadorEspecifica_Req_ejecutador/";

declare function xf:ejecutadorEspecifica_Req_ejecutador($input_Parameters1 as element(ns0:Input_Parameters))
    as element(ns0:Input_Parameters) {
        <ns0:Input_Parameters>
            <TRAMA>{ data($input_Parameters1/TRAMA) }</TRAMA>
            {
                for $IP_ORIGEN in $input_Parameters1/IP_ORIGEN
                return
                    <IP_ORIGEN>{ data($IP_ORIGEN) }</IP_ORIGEN>
            }
        </ns0:Input_Parameters>
};

declare variable $input_Parameters1 as element(ns0:Input_Parameters) external;

xf:ejecutadorEspecifica_Req_ejecutador($input_Parameters1)
(:: pragma bea:global-element-parameter parameter="$input_Parameters1" element="ns1:Input_Parameters" location="../Schemas/PS_ITEL_EJECUTARREGLASNEGOCIO.xsd" ::)
(:: pragma bea:global-element-return element="ns0:Input_Parameters" location="../Schemas/PS_ITEL_CONSULTARREGLAS.xsd" ::)

declare namespace ns1 = "http://www.comcel.com.co/EjecutarReglasNegocio/";
declare namespace ns0 = "http://www.comcel.com.co/ConsultarReglas/";
declare namespace xf = "http://tempuri.org/ITEL/Core/Resources/XQueries/ejecutarReglasNegocio_Req_ConsultarReglasLocal/";

declare function xf:ejecutarReglasNegocio_Req_ConsultarReglasLocal($input_Parameters1 as element(ns1:Input_Parameters))
    as element(ns0:Input_Parameters) {
        <ns0:Input_Parameters>
            <METODO>{ data($input_Parameters1/METODO) }</METODO>
            <MIN_DESTINO>{ data($input_Parameters1/MIN_DESTINO) }</MIN_DESTINO>
            <MIN_ORIGEN>{ data($input_Parameters1/MIN_ORIGEN) }</MIN_ORIGEN>
            <PARAMETROS>
                {
                    for $PARAMETRO in $input_Parameters1/PARAMETROS_TRAMA/PARAMETRO
                    return
                        <PARAMETRO>{ $PARAMETRO/@* , $PARAMETRO/node() }</PARAMETRO>
                }
            </PARAMETROS>
        </ns0:Input_Parameters>
};

declare variable $input_Parameters1 as element(ns1:Input_Parameters) external;

xf:ejecutarReglasNegocio_Req_ConsultarReglasLocal($input_Parameters1)
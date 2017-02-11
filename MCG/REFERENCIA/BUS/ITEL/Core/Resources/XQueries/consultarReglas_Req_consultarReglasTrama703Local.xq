(:: pragma bea:global-element-parameter parameter="$input_Parameters1" element="ns0:Input_Parameters" location="../Schemas/PS_ITEL_CONSULTARREGLAS.xsd" ::)
(:: pragma bea:global-element-return element="ns1:Input_Parameters" location="../../../Trama703/Resources/Schemas/PS_ITEL_CONSULTARREGLASTRAMA703.xsd" ::)

declare namespace ns1 = "http://www.comcel.com.co/ConsultarReglasTrama703/";
declare namespace ns0 = "http://www.comcel.com.co/ConsultarReglas/";
declare namespace xf = "http://tempuri.org/ITEL/Core/Resources/XQueries/consultarReglas_Req_consultarReglasTrama703Local/";

declare function xf:consultarReglas_Req_consultarReglasTrama703Local($input_Parameters1 as element(ns0:Input_Parameters))
    as element(ns1:Input_Parameters) {
        <ns1:Input_Parameters>
            <HEADER>
                <METODO>{ data($input_Parameters1/METODO) }</METODO>
                <MIN>{ data($input_Parameters1/MIN_DESTINO) }</MIN>
            </HEADER>
            <PARAMETERS>
                    	<CODIGO_COBRO>{data($input_Parameters1/PARAMETROS/PARAMETRO[NOMBRE = 'BONIFICAR']/VALOR)}</CODIGO_COBRO>
                    	<CODIGO_CUENTA>{ data($input_Parameters1/PARAMETROS/PARAMETRO[NOMBRE = 'MONTORECARGA']/VALOR) }</CODIGO_CUENTA>
                    	<VIGENCIA>{ data($input_Parameters1/PARAMETROS/PARAMETRO[NOMBRE = 'VIGENCIA']/VALOR) }</VIGENCIA>
                    	<FECHA_RENOVACION>{ data($input_Parameters1/PARAMETROS/PARAMETRO[NOMBRE = 'COMENTARIO']/VALOR) }</FECHA_RENOVACION>
            </PARAMETERS>       	
        </ns1:Input_Parameters>
};

declare variable $input_Parameters1 as element(ns0:Input_Parameters) external;

xf:consultarReglas_Req_consultarReglasTrama703Local($input_Parameters1)
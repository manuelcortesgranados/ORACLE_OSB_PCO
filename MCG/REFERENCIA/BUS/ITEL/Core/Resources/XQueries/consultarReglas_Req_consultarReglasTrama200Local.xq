(:: pragma bea:global-element-parameter parameter="$input_Parameters1" element="ns0:Input_Parameters" location="../Schemas/PS_ITEL_CONSULTARREGLAS.xsd" ::)
(:: pragma bea:global-element-return element="ns1:Input_Parameters" location="../../../Trama200/Resources/Schemas/PS_ITEL_CONSULTARREGLASTRAMA200.xsd" ::)

declare namespace ns1 = "http://www.comcel.com.co/ConsultarReglasTrama200/";
declare namespace ns0 = "http://www.comcel.com.co/ConsultarReglas/";
declare namespace xf = "http://tempuri.org/ITEL/Core/Resources/XQueries/consultarReglas_Req_consultarReglasTrama200Local/";

declare function xf:consultarReglas_Req_consultarReglasTrama200Local($input_Parameters1 as element(ns0:Input_Parameters))
    as element(ns1:Input_Parameters) {
        <ns1:Input_Parameters>
            <HEADER>
                <METODO>{ data($input_Parameters1/METODO) }</METODO>
                <MIN>{ data($input_Parameters1/MIN_DESTINO) }</MIN>
            </HEADER>
            <PARAMETERS>
                    	<TIPOCONSULTA>{data($input_Parameters1/PARAMETROS/PARAMETRO[NOMBRE = 'MONTORECARGA']/VALOR)}</TIPOCONSULTA>
                    	<COBRARCONSULTA>{data($input_Parameters1/PARAMETROS/PARAMETRO[NOMBRE = 'BONIFICAR']/VALOR)}</COBRARCONSULTA>
                    	<CONSULTASDIA>{data($input_Parameters1/PARAMETROS/PARAMETRO[NOMBRE = 'CONSULTASDIA']/VALOR)}</CONSULTASDIA>
                    	<CONSULTASREALIZADAS>{data($input_Parameters1/PARAMETROS/PARAMETRO[NOMBRE = 'CONSULTASREALIZADAS']/VALOR)}</CONSULTASREALIZADAS>
            </PARAMETERS>       	
        </ns1:Input_Parameters>
};

declare variable $input_Parameters1 as element(ns0:Input_Parameters) external;

xf:consultarReglas_Req_consultarReglasTrama200Local($input_Parameters1)
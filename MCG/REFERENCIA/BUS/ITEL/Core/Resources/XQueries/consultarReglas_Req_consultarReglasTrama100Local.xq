(:: pragma bea:global-element-parameter parameter="$input_Parameters1" element="ns0:Input_Parameters" location="../Schemas/PS_ITEL_CONSULTARREGLAS.xsd" ::)
(:: pragma bea:global-element-return element="ns1:Input_Parameters" location="../../../Trama100/Resources/Schemas/PS_ITEL_CONSULTARREGLASTRAMA100.xsd" ::)

declare namespace ns1 = "http://www.comcel.com.co/ConsultarReglasTrama100/";
declare namespace ns0 = "http://www.comcel.com.co/ConsultarReglas/";
declare namespace xf = "http://tempuri.org/ITEL/Core/Resources/XQueries/consultarReglas_Req_consultarReglasTrama100Local/";

declare function xf:consultarReglas_Req_consultarReglasTrama100Local($input_Parameters1 as element(ns0:Input_Parameters))
    as element(ns1:Input_Parameters) {
        <ns1:Input_Parameters>
            <HEADER>
                <METODO>{ data($input_Parameters1/METODO) }</METODO>
                <MIN>{ data($input_Parameters1/MIN_DESTINO) }</MIN>
            </HEADER>
            <PARAMETERS>
                    	<CATEGORIA>{ data($input_Parameters1/PARAMETROS/PARAMETRO[NOMBRE = 'CATEGORIA']/VALOR) }</CATEGORIA>
                    	<CARGAINICIAL>{ data($input_Parameters1/PARAMETROS/PARAMETRO[NOMBRE = 'CARGAINICIAL']/VALOR) }</CARGAINICIAL>
                    	<BLOQUEA>{ data($input_Parameters1/PARAMETROS/PARAMETRO[NOMBRE = 'BLOQUEA']/VALOR) }</BLOQUEA>
                    	<ESPOSTPAGO>{ data($input_Parameters1/PARAMETROS/PARAMETRO[NOMBRE = 'CONTRATOESPOSTPAGO']/VALOR) }</ESPOSTPAGO>
                    	<VIGENCIA>{ data($input_Parameters1/PARAMETROS/PARAMETRO[NOMBRE = 'VIGENCIA']/VALOR) }</VIGENCIA>
                    	
            </PARAMETERS>       	
        </ns1:Input_Parameters>
};

declare variable $input_Parameters1 as element(ns0:Input_Parameters) external;

xf:consultarReglas_Req_consultarReglasTrama100Local($input_Parameters1)
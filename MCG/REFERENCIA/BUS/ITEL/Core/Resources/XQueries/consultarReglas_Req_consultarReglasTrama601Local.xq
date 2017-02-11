(:: pragma bea:global-element-parameter parameter="$input_Parameters1" element="ns0:Input_Parameters" location="../Schemas/PS_ITEL_CONSULTARREGLAS.xsd" ::)
(:: pragma bea:global-element-return element="ns1:Input_Parameters" location="../../../Trama601/Resources/Schemas/PS_ITEL_CONSULTARREGLASTRAMA601.xsd" ::)

declare namespace ns1 = "http://www.comcel.com.co/ConsultarReglasTrama601/";
declare namespace ns0 = "http://www.comcel.com.co/ConsultarReglas/";
declare namespace xf = "http://tempuri.org/ITEL/Core/Resources/XQueries/consultarReglas_Req_consultarReglasTrama601Local/";

declare function xf:consultarReglas_Req_consultarReglasTrama601Local($input_Parameters1 as element(ns0:Input_Parameters))
    as element(ns1:Input_Parameters) {
        <ns1:Input_Parameters>
            <HEADER>
                <METODO>{ data($input_Parameters1/METODO) }</METODO>
                <MIN>{ data($input_Parameters1/MIN_DESTINO) }</MIN>
            </HEADER>
            <PARAMETERS>
                    	<COBRARCAMBIO>{data($input_Parameters1/PARAMETROS/PARAMETRO[NOMBRE = 'HOSTID']/VALOR)}</COBRARCAMBIO>
                    	<CONTRACT>{ data($input_Parameters1/PARAMETROS/PARAMETRO[NOMBRE = 'CONTRATO']/VALOR) }</CONTRACT>
                    	<TMCODE>{data($input_Parameters1/PARAMETROS/PARAMETRO[NOMBRE = 'MONTORECARGA']/VALOR)}</TMCODE>
                    	<SPCODE>{ data($input_Parameters1/PARAMETROS/PARAMETRO[NOMBRE = 'BONIFICAR']/VALOR) }</SPCODE>
            </PARAMETERS>       	
        </ns1:Input_Parameters>
};

declare variable $input_Parameters1 as element(ns0:Input_Parameters) external;

xf:consultarReglas_Req_consultarReglasTrama601Local($input_Parameters1)
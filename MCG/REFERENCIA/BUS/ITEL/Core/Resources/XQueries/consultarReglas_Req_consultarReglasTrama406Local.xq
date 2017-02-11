(:: pragma bea:global-element-parameter parameter="$input_Parameters1" element="ns0:Input_Parameters" location="../Schemas/PS_ITEL_CONSULTARREGLAS.xsd" ::)
(:: pragma bea:global-element-return element="ns1:Input_Parameters" location="../../../Trama406/Resources/Schemas/PS_ITEL_CONSULTARREGLASTRAMA406.xsd" ::)

declare namespace ns1 = "http://www.comcel.com.co/ConsultarReglasTrama406/";
declare namespace ns0 = "http://www.comcel.com.co/ConsultarReglas/";
declare namespace xf = "http://tempuri.org/ITEL/Core/Resources/XQueries/consultarReglas_Req_consultarReglasTrama406Local/";

declare function xf:consultarReglas_Req_consultarReglasTrama406Local($input_Parameters1 as element(ns0:Input_Parameters))
    as element(ns1:Input_Parameters) {
        <ns1:Input_Parameters>
            <HEADER>
                <METODO>{ data($input_Parameters1/METODO) }</METODO>
                <MIN>{ data($input_Parameters1/MIN_DESTINO) }</MIN>
            </HEADER>
            
                    <PARAMETERS>
                    	<COMENTARIO>{data($input_Parameters1/PARAMETROS/PARAMETRO[NOMBRE = 'COMENTARIO']/VALOR)}</COMENTARIO>
                    	<HOSTID>{data($input_Parameters1/PARAMETROS/PARAMETRO[NOMBRE = 'HOSTID']/VALOR)}</HOSTID>
                    	<CONSECUTIVO>{data($input_Parameters1/PARAMETROS/PARAMETRO[NOMBRE = 'CONSECUTIVO']/VALOR)}</CONSECUTIVO>
                    	<CODIGOCUENTA>{data($input_Parameters1/PARAMETROS/PARAMETRO[NOMBRE = 'BONIFICAR']/VALOR)}</CODIGOCUENTA>
                    	<MONTOACREDITA>{data($input_Parameters1/PARAMETROS/PARAMETRO[NOMBRE = 'MONTORECARGA']/VALOR)}</MONTOACREDITA>
                    	<DIASVIGENCIA>{data($input_Parameters1/PARAMETROS/PARAMETRO[NOMBRE = 'DIASVIGENCIA']/VALOR)}</DIASVIGENCIA>                    	
                    </PARAMETERS>
            
        </ns1:Input_Parameters>
};

declare variable $input_Parameters1 as element(ns0:Input_Parameters) external;

xf:consultarReglas_Req_consultarReglasTrama406Local($input_Parameters1)
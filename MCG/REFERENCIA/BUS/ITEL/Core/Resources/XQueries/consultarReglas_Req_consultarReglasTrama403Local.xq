(:: pragma bea:global-element-parameter parameter="$input_Parameters1" element="ns0:Input_Parameters" location="../Schemas/PS_ITEL_CONSULTARREGLAS.xsd" ::)
(:: pragma bea:global-element-return element="ns1:Input_Parameters" location="../../../Trama403/Resources/Schemas/PS_ITEL_CONSULTARREGLASTRAMA403.xsd" ::)

declare namespace ns1 = "http://www.comcel.com.co/ConsultarReglasTrama403/";
declare namespace ns0 = "http://www.comcel.com.co/ConsultarReglas/";
declare namespace xf = "http://tempuri.org/ITEL/Core/Resources/XQueries/consultarReglas_Req_consultarReglasTrama403Local/";

declare function xf:consultarReglas_Req_consultarReglasTrama403Local($input_Parameters1 as element(ns0:Input_Parameters))
    as element(ns1:Input_Parameters) {
        <ns1:Input_Parameters>
            <HEADER>
                <METODO>{ data($input_Parameters1/METODO) }</METODO>
                <MIN>{ data($input_Parameters1/MIN) }</MIN>
            </HEADER>
            
                    <PARAMETERS>
                    	<COMENTARIO>{data($input_Parameters1/PARAMETROS/PARAMETRO[NOMBRE = 'COMENTARIO']/VALOR)}</COMENTARIO>
                    	<HOSTID>{data($input_Parameters1/PARAMETROS/PARAMETRO[NOMBRE = 'HOSTID']/VALOR)}</HOSTID>
                    	<CONSECUTIVO>{data($input_Parameters1/PARAMETROS/PARAMETRO[NOMBRE = 'CONSECUTIVO']/VALOR)}</CONSECUTIVO>
                    	<MONTORECARGA>{data($input_Parameters1/PARAMETROS/PARAMETRO[NOMBRE = 'MONTORECARGA']/VALOR)}</MONTORECARGA>
                    	<BONIFICAR>{data($input_Parameters1/PARAMETROS/PARAMETRO[NOMBRE = 'BONIFICAR']/VALOR)}</BONIFICAR>
                    	<DIASVIGENCIA>{data($input_Parameters1/PARAMETROS/PARAMETRO[NOMBRE = 'DIASVIGENCIA']/VALOR)}</DIASVIGENCIA>
                    	<PLAN>{data($input_Parameters1/PARAMETROS/PARAMETRO[NOMBRE = 'PLAN']/VALOR)}</PLAN>
                    	<PLANESNUEVOS>{
                    		for $plan in tokenize(data($input_Parameters1/PARAMETROS/PARAMETRO[NOMBRE = 'PLANESNUEVOS']/VALOR),";")
                    		return
                    		<Detail>{$plan}</Detail>
                    	}
                    	</PLANESNUEVOS>
                    	<PLANESBONOMIN>{
                    		for $plan in tokenize(data($input_Parameters1/PARAMETROS/PARAMETRO[NOMBRE = 'PLANESBONOADICIONAL']/VALOR),";")
                    		return
                    		<Detail>{$plan}</Detail>
                    	}
                    	</PLANESBONOMIN>
                    	<HASUNLIMITEDCHOSEN>{
                    	  if(exists(data($input_Parameters1/PARAMETROS/PARAMETRO[NOMBRE = 'ELEGIDOSACTIVOS']/VALOR))) then data($input_Parameters1/PARAMETROS/PARAMETRO[NOMBRE = 'ELEGIDOSACTIVOS']/VALOR) else "false"   
                    	  
                    	}</HASUNLIMITEDCHOSEN>                     	
                    </PARAMETERS>
            
        </ns1:Input_Parameters>
};

declare variable $input_Parameters1 as element(ns0:Input_Parameters) external;

xf:consultarReglas_Req_consultarReglasTrama403Local($input_Parameters1)
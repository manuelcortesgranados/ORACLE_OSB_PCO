(:: pragma bea:global-element-parameter parameter="$input_Parameters1" element="ns1:Input_Parameters" location="../Schemas/PS_ITEL_CONSULTARREGLAS.xsd" ::)
(:: pragma bea:global-element-return element="ns0:Input_Parameters" location="../../../Trama402/Resources/Schemas/PS_ITEL_CONSULTARREGLASTRAMA402.xsd" ::)

declare namespace ns1 = "http://www.comcel.com.co/ConsultarReglas/";
declare namespace ns0 = "http://www.comcel.com.co/ConsultarReglasTrama402/";
declare namespace xf = "http://tempuri.org/ITEL/Core/Resources/XQueries/consultarReglasProvision_Req_CalcularProvTrama402Local/";

declare function xf:consultarReglasProvision_Req_CalcularProvTrama402Local($input_Parameters1 as element(ns1:Input_Parameters))
    as element(ns0:Input_Parameters) {
        <ns0:Input_Parameters>
            <HEADER>
                <METODO>{ data($input_Parameters1/METODO) }</METODO>
                <MINORIGEN>{ data($input_Parameters1/MIN_ORIGEN) }</MINORIGEN>
                <MINDESTINO>{ data($input_Parameters1/MIN_DESTINO) }</MINDESTINO>
            </HEADER>
            <PARAMETERS>
                	<COMENTARIO>{data($input_Parameters1/PARAMETROS/PARAMETRO[NOMBRE = 'COMENTARIO']/VALOR)}</COMENTARIO>
                	<HOSTID>{data($input_Parameters1/PARAMETROS/PARAMETRO[NOMBRE = 'HOSTID']/VALOR)}</HOSTID>
                	<CONSECUTIVO>{data($input_Parameters1/PARAMETROS/PARAMETRO[NOMBRE = 'CONSECUTIVO']/VALOR)}</CONSECUTIVO>
                	<MONTORECARGA>{data($input_Parameters1/PARAMETROS/PARAMETRO[NOMBRE = 'MONTORECARGA']/VALOR)}</MONTORECARGA>
                	<BONIFICACION>{data($input_Parameters1/PARAMETROS/PARAMETRO[NOMBRE = 'BONIFICAR']/VALOR)}</BONIFICACION>
                </PARAMETERS>
        </ns0:Input_Parameters>
};

declare variable $input_Parameters1 as element(ns1:Input_Parameters) external;

xf:consultarReglasProvision_Req_CalcularProvTrama402Local($input_Parameters1)
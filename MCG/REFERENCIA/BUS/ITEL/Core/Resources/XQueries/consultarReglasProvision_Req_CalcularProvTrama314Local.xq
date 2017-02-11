xquery version "1.0" encoding "UTF-8";
(:: pragma bea:global-element-parameter parameter="$input_Parameters1" element="ns1:Input_Parameters" location="../Schemas/PS_ITEL_CONSULTARREGLASPROVISION.xsd" ::)
(:: pragma bea:global-element-return element="ns2:Input_Parameters" location="../../../Trama314/Resources/Schemas/PS_ITEL_CALCULARPROVISIONTRAMA314.xsd" ::)

declare namespace xf = "http://tempuri.org/ITEL/Core/Resources/XQueries/consultarReglasProvision_Req_CalcularProvTrama314Local/";
declare namespace ns2 = "http://www.comcel.com.co/CalcularProvisionTrama314/";
declare namespace ns1 = "http://www.comcel.com.co/ConsultarReglasProvision/";
declare namespace ns4 = "http://www.comcel.com.co/OCS/OperacionCorbaOCS";
declare namespace ns3 = "http://www.comcel.com.co/IN/OperacionCorba";
declare namespace ns0 = "http://www.comcel.com.co/OCS/OperacionOCS_AIR";

declare function xf:consultarReglasProvision_Req_CalcularProvTrama314Local($input_Parameters1 as element(ns1:Input_Parameters))
    as element(ns2:Input_Parameters) {
        <ns2:Input_Parameters>
            <TRAMA>{ data($input_Parameters1/TRAMA) }</TRAMA>
            <METODO>{ data($input_Parameters1/METODO) }</METODO>
            <MIN>{ data($input_Parameters1/MIN_DESTINO) }</MIN>
            <MIN_ELEGIDOS>{ data($input_Parameters1/PARAMETROSNEGOCIO/PARAMETRO[NOMBRE='ELEGIDOSNRN']/VALOR) }</MIN_ELEGIDOS> 
            <MIN_ELEGIDOS_REEMPLAZAR>{ data($input_Parameters1/PARAMETROSNEGOCIO/PARAMETRO[NOMBRE='ELEGIDOSREEMPLAZARNRN']/VALOR) }</MIN_ELEGIDOS_REEMPLAZAR>
            <PARAMETERS>
            	<OFERTA>{ data($input_Parameters1/PARAMETROSTRAMA/PARAMETRO[NOMBRE='MONTORECARGA']/VALOR) }</OFERTA>
            	<VIGENCIA>0</VIGENCIA>
            	<CODIGO_COBRO>{ data($input_Parameters1/PARAMETROSTRAMA/PARAMETRO[NOMBRE='CONSECUTIVO']/VALOR) }</CODIGO_COBRO>
            	<USUARIO_ITEL>{ data($input_Parameters1/PARAMETROSTRAMA/PARAMETRO[NOMBRE='COMENTARIO']/VALOR) }</USUARIO_ITEL>
            	<CANTIDAD_MODIFICACION_ELEGIDOS>{ data($input_Parameters1/PARAMETROSNEGOCIO/PARAMETRO[NOMBRE='CANTIDAD_MODIFICACION_ELEGIDOS']/VALOR) }</CANTIDAD_MODIFICACION_ELEGIDOS>
            	<ESPOSTPAGO>{ data($input_Parameters1/PARAMETROSNEGOCIO/PARAMETRO[NOMBRE='ESPOSTPAGO']/VALOR) }</ESPOSTPAGO>
            	<ELEGIDOS_MODIFICADOS>{ data($input_Parameters1/PARAMETROSNEGOCIO/PARAMETRO[NOMBRE='ELEGIDOS_MODIFICADOS']/VALOR) }</ELEGIDOS_MODIFICADOS>
            	<FAF_TIPO>{ data($input_Parameters1/PARAMETROSNEGOCIO/PARAMETRO[NOMBRE='FAF_TIPO']/VALOR) }</FAF_TIPO>
            	<CAMBIOS_FNF>{ $input_Parameters1/PARAMETROSNEGOCIO/PARAMETRO[NOMBRE='CAMBIOS_FNF']/VALOR/text() }</CAMBIOS_FNF>
            </PARAMETERS>
            <SUSCRIPTOR>{ $input_Parameters1/SUSCRIPTORDESTINO/@*,$input_Parameters1/SUSCRIPTORDESTINO/node() }</SUSCRIPTOR>
            <SUSCRIPTOR_OCS>{ $input_Parameters1/SUSCRIPTOR_OCS/@*,$input_Parameters1/SUSCRIPTOR_OCS/node() }</SUSCRIPTOR_OCS>
            <CODIGOIN>{ data($input_Parameters1/IN_DESTINO) }</CODIGOIN>
            <TIEMPO>{ data($input_Parameters1/TIEMPO) }</TIEMPO>
        </ns2:Input_Parameters>
};

declare variable $input_Parameters1 as element(ns1:Input_Parameters) external;

xf:consultarReglasProvision_Req_CalcularProvTrama314Local($input_Parameters1)
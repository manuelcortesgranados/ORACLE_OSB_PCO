(:: pragma bea:global-element-parameter parameter="$input_Parameters1" element="ns0:Input_Parameters" location="../Schemas/PS_ITEL_CONSULTARREGLASPROVISION.xsd" ::)
(:: pragma bea:global-element-return element="ns1:Input_Parameters" location="../../../Trama704/Resources/Schemas/PS_ITEL_CALCULARPROVISIONTRAMA704.xsd" ::)

declare namespace ns1 = "http://www.comcel.com.co/CalcularProvisionTrama704/";
declare namespace ns0 = "http://www.comcel.com.co/ConsultarReglasProvision/";
declare namespace xf = "http://tempuri.org/ITEL/Core/Resources/XQueries/consultarReglasProvision_Req_CalcularProvTrama704Local/";

declare function xf:consultarReglasProvision_Req_CalcularProvTrama704Local($input_Parameters1 as element(ns0:Input_Parameters))
    as element(ns1:Input_Parameters) {
        <ns1:Input_Parameters>
            <TRAMA>{ data($input_Parameters1/TRAMA) }</TRAMA>
            <METODO>{ data($input_Parameters1/METODO) }</METODO>
            <MIN>{ data($input_Parameters1/MIN_DESTINO) }</MIN>
            <MIN_ELEGIDOS>{ data($input_Parameters1/PARAMETROSTRAMA/PARAMETRO[NOMBRE='HOSTID']/VALOR) }</MIN_ELEGIDOS>
            <PARAMETERS>
                <CODIGO_CUENTA>{ data($input_Parameters1/PARAMETROSTRAMA/PARAMETRO[NOMBRE='MONTORECARGA']/VALOR) }</CODIGO_CUENTA>
                <TIPO_ELIMINACION>{ data($input_Parameters1/PARAMETROSTRAMA/PARAMETRO[NOMBRE='BONIFICAR']/VALOR) }</TIPO_ELIMINACION>
                <ELIMINAR_TODOS>{ data($input_Parameters1/PARAMETROSTRAMA/PARAMETRO[NOMBRE='COMENTARIO']/VALOR) }</ELIMINAR_TODOS>
                <USUARIO_ITEL>{ data($input_Parameters1/PARAMETROSTRAMA/PARAMETRO[NOMBRE='CONSECUTIVO']/VALOR) }</USUARIO_ITEL>
                <FAFID>{ data($input_Parameters1/PARAMETROSNEGOCIO/PARAMETRO[NOMBRE='FAFID']/VALOR) }</FAFID>
            </PARAMETERS>
            <SUSCRIPTOR>{ $input_Parameters1/SUSCRIPTORDESTINO/@*,$input_Parameters1/SUSCRIPTORDESTINO/node() }</SUSCRIPTOR>
            <SUSCRIPTOR_OCS>{ $input_Parameters1/SUSCRIPTOR_OCS/@*,$input_Parameters1/SUSCRIPTOR_OCS/node() }</SUSCRIPTOR_OCS>
            <CODIGOIN>{ data($input_Parameters1/IN_DESTINO) }</CODIGOIN>
            <TIEMPO>{ data($input_Parameters1/TIEMPO) }</TIEMPO>
        </ns1:Input_Parameters>
};

declare variable $input_Parameters1 as element(ns0:Input_Parameters) external;

xf:consultarReglasProvision_Req_CalcularProvTrama704Local($input_Parameters1)
(:: pragma bea:global-element-parameter parameter="$input_Parameters1" element="ns0:Input_Parameters" location="../Schemas/PS_ITEL_AUDITORIA.xsd" ::)
(:: pragma bea:global-element-return element="ns0:Input_Parameters" location="../Schemas/MS_ITEL_AUDITORIAPROMOPAQUETESTAT.xsd" ::)

declare namespace ns0 = "http://www.comcel.com.co/AuditoriaITEL/";
declare namespace xf = "http://tempuri.org/ITEL_Auditoria/Resources/XQueries/enviarAuditoriaPromoPaquetesTAT_Req/";

declare function xf:enviarAuditoriaPromoPaquetesTAT_Req($input_Parameters1 as element(ns0:Input_Parameters))
    as element(ns0:Input_Parameters) {
        <ns0:Input_Parameters>
            <EVEMIN>{ data($input_Parameters1/MIN_DESTINO) }</EVEMIN>
            <EVECOMENTARIO>{ data($input_Parameters1/PARAMETROS_TRAMA/PARAMETRO[NOMBRE='COMENTARIO']/VALOR) }</EVECOMENTARIO>
            <EVEHOSTID>{ data($input_Parameters1/PARAMETROS_TRAMA/PARAMETRO[NOMBRE='HOSTID']/VALOR) }</EVEHOSTID>
            <EVECONSECUTIVO>{ data($input_Parameters1/PARAMETROS_TRAMA/PARAMETRO[NOMBRE='CONSECUTIVO']/VALOR) }</EVECONSECUTIVO>
            <EVECODIGOPAQUETE>{ data($input_Parameters1/PARAMETROS_TRAMA/PARAMETRO[NOMBRE='MONTORECARGA']/VALOR) }</EVECODIGOPAQUETE>
            <EVECOBRO>{ data($input_Parameters1/PARAMETROS_TRAMA/PARAMETRO[NOMBRE='DIASVIGENCIA']/VALOR) }</EVECOBRO>
            <EVEFECHARECARGA>{ data($input_Parameters1/FECHA_IN) }</EVEFECHARECARGA>
            <EVECODRESPUESTA>{ data($input_Parameters1/COD_RESPUESTA) }</EVECODRESPUESTA>
        </ns0:Input_Parameters>
};

declare variable $input_Parameters1 as element(ns0:Input_Parameters) external;

xf:enviarAuditoriaPromoPaquetesTAT_Req($input_Parameters1)
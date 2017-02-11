(:: pragma bea:global-element-parameter parameter="$input_Parameters1" element="ns0:Input_Parameters" location="../Schemas/PS_ITEL_AUDITORIA.xsd" ::)
(:: pragma bea:global-element-return element="ns0:Input_Parameters" location="../Schemas/MS_ITEL_AUDITORIAPROMOCINE.xsd" ::)

declare namespace ns0 = "http://www.comcel.com.co/AuditoriaITEL/";
declare namespace xf = "http://tempuri.org/ITEL_Auditoria/Resources/XQueries/enviarAuditoriaPromo_Req/";

declare function xf:enviarAuditoriaPromo_Req($input_Parameters1 as element(ns0:Input_Parameters))
    as element(ns0:Input_Parameters) {
        <ns0:Input_Parameters>
        	<EVEMIN>{ data($input_Parameters1/MIN_DESTINO) }</EVEMIN>
        	<EVERECARGA>{ data($input_Parameters1/PARAMETROS_TRAMA/PARAMETRO[NOMBRE='MONTORECARGA']/VALOR) }</EVERECARGA>
            <EVECONSECUTIVO>{ data($input_Parameters1/PARAMETROS_TRAMA/PARAMETRO[NOMBRE='CONSECUTIVO']/VALOR) }</EVECONSECUTIVO>
            <EVEFECHARECARGA>{ data($input_Parameters1/FECHA_IN) }</EVEFECHARECARGA>
            <EVEHOSTID>{ data($input_Parameters1/PARAMETROS_TRAMA/PARAMETRO[NOMBRE='HOSTID']/VALOR) }</EVEHOSTID>
        </ns0:Input_Parameters>
};

declare variable $input_Parameters1 as element(ns0:Input_Parameters) external;

xf:enviarAuditoriaPromo_Req($input_Parameters1)

(:: pragma bea:global-element-parameter parameter="$input_Parameters1" element="ns0:Input_Parameters" location="../Schemas/PS_ITEL_AUDITORIA.xsd" ::)
(:: pragma bea:global-element-return element="ns0:Input_Parameters" location="../Schemas/MS_ITEL_AUDITORIARECARGAESCALERA.xsd" ::)

declare namespace ns0 = "http://www.comcel.com.co/AuditoriaITEL/";
declare namespace xf = "http://tempuri.org/ITEL_Auditoria/Resources/XQueries/enviarAuditoriaRecargaEscalera_Req/";

declare function xf:enviarAuditoriaRecargaEscalera_Req($input_Parameters1 as element(ns0:Input_Parameters))
    as element(ns0:Input_Parameters) {
        <ns0:Input_Parameters>
        	<EVEMIN>{ data($input_Parameters1/MIN_DESTINO) }</EVEMIN>
        	{
        	if (data($input_Parameters1/METODO) = "407") then 
        	<EVERECARGA>{ "10000" }</EVERECARGA>
        	else
        	<EVERECARGA>{ data($input_Parameters1/PARAMETROS_TRAMA/PARAMETRO[NOMBRE='MONTORECARGA']/VALOR) }</EVERECARGA>
        	}
            <EVECONSECUTIVO>{ data($input_Parameters1/PARAMETROS_TRAMA/PARAMETRO[NOMBRE='CONSECUTIVO']/VALOR) }</EVECONSECUTIVO>
            <EVEFECHARECARGA>{ data($input_Parameters1/FECHA_IN) }</EVEFECHARECARGA>
            <EVEHOSTID>{ data($input_Parameters1/PARAMETROS_TRAMA/PARAMETRO[NOMBRE='HOSTID']/VALOR) }</EVEHOSTID>
        </ns0:Input_Parameters>
};

declare variable $input_Parameters1 as element(ns0:Input_Parameters) external;

xf:enviarAuditoriaRecargaEscalera_Req($input_Parameters1)
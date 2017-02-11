(:: pragma bea:global-element-parameter parameter="$input_Parameters1" element="ns0:Input_Parameters" location="../Schemas/PS_ITEL_AUDITORIA.xsd" ::)
(:: pragma bea:global-element-return element="ns0:Input_Parameters" location="../Schemas/MS_ITEL_AUDITORIARECARGARAR.xsd" ::)

declare namespace ns0 = "http://www.comcel.com.co/AuditoriaITEL/";
declare namespace xf = "http://tempuri.org/ITEL_Auditoria/Resources/XQueries/enviarAuditoriaRecargaRAR_Req/";

declare function xf:enviarAuditoriaRecargaRAR_Req($input_Parameters1 as element(ns0:Input_Parameters))
    as element(ns0:Input_Parameters) {
        <ns0:Input_Parameters>
        	<EVEMIN>{ data($input_Parameters1/MIN_DESTINO) }</EVEMIN>        	
        </ns0:Input_Parameters>
};

declare variable $input_Parameters1 as element(ns0:Input_Parameters) external;

xf:enviarAuditoriaRecargaRAR_Req($input_Parameters1)
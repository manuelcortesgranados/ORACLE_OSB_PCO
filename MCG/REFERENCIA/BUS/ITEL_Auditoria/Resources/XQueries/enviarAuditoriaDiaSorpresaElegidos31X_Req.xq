(:: pragma bea:global-element-parameter parameter="$input_Parameters1" element="ns1:Input_Parameters" location="../Schemas/PS_ITEL_AUDITORIA.xsd" ::)
(:: pragma bea:global-element-return element="ns0:Input_Parameters" location="../Schemas/MS_ITEL_AUDITORIADIASORPRESAELEGIDOS.xsd" ::)

declare namespace ns0 = "http://www.comcel.com.co/AuditoriaDiaSorpresaElegidosITEL/";
declare namespace ns1 = "http://www.comcel.com.co/AuditoriaITEL/";
declare namespace xf = "http://tempuri.org/ITEL_Auditoria/Resources/XQueries/enviarAuditoriaDiaSorpresaElegidos305_Req/";

declare function xf:enviarAuditoriaDiaSorpresaElegidos305_Req($input_Parameters1 as element(ns1:Input_Parameters))
    as element(ns0:Input_Parameters) {
        let $elegido := if(data($input_Parameters1/METODO) = ('310','313') ) then data($input_Parameters1/PARAMETROS_TRAMA/PARAMETRO[NOMBRE='MONTORECARGA']/VALOR)
        				else if(data($input_Parameters1/METODO) = '311' ) then data($input_Parameters1/PARAMETROS_TRAMA/PARAMETRO[NOMBRE='COMENTARIO']/VALOR)
                            						   else data($input_Parameters1/PARAMETROS_TRAMA/PARAMETRO[NOMBRE='HOSTID']/VALOR),
            $codigoCobro := if(data($input_Parameters1/METODO) = ('310','313') ) then data($input_Parameters1/PARAMETROS_TRAMA/PARAMETRO[NOMBRE='BONIFICAR']/VALOR)
            				else if(data($input_Parameters1/METODO) = '311' ) then data($input_Parameters1/PARAMETROS_TRAMA/PARAMETRO[NOMBRE='MONTORECARGA']/VALOR)
                                						else data($input_Parameters1/PARAMETROS_TRAMA/PARAMETRO[NOMBRE='CONSECUTIVO']/VALOR),
            $vigencia := if(data($input_Parameters1/METODO) = '313' ) then data($input_Parameters1/PARAMETROS_TRAMA/PARAMETRO[NOMBRE='DIASVIGENCIA']/VALOR)
                             						else "",
            $fafid := if(data($input_Parameters1/METODO) = '310' ) then data($input_Parameters1/PARAMETROS_NEGOCIO/PARAMETRO[NOMBRE='FAFID_FNF']/VALOR)
            		  else if(data($input_Parameters1/METODO) = ('311') ) then data($input_Parameters1/PARAMETROS_NEGOCIO/PARAMETRO[NOMBRE='FAFID']/VALOR)
					  else if(data($input_Parameters1/METODO) = '313' ) then data($input_Parameters1/PARAMETROS_NEGOCIO/PARAMETRO[NOMBRE='FAF_ID']/VALOR)            		  
                             						else data($input_Parameters1/PARAMETROS_TRAMA/PARAMETRO[NOMBRE='MONTORECARGA']/VALOR)                            						
        return    
            <ns0:Input_Parameters>
                <EVEMETODO>{ data($input_Parameters1/METODO) }</EVEMETODO>
                <EVEMIN>{ data($input_Parameters1/MIN_DESTINO) }</EVEMIN>
                <EVEELEGIDOS>
                	<PARAMETRO>
	                	<FAFID>{ $fafid }</FAFID>
	                	<MINELEG>{ $elegido }</MINELEG>
                	</PARAMETRO>
                </EVEELEGIDOS>
                <EVEFECHA>{ data($input_Parameters1/FECHA_IN) }</EVEFECHA>
				<EVECOBRO>{ $codigoCobro }</EVECOBRO>
				<EVEVIGENCIA>{ $vigencia }</EVEVIGENCIA>                
            </ns0:Input_Parameters>
         
};

declare variable $input_Parameters1 as element(ns1:Input_Parameters) external;

xf:enviarAuditoriaDiaSorpresaElegidos305_Req($input_Parameters1)

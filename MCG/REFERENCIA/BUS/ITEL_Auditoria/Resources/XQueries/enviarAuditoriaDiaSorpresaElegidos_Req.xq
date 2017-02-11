(:: pragma bea:global-element-parameter parameter="$input_Parameters1" element="ns1:Input_Parameters" location="../Schemas/PS_ITEL_AUDITORIA.xsd" ::)
(:: pragma bea:global-element-return element="ns0:Input_Parameters" location="../Schemas/MS_ITEL_AUDITORIADIASORPRESAELEGIDOS.xsd" ::)

declare namespace ns0 = "http://www.comcel.com.co/AuditoriaDiaSorpresaElegidosITEL/";
declare namespace ns1 = "http://www.comcel.com.co/AuditoriaITEL/";
declare namespace xf = "http://tempuri.org/ITEL_Auditoria/Resources/XQueries/enviarAuditoriaDiaSorpresaElegidos_Req/";

declare function xf:enviarAuditoriaDiaSorpresaElegidos_Req($input_Parameters1 as element(ns1:Input_Parameters))
    as element(ns0:Input_Parameters) {
        let $elegido := if(data($input_Parameters1/METODO) = '307' ) then data($input_Parameters1/PARAMETROS_TRAMA/PARAMETRO[NOMBRE='MONTORECARGA']/VALOR)
                            						   else data($input_Parameters1/PARAMETROS_TRAMA/PARAMETRO[NOMBRE='HOSTID']/VALOR),
            $codigoCobro := if(data($input_Parameters1/METODO) = '304' ) then () 
                                						else if(data($input_Parameters1/METODO) = '307' ) then data($input_Parameters1/PARAMETROS_TRAMA/PARAMETRO[NOMBRE='BONIFICAR']/VALOR)
                                						else data($input_Parameters1/PARAMETROS_TRAMA/PARAMETRO[NOMBRE='MONTORECARGA']/VALOR),
            $vigencia := if(data($input_Parameters1/METODO) = '304' ) then () 
                             						else if(data($input_Parameters1/METODO) = '308' ) then data($input_Parameters1/PARAMETROS_TRAMA/PARAMETRO[NOMBRE='VIGENCIA']/VALOR)
                             						else data($input_Parameters1/PARAMETROS_TRAMA/PARAMETRO[NOMBRE='DIASVIGENCIA']/VALOR)
        return
            <ns0:Input_Parameters>
                <EVEMETODO>{ data($input_Parameters1/METODO) }</EVEMETODO>
                <EVEMIN>{ data($input_Parameters1/MIN_DESTINO) }</EVEMIN>
                <EVEELEGIDOS>
                	<PARAMETRO>
	                	<FAFID>{ data($input_Parameters1/PARAMETROS_NEGOCIO/PARAMETRO[NOMBRE='FAFID']/VALOR) }</FAFID>
	                	<MINELEG>{ $elegido }</MINELEG>
                	</PARAMETRO>
                </EVEELEGIDOS>
                <EVEFECHA>{ data($input_Parameters1/FECHA_IN) }</EVEFECHA>
				<EVECOBRO>{ $codigoCobro }</EVECOBRO>
				<EVEVIGENCIA>{ $vigencia }</EVEVIGENCIA>                
            </ns0:Input_Parameters>
         
};

declare variable $input_Parameters1 as element(ns1:Input_Parameters) external;

xf:enviarAuditoriaDiaSorpresaElegidos_Req($input_Parameters1)

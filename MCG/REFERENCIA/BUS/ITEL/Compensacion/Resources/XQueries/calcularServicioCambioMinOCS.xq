(:: pragma bea:global-element-parameter parameter="$input_Parameters1" element="ns1:Input_Parameters" location="../Schemas/PS_ITEL_COMPENSACION.xsd" ::)
(:: pragma bea:global-element-return element="ns1:Input_Parameters" location="../Schemas/PS_ITEL_COMPENSACION.xsd" ::)

declare namespace ns1 = "http://www.comcel.com.co/CompensacionITEL/";
declare namespace ns0 = "http://www.comcel.com.co/IN/OperacionCorba";
declare namespace xf = "http://tempuri.org/ITEL/Compensacion/Resources/XQueries/calcularServicioCambioMinOCS/";

declare function xf:calcularServicioCambioMinOCS($input_Parameters1 as element(ns1:Input_Parameters))
    as element(ns1:Input_Parameters) {
        <ns1:Input_Parameters>
            <METODO>{ data($input_Parameters1/METODO) }</METODO>
            <SUSCRIPTOR_DESTINO>{ $input_Parameters1/SUSCRIPTOR_DESTINO/@* , $input_Parameters1/SUSCRIPTOR_DESTINO/node() }</SUSCRIPTOR_DESTINO>
            {
                for $SUSCRIPTOR_ORIGEN in $input_Parameters1/SUSCRIPTOR_ORIGEN
                return
                    <SUSCRIPTOR_ORIGEN>{ $SUSCRIPTOR_ORIGEN/@* , $SUSCRIPTOR_ORIGEN/node() }</SUSCRIPTOR_ORIGEN>
            }
            <SERVICIOS_EJECUTADOS>{ 
            	if(contains($input_Parameters1/SERVICIOS_EJECUTADOS, "crearSuscriptorOCSLocal_PS") 
            	and (data($input_Parameters1/SUSCRIPTOR_DESTINO/*:CUSTOMERID)!="" 
            	and not(contains($input_Parameters1/SERVICIOS_EJECUTADOS, "eliminarSuscriptorINLocal_PS")))
            	or (data($input_Parameters1/SUSCRIPTOR_OCS/*:MIN) !=""
            		and not(contains($input_Parameters1/SERVICIOS_EJECUTADOS, "eliminarSuscriptorOCSLocal_PS")))            	
            	)
            	then (
            			<SERVICIO>
				            	<NOMBRE>generalCancellation</NOMBRE>
				            			<PARAMETROS>
				            				<PARAMETRO>
				            					<NOMBRE>REQUESTID</NOMBRE>
				            					<VALOR>0</VALOR>
				            				</PARAMETRO>
				            				<PARAMETRO>
				            					<NOMBRE>MSISDN</NOMBRE>
				            					<VALOR>{ concat(57,data($input_Parameters1/SERVICIOS_EJECUTADOS/SERVICIO/PARAMETROS/PARAMETRO[NOMBRE="SUSCRIPTOR"]/VALOR/*:DirectoryNumber)) }</VALOR>
				            				</PARAMETRO>
				            				<PARAMETRO>
				            					<NOMBRE>PRODUCTNAME</NOMBRE>
				            					<VALOR>generalCancellation</VALOR>
				            				</PARAMETRO>
				            				<PARAMETRO>
				            					<NOMBRE>SUBSCRIBERID</NOMBRE>
				            					<VALOR>0</VALOR>
				            				</PARAMETRO>
				            	</PARAMETROS>
				        	</SERVICIO>,
            		for $servicio in $input_Parameters1/SERVICIOS_EJECUTADOS/SERVICIO
            			where contains($servicio, "crearSuscriptorOCSLocal_PS")
            			return $servicio
            	)            	
            	else (
	            		if(contains($input_Parameters1/SERVICIOS_EJECUTADOS, "cambiarMinINLocal_PS") and
	            		not(contains($input_Parameters1/SERVICIOS_EJECUTADOS, "eliminarSuscriptorOCSLocal_PS")))
	            		then(
		            		for $servicio in $input_Parameters1/SERVICIOS_EJECUTADOS
		            			where contains($servicio, "cambiarMinINLocal_PS")
		            			return
				            		<SERVICIO>
				            			<NOMBRE>ITEL/IN/Proxies/crearSuscriptorINLocal_PS</NOMBRE>
				            			<PARAMETROS>
				            				<PARAMETRO>
				            					<NOMBRE>PREFIJO</NOMBRE>
				            					<VALOR>{  data($servicio/SERVICIO/PARAMETROS/PARAMETRO[NOMBRE="PREFIX"]/VALOR) }</VALOR>
				            				</PARAMETRO>
				            				<PARAMETRO>
				            					<NOMBRE>MIN</NOMBRE>
				            					<VALOR>{  data($servicio/SERVICIO/PARAMETROS/PARAMETRO[NOMBRE="MIN"]/VALOR) }</VALOR>
				            				</PARAMETRO>
				            				<PARAMETRO>
				            					<NOMBRE>IN</NOMBRE>
				            					<VALOR>{ fn:tokenize(data($servicio/SERVICIO/PARAMETROS/PARAMETRO[NOMBRE="IN"]/VALOR),";")[1] }</VALOR>
				            				</PARAMETRO>
				            			</PARAMETROS>
				            		</SERVICIO>
			       )else()
		            
            	) 
            }</SERVICIOS_EJECUTADOS>
            {
                for $BALANCES in $input_Parameters1/BALANCES
                return
                    <BALANCES>{ $BALANCES/@* , $BALANCES/node() }</BALANCES>
            }
            {
                for $BALANCES_ANTERIOR in $input_Parameters1/BALANCES_ANTERIOR
                return
                    <BALANCES_ANTERIOR>{ $BALANCES_ANTERIOR/@* , $BALANCES_ANTERIOR/node() }</BALANCES_ANTERIOR>
            }
            {
                for $SUSCRIPTOR_OCS in $input_Parameters1/SUSCRIPTOR_OCS
                return
                    <SUSCRIPTOR_OCS>{ $SUSCRIPTOR_OCS/@* , $SUSCRIPTOR_OCS/node() }</SUSCRIPTOR_OCS>
            }
        </ns1:Input_Parameters>
};

declare variable $input_Parameters1 as element(ns1:Input_Parameters) external;

xf:calcularServicioCambioMinOCS($input_Parameters1)
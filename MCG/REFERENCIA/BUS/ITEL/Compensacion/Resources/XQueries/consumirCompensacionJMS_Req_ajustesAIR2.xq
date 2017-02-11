(:: pragma bea:local-element-parameter parameter="$servicio" type="ns1:Input_Parameters/SERVICIOS_EJECUTADOS/SERVICIO" location="../Schemas/PS_ITEL_COMPENSACION.xsd" ::)
(:: pragma  parameter="$balances" type="anyType" ::)
(:: pragma bea:local-element-parameter parameter="$balancesAnterior" type="ns1:Input_Parameters/BALANCES_ANTERIOR" location="../Schemas/PS_ITEL_COMPENSACION.xsd" ::)
(:: pragma bea:global-element-return element="ns0:Input_Parameters" location="../../../OCS/AIR/Resources/Schemas/PS_ITEL_ACTUALIZAR_BALANCE_FECHA.xsd" ::)

declare namespace ns1 = "http://www.comcel.com.co/CompensacionITEL/";
declare namespace ns0 = "http://www.comcel.com.co/ActualizarBalanceFechaOCS/";
declare namespace xf = "http://tempuri.org/ITEL/Compensacion/Resources/XQueries/consumirCompensacionJMS_Req_ajustesAIR2/";

declare function xf:consumirCompensacionJMS_Req_ajustesAIR2($servicio as element())
    as element(ns0:Input_Parameters) {
		    
        <ns0:Input_Parameters>
            <TIPO_NODO>{ data($servicio/PARAMETROS/PARAMETRO[NOMBRE='TIPO_NODO']/VALOR) }</TIPO_NODO>
            <HOST_ORIGEN>{ data($servicio/PARAMETROS/PARAMETRO[NOMBRE='HOST_ORIGEN']/VALOR) }</HOST_ORIGEN>
            <ID_TRANSACCION>{ data($servicio/PARAMETROS/PARAMETRO[NOMBRE='ID_TRANSACCION']/VALOR) }</ID_TRANSACCION>
            <FECHA_TRANSACCION>{ data($servicio/PARAMETROS/PARAMETRO[NOMBRE='FECHA_TRANSACCION']/VALOR) }</FECHA_TRANSACCION>
            <MIN>{ data($servicio/PARAMETROS/PARAMETRO[NOMBRE='MIN']/VALOR) }</MIN>
            <MONEDA>{ data($servicio/PARAMETROS/PARAMETRO[NOMBRE='MONEDA']/VALOR) }</MONEDA>
            <HOSTID>{ data($servicio/PARAMETROS/PARAMETRO[NOMBRE='HOSTID']/VALOR) }</HOSTID>
            <COMENTARIO>{ data($servicio/PARAMETROS/PARAMETRO[NOMBRE='COMENTARIO']/VALOR) }</COMENTARIO>
            
            {
            if( exists($servicio/PARAMETROS/PARAMETRO[NOMBRE='VALOR_RELATIVO1']/VALOR) ) then
            	<VALOR_RELATIVO1>{ xs:integer(data($servicio/PARAMETROS/PARAMETRO[NOMBRE='VALOR_RELATIVO1']/VALOR) * -1) }</VALOR_RELATIVO1>
            else (),
            if( exists($servicio/PARAMETROS/PARAMETRO[NOMBRE='VALOR_ABSOLUTO1']/VALOR) ) then
            	<VALOR_ABSOLUTO1>{ data($servicio/PARAMETROS/PARAMETRO[NOMBRE='VALOR_ABSOLUTO1']/VALOR) }</VALOR_ABSOLUTO1>
            else (),
            if( exists($servicio/PARAMETROS/PARAMETRO[NOMBRE='FECHA_EXPIRACION_RELATIVA1']/VALOR) ) then
            	<FECHA_EXPIRACION_RELATIVA1>{ xs:integer(data($servicio/PARAMETROS/PARAMETRO[NOMBRE='FECHA_EXPIRACION_RELATIVA1']/VALOR) * -1) }</FECHA_EXPIRACION_RELATIVA1>
            else (),
            
            if( exists($servicio/PARAMETROS/PARAMETRO[NOMBRE='ID_CUENTA_DEDICADA1']/VALOR) ) then
            	<ID_CUENTA_DEDICADA1>{ data($servicio/PARAMETROS/PARAMETRO[NOMBRE='ID_CUENTA_DEDICADA1']/VALOR) }</ID_CUENTA_DEDICADA1>
            else (),
            if( exists($servicio/PARAMETROS/PARAMETRO[NOMBRE='UNIT_TYPE_CUENTA_DEDICADA1']/VALOR) ) then
            	<UNIT_TYPE_CUENTA_DEDICADA1>{ data($servicio/PARAMETROS/PARAMETRO[NOMBRE='UNIT_TYPE_CUENTA_DEDICADA1']/VALOR) }</UNIT_TYPE_CUENTA_DEDICADA1>
            else (),
            
            if( exists($servicio/PARAMETROS/PARAMETRO[NOMBRE='VALOR_RELATIVO2']/VALOR) ) then
            	<VALOR_RELATIVO2>{ xs:integer(data($servicio/PARAMETROS/PARAMETRO[NOMBRE='VALOR_RELATIVO2']/VALOR)* -1) }</VALOR_RELATIVO2>
            else (),
            if( exists($servicio/PARAMETROS/PARAMETRO[NOMBRE='VALOR_ABSOLUTO2']/VALOR) ) then
            	<VALOR_ABSOLUTO2>{ data($servicio/PARAMETROS/PARAMETRO[NOMBRE='VALOR_ABSOLUTO2']/VALOR) }</VALOR_ABSOLUTO2>
            else (),
            if( exists($servicio/PARAMETROS/PARAMETRO[NOMBRE='FECHA_EXPIRACION_RELATIVA2']/VALOR) ) then
            	<FECHA_EXPIRACION_RELATIVA2>{ xs:integer(data($servicio/PARAMETROS/PARAMETRO[NOMBRE='FECHA_EXPIRACION_RELATIVA2']/VALOR) * -1) }</FECHA_EXPIRACION_RELATIVA2>
            else (),
            if( exists($servicio/PARAMETROS/PARAMETRO[NOMBRE='ID_CUENTA_DEDICADA2']/VALOR) ) then
            	<ID_CUENTA_DEDICADA2>{ data($servicio/PARAMETROS/PARAMETRO[NOMBRE='ID_CUENTA_DEDICADA2']/VALOR) }</ID_CUENTA_DEDICADA2>
            else (),
            if( exists($servicio/PARAMETROS/PARAMETRO[NOMBRE='UNIT_TYPE_CUENTA_DEDICADA2']/VALOR) ) then
            	<UNIT_TYPE_CUENTA_DEDICADA2>{ data($servicio/PARAMETROS/PARAMETRO[NOMBRE='UNIT_TYPE_CUENTA_DEDICADA2']/VALOR) }</UNIT_TYPE_CUENTA_DEDICADA2>
            else (),
            
            if( exists($servicio/PARAMETROS/PARAMETRO[NOMBRE='VALOR_RELATIVO3']/VALOR) ) then
            	<VALOR_RELATIVO3>{ xs:integer(data($servicio/PARAMETROS/PARAMETRO[NOMBRE='VALOR_RELATIVO3']/VALOR)* -1) }</VALOR_RELATIVO3>
            else (),
            if( exists($servicio/PARAMETROS/PARAMETRO[NOMBRE='VALOR_ABSOLUTO3']/VALOR) ) then
            	<VALOR_ABSOLUTO3>{ data($servicio/PARAMETROS/PARAMETRO[NOMBRE='VALOR_ABSOLUTO3']/VALOR) }</VALOR_ABSOLUTO3>
            else (),
            if( exists($servicio/PARAMETROS/PARAMETRO[NOMBRE='FECHA_EXPIRACION_RELATIVA3']/VALOR) ) then
            	<FECHA_EXPIRACION_RELATIVA3>{ xs:integer(data($servicio/PARAMETROS/PARAMETRO[NOMBRE='FECHA_EXPIRACION_RELATIVA3']/VALOR) * -1) }</FECHA_EXPIRACION_RELATIVA3>
            else (),
            if( exists($servicio/PARAMETROS/PARAMETRO[NOMBRE='ID_CUENTA_DEDICADA3']/VALOR) ) then
            	<ID_CUENTA_DEDICADA3>{ data($servicio/PARAMETROS/PARAMETRO[NOMBRE='ID_CUENTA_DEDICADA3']/VALOR) }</ID_CUENTA_DEDICADA3>
            else (),
            if( exists($servicio/PARAMETROS/PARAMETRO[NOMBRE='UNIT_TYPE_CUENTA_DEDICADA3']/VALOR) ) then
            	<UNIT_TYPE_CUENTA_DEDICADA3>{ data($servicio/PARAMETROS/PARAMETRO[NOMBRE='UNIT_TYPE_CUENTA_DEDICADA3']/VALOR) }</UNIT_TYPE_CUENTA_DEDICADA3>
            else (),
            
            
            if( exists($servicio/PARAMETROS/PARAMETRO[NOMBRE='VALOR_RELATIVO4']/VALOR) ) then
            	<VALOR_RELATIVO4>{ xs:integer(data($servicio/PARAMETROS/PARAMETRO[NOMBRE='VALOR_RELATIVO4']/VALOR)* -1) }</VALOR_RELATIVO4>
            else (),
            if( exists($servicio/PARAMETROS/PARAMETRO[NOMBRE='VALOR_ABSOLUTO4']/VALOR) ) then
            	<VALOR_ABSOLUTO4>{ data($servicio/PARAMETROS/PARAMETRO[NOMBRE='VALOR_ABSOLUTO4']/VALOR) }</VALOR_ABSOLUTO4>
            else (),
            if( exists($servicio/PARAMETROS/PARAMETRO[NOMBRE='FECHA_EXPIRACION_RELATIVA4']/VALOR) ) then
            	<FECHA_EXPIRACION_RELATIVA4>{ xs:integer(data($servicio/PARAMETROS/PARAMETRO[NOMBRE='FECHA_EXPIRACION_RELATIVA4']/VALOR) * -1) }</FECHA_EXPIRACION_RELATIVA4>
            else (),
            if( exists($servicio/PARAMETROS/PARAMETRO[NOMBRE='ID_CUENTA_DEDICADA4']/VALOR) ) then
            	<ID_CUENTA_DEDICADA4>{ data($servicio/PARAMETROS/PARAMETRO[NOMBRE='ID_CUENTA_DEDICADA4']/VALOR) }</ID_CUENTA_DEDICADA4>
            else (),
            if( exists($servicio/PARAMETROS/PARAMETRO[NOMBRE='UNIT_TYPE_CUENTA_DEDICADA4']/VALOR) ) then
            	<UNIT_TYPE_CUENTA_DEDICADA4>{ data($servicio/PARAMETROS/PARAMETRO[NOMBRE='UNIT_TYPE_CUENTA_DEDICADA4']/VALOR) }</UNIT_TYPE_CUENTA_DEDICADA4>
            else (),
            
            if( exists($servicio/PARAMETROS/PARAMETRO[NOMBRE='VALOR_RELATIVO5']/VALOR) ) then
            	<VALOR_RELATIVO5>{ xs:integer(data($servicio/PARAMETROS/PARAMETRO[NOMBRE='VALOR_RELATIVO5']/VALOR)* -1) }</VALOR_RELATIVO5>
            else (),
            if( exists($servicio/PARAMETROS/PARAMETRO[NOMBRE='VALOR_ABSOLUTO5']/VALOR) ) then
            	<VALOR_ABSOLUTO5>{ data($servicio/PARAMETROS/PARAMETRO[NOMBRE='VALOR_ABSOLUTO5']/VALOR) }</VALOR_ABSOLUTO5>
            else (),
            if( exists($servicio/PARAMETROS/PARAMETRO[NOMBRE='FECHA_EXPIRACION_RELATIVA5']/VALOR) ) then
            	<FECHA_EXPIRACION_RELATIVA5>{ xs:integer(data($servicio/PARAMETROS/PARAMETRO[NOMBRE='FECHA_EXPIRACION_RELATIVA5']/VALOR) * -1) }</FECHA_EXPIRACION_RELATIVA5>
            else (),
            if( exists($servicio/PARAMETROS/PARAMETRO[NOMBRE='ID_CUENTA_DEDICADA5']/VALOR) ) then
            	<ID_CUENTA_DEDICADA5>{ data($servicio/PARAMETROS/PARAMETRO[NOMBRE='ID_CUENTA_DEDICADA5']/VALOR) }</ID_CUENTA_DEDICADA5>
            else (),
            if( exists($servicio/PARAMETROS/PARAMETRO[NOMBRE='UNIT_TYPE_CUENTA_DEDICADA5']/VALOR) ) then
            	<UNIT_TYPE_CUENTA_DEDICADA5>{ data($servicio/PARAMETROS/PARAMETRO[NOMBRE='UNIT_TYPE_CUENTA_DEDICADA5']/VALOR) }</UNIT_TYPE_CUENTA_DEDICADA5>
            else (),
            
            if( exists($servicio/PARAMETROS/PARAMETRO[NOMBRE='VALOR_RELATIVO6']/VALOR) ) then
            	<VALOR_RELATIVO6>{ xs:integer(data($servicio/PARAMETROS/PARAMETRO[NOMBRE='VALOR_RELATIVO6']/VALOR)* -1) }</VALOR_RELATIVO6>
            else (),
            if( exists($servicio/PARAMETROS/PARAMETRO[NOMBRE='VALOR_ABSOLUTO6']/VALOR) ) then
            	<VALOR_ABSOLUTO6>{ data($servicio/PARAMETROS/PARAMETRO[NOMBRE='VALOR_ABSOLUTO6']/VALOR) }</VALOR_ABSOLUTO6>
            else (),
            if( exists($servicio/PARAMETROS/PARAMETRO[NOMBRE='FECHA_EXPIRACION_RELATIVA6']/VALOR) ) then
            	<FECHA_EXPIRACION_RELATIVA6>{ xs:integer(data($servicio/PARAMETROS/PARAMETRO[NOMBRE='FECHA_EXPIRACION_RELATIVA6']/VALOR) * -1) }</FECHA_EXPIRACION_RELATIVA6>
            else (),
            if( exists($servicio/PARAMETROS/PARAMETRO[NOMBRE='ID_CUENTA_DEDICADA6']/VALOR) ) then
            	<ID_CUENTA_DEDICADA6>{ data($servicio/PARAMETROS/PARAMETRO[NOMBRE='ID_CUENTA_DEDICADA6']/VALOR) }</ID_CUENTA_DEDICADA6>
            else (),
            if( exists($servicio/PARAMETROS/PARAMETRO[NOMBRE='UNIT_TYPE_CUENTA_DEDICADA6']/VALOR) ) then
            	<UNIT_TYPE_CUENTA_DEDICADA6>{ data($servicio/PARAMETROS/PARAMETRO[NOMBRE='UNIT_TYPE_CUENTA_DEDICADA6']/VALOR) }</UNIT_TYPE_CUENTA_DEDICADA6>
            else (),
            
            if( exists($servicio/PARAMETROS/PARAMETRO[NOMBRE='VALOR_RELATIVO7']/VALOR) ) then
            	<VALOR_RELATIVO7>{ xs:integer(data($servicio/PARAMETROS/PARAMETRO[NOMBRE='VALOR_RELATIVO7']/VALOR)* -1) }</VALOR_RELATIVO7>
            else (),
            if( exists($servicio/PARAMETROS/PARAMETRO[NOMBRE='VALOR_ABSOLUTO7']/VALOR) ) then
            	<VALOR_ABSOLUTO7>{ data($servicio/PARAMETROS/PARAMETRO[NOMBRE='VALOR_ABSOLUTO7']/VALOR) }</VALOR_ABSOLUTO7>
            else (),
            if( exists($servicio/PARAMETROS/PARAMETRO[NOMBRE='FECHA_EXPIRACION_RELATIVA7']/VALOR) ) then
            	<FECHA_EXPIRACION_RELATIVA7>{ xs:integer(data($servicio/PARAMETROS/PARAMETRO[NOMBRE='FECHA_EXPIRACION_RELATIVA7']/VALOR) * -1) }</FECHA_EXPIRACION_RELATIVA7>
            else (),
            if( exists($servicio/PARAMETROS/PARAMETRO[NOMBRE='ID_CUENTA_DEDICADA7']/VALOR) ) then
            	<ID_CUENTA_DEDICADA7>{ data($servicio/PARAMETROS/PARAMETRO[NOMBRE='ID_CUENTA_DEDICADA7']/VALOR) }</ID_CUENTA_DEDICADA7>
            else (),
            if( exists($servicio/PARAMETROS/PARAMETRO[NOMBRE='UNIT_TYPE_CUENTA_DEDICADA7']/VALOR) ) then
            	<UNIT_TYPE_CUENTA_DEDICADA7>{ data($servicio/PARAMETROS/PARAMETRO[NOMBRE='UNIT_TYPE_CUENTA_DEDICADA7']/VALOR) }</UNIT_TYPE_CUENTA_DEDICADA7>
            else (),
            
            if( exists($servicio/PARAMETROS/PARAMETRO[NOMBRE='VALOR_RELATIVO8']/VALOR) ) then
            	<VALOR_RELATIVO8>{ xs:integer(data($servicio/PARAMETROS/PARAMETRO[NOMBRE='VALOR_RELATIVO8']/VALOR)* -1) }</VALOR_RELATIVO8>
            else (),
            if( exists($servicio/PARAMETROS/PARAMETRO[NOMBRE='VALOR_ABSOLUTO8']/VALOR) ) then
            	<VALOR_ABSOLUTO8>{ data($servicio/PARAMETROS/PARAMETRO[NOMBRE='VALOR_ABSOLUTO8']/VALOR) }</VALOR_ABSOLUTO8>
            else (),
            if( exists($servicio/PARAMETROS/PARAMETRO[NOMBRE='FECHA_EXPIRACION_RELATIVA8']/VALOR) ) then
            	<FECHA_EXPIRACION_RELATIVA8>{ xs:integer(data($servicio/PARAMETROS/PARAMETRO[NOMBRE='FECHA_EXPIRACION_RELATIVA8']/VALOR) * -1) }</FECHA_EXPIRACION_RELATIVA8>
            else (),
            if( exists($servicio/PARAMETROS/PARAMETRO[NOMBRE='ID_CUENTA_DEDICADA8']/VALOR) ) then
            	<ID_CUENTA_DEDICADA8>{ data($servicio/PARAMETROS/PARAMETRO[NOMBRE='ID_CUENTA_DEDICADA8']/VALOR) }</ID_CUENTA_DEDICADA8>
            else (),
            if( exists($servicio/PARAMETROS/PARAMETRO[NOMBRE='UNIT_TYPE_CUENTA_DEDICADA8']/VALOR) ) then
            	<UNIT_TYPE_CUENTA_DEDICADA8>{ data($servicio/PARAMETROS/PARAMETRO[NOMBRE='UNIT_TYPE_CUENTA_DEDICADA8']/VALOR) }</UNIT_TYPE_CUENTA_DEDICADA8>
            else (),
            
            if( exists($servicio/PARAMETROS/PARAMETRO[NOMBRE='VALOR_RELATIVO9']/VALOR) ) then
            	<VALOR_RELATIVO9>{ xs:integer(data($servicio/PARAMETROS/PARAMETRO[NOMBRE='VALOR_RELATIVO9']/VALOR)* -1) }</VALOR_RELATIVO9>
            else (),
            if( exists($servicio/PARAMETROS/PARAMETRO[NOMBRE='VALOR_ABSOLUTO9']/VALOR) ) then
            	<VALOR_ABSOLUTO9>{ data($servicio/PARAMETROS/PARAMETRO[NOMBRE='VALOR_ABSOLUTO9']/VALOR) }</VALOR_ABSOLUTO9>
            else (),
            if( exists($servicio/PARAMETROS/PARAMETRO[NOMBRE='FECHA_EXPIRACION_RELATIVA9']/VALOR) ) then
            	<FECHA_EXPIRACION_RELATIVA9>{ xs:integer(data($servicio/PARAMETROS/PARAMETRO[NOMBRE='FECHA_EXPIRACION_RELATIVA9']/VALOR) * -1) }</FECHA_EXPIRACION_RELATIVA9>
            else (),
            if( exists($servicio/PARAMETROS/PARAMETRO[NOMBRE='ID_CUENTA_DEDICADA9']/VALOR) ) then
            	<ID_CUENTA_DEDICADA9>{ data($servicio/PARAMETROS/PARAMETRO[NOMBRE='ID_CUENTA_DEDICADA9']/VALOR) }</ID_CUENTA_DEDICADA9>
            else (),
            if( exists($servicio/PARAMETROS/PARAMETRO[NOMBRE='UNIT_TYPE_CUENTA_DEDICADA9']/VALOR) ) then
            	<UNIT_TYPE_CUENTA_DEDICADA9>{ data($servicio/PARAMETROS/PARAMETRO[NOMBRE='UNIT_TYPE_CUENTA_DEDICADA9']/VALOR) }</UNIT_TYPE_CUENTA_DEDICADA9>
            else (),
            
            if( exists($servicio/PARAMETROS/PARAMETRO[NOMBRE='VALOR_RELATIVO10']/VALOR) ) then
            	<VALOR_RELATIVO10>{ xs:integer(data($servicio/PARAMETROS/PARAMETRO[NOMBRE='VALOR_RELATIVO10']/VALOR)* -1) }</VALOR_RELATIVO10>
            else (),
            if( exists($servicio/PARAMETROS/PARAMETRO[NOMBRE='VALOR_ABSOLUTO10']/VALOR) ) then
            	<VALOR_ABSOLUTO10>{ data($servicio/PARAMETROS/PARAMETRO[NOMBRE='VALOR_ABSOLUTO10']/VALOR) }</VALOR_ABSOLUTO10>
            else (),
            if( exists($servicio/PARAMETROS/PARAMETRO[NOMBRE='FECHA_EXPIRACION_RELATIVA10']/VALOR) ) then
            	<FECHA_EXPIRACION_RELATIVA10>{ xs:integer(data($servicio/PARAMETROS/PARAMETRO[NOMBRE='FECHA_EXPIRACION_RELATIVA10']/VALOR) * -1) }</FECHA_EXPIRACION_RELATIVA10>
            else (),
            if( exists($servicio/PARAMETROS/PARAMETRO[NOMBRE='ID_CUENTA_DEDICADA10']/VALOR) ) then
            	<ID_CUENTA_DEDICADA10>{ data($servicio/PARAMETROS/PARAMETRO[NOMBRE='ID_CUENTA_DEDICADA10']/VALOR) }</ID_CUENTA_DEDICADA10>
            else (),
            if( exists($servicio/PARAMETROS/PARAMETRO[NOMBRE='UNIT_TYPE_CUENTA_DEDICADA10']/VALOR) ) then
            	<UNIT_TYPE_CUENTA_DEDICADA10>{ data($servicio/PARAMETROS/PARAMETRO[NOMBRE='UNIT_TYPE_CUENTA_DEDICADA10']/VALOR) }</UNIT_TYPE_CUENTA_DEDICADA10>
            else ()
         
	        }
        </ns0:Input_Parameters>
};

declare variable $servicio as element() external;

xf:consumirCompensacionJMS_Req_ajustesAIR2($servicio)

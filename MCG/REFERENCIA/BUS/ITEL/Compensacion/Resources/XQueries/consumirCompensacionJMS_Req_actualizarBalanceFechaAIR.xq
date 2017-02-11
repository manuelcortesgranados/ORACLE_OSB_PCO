(:: pragma bea:local-element-parameter parameter="$servicio" type="ns1:Input_Parameters/SERVICIOS_EJECUTADOS/SERVICIO" location="../Schemas/PS_ITEL_COMPENSACION.xsd" ::)
(:: pragma  parameter="$balances" type="anyType" ::)
(:: pragma bea:local-element-parameter parameter="$balancesAnterior" type="ns1:Input_Parameters/BALANCES_ANTERIOR" location="../Schemas/PS_ITEL_COMPENSACION.xsd" ::)
(:: pragma bea:global-element-return element="ns0:Input_Parameters" location="../../../OCS/AIR/Resources/Schemas/PS_ITEL_ACTUALIZAR_BALANCE_FECHA.xsd" ::)

declare namespace ns1 = "http://www.comcel.com.co/CompensacionITEL/";
declare namespace ns0 = "http://www.comcel.com.co/ActualizarBalanceFechaOCS/";
declare namespace xf = "http://tempuri.org/ITEL/Compensacion/Resources/XQueries/consumirCompensacionJMS_Req_actualizarBalanceFechaAIR/";

declare function xf:expiredDate($fechaString as xs:string)
    as xs:string {
    	let $fechaActual := current-date()
    	let $fechaCUENTA := fn-bea:date-from-string-with-format("yyyyMMdd",substring($fechaString, 1, 10))
		
		return
		if ($fechaActual < $fechaCUENTA) then
    		$fechaString
    	else  
			let $fechaTemp := fn-bea:date-to-string-with-format("yyyyMMdd", $fechaActual)
			return concat($fechaTemp, "T23:59:59-0500")		
};



declare function xf:consumirCompensacionJMS_Req_actualizarBalanceFechaAIR($servicio as element(),
    $balances as element(*),
    $balancesAnterior as element())
    as element(ns0:Input_Parameters) {
		    
    	let $valor := data($balances/BALANCE[CUENTA='0']/VALOR)
    	let $valorBono := data($balances/BALANCE[CUENTA='7000']/VALOR)
    	let $fecha := data($balancesAnterior/BALANCE[CUENTA='0']/DIASVIGENCIA)
    	let $fechaBono := data($balancesAnterior/BALANCE[CUENTA='7000']/DIASVIGENCIA)
		return
    
        <ns0:Input_Parameters>
            <TIPO_NODO>{ data($servicio/PARAMETROS/PARAMETRO[NOMBRE='TIPO_NODO']/VALOR) }</TIPO_NODO>
            <HOST_ORIGEN>{ data($servicio/PARAMETROS/PARAMETRO[NOMBRE='HOST_ORIGEN']/VALOR) }</HOST_ORIGEN>
            <ID_TRANSACCION>{ data($servicio/PARAMETROS/PARAMETRO[NOMBRE='ID_TRANSACCION']/VALOR) }</ID_TRANSACCION>
            <FECHA_TRANSACCION>{ data($servicio/PARAMETROS/PARAMETRO[NOMBRE='FECHA_TRANSACCION']/VALOR) }</FECHA_TRANSACCION>
            <MIN>{ data($servicio/PARAMETROS/PARAMETRO[NOMBRE='MIN']/VALOR) }</MIN>
            <MONEDA>{ data($servicio/PARAMETROS/PARAMETRO[NOMBRE='MONEDA']/VALOR) }</MONEDA>
            <HOSTID>{ data($servicio/PARAMETROS/PARAMETRO[NOMBRE='HOSTID']/VALOR) }</HOSTID>
            
            {
             
		        
            if( exists($balances/BALANCE[CUENTA='0']) ) then
            	(
	            	if( exists($valor) and $valor!= "") then
	            		<VALOR_RELATIVO1>{ concat('-',$valor) }</VALOR_RELATIVO1>
	            	 else
	            	    ()
	            	 , 	
	            	 if( exists($fecha) and $fecha!= "") then
	            		<FECHA_EXPIRACION_ABSOLUTA1>{ xf:expiredDate($fecha) }</FECHA_EXPIRACION_ABSOLUTA1>
	            	 else ()	
	            	,
	            	<ID_CUENTA_DEDICADA1>0</ID_CUENTA_DEDICADA1>
	            	,
	            	if( exists($balances/BALANCE[CUENTA='7000']) ) then
	            	(
		            	if( exists($valorBono) and $valorBono!= "") then
		            		<VALOR_RELATIVO2>{ concat('-',$valorBono) }</VALOR_RELATIVO2>
		            	else (),	
		            	if( exists($fechaBono) and $fechaBono!= "") then
		            		<FECHA_EXPIRACION_ABSOLUTA2>{ xf:expiredDate($fechaBono) }</FECHA_EXPIRACION_ABSOLUTA2>
		            	else ()
		            	,
		            	<ID_CUENTA_DEDICADA2>7000</ID_CUENTA_DEDICADA2>
		            	,
		            	<UNIT_TYPE_CUENTA_DEDICADA2>1</UNIT_TYPE_CUENTA_DEDICADA2>
		            )	
		   			else()
		         )
            	
            	
            else if( exists($balances/BALANCE[CUENTA='7000']) ) then
            	(
	            	if( exists($valorBono) and $valorBono!= "") then
	            		<VALOR_RELATIVO1>{ concat('-',$valorBono) }</VALOR_RELATIVO1>
	            	else (),	
	            	if( exists($fechaBono) and $fechaBono!= "") then
	            		<FECHA_EXPIRACION_ABSOLUTA1>{ $fechaBono }</FECHA_EXPIRACION_ABSOLUTA1>
	            	else ()
	            	,
	            	<ID_CUENTA_DEDICADA1>7000</ID_CUENTA_DEDICADA1>
	            	,
	            	<UNIT_TYPE_CUENTA_DEDICADA1>1</UNIT_TYPE_CUENTA_DEDICADA1>
	            )	
            	else if(exists($servicio/PARAMETROS/PARAMETRO[NOMBRE='VALOR'])) then (
            	<VALOR_RELATIVO1>{ concat('-',data($servicio/PARAMETROS/PARAMETRO[NOMBRE='VALOR']/VALOR)) }</VALOR_RELATIVO1>,
            	<ID_CUENTA_DEDICADA1>0</ID_CUENTA_DEDICADA1>)
            	else()       
	        }
	        
	       
		    
	        
        </ns0:Input_Parameters>
};

declare variable $servicio as element() external;
declare variable $balances as element(*) external;
declare variable $balancesAnterior as element() external;

xf:consumirCompensacionJMS_Req_actualizarBalanceFechaAIR($servicio,
    $balances,
    $balancesAnterior)
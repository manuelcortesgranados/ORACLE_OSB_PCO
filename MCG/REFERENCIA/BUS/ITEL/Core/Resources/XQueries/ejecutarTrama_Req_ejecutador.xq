(:: pragma bea:global-element-parameter parameter="$validarResponse" element="ns1:WS_Result" location="../Schemas/PS_ITEL_VALIDARTRAMA.xsd" ::)
(:: pragma bea:global-element-parameter parameter="$reglasNegocioResponse" element="ns3:WS_Result" location="../Schemas/PS_ITEL_EJECUTARREGLASNEGOCIO.xsd" ::)
(:: pragma bea:global-element-return element="ns0:Input_Parameters" location="../Schemas/PS_ITEL_EJECUTADOR.xsd" ::)

declare namespace ns2 = "http://www.comcel.com.co/IN/OperacionCorba";
declare namespace ns1 = "http://www.comcel.com.co/ValidarTrama/";
declare namespace ns4 = "http://www.comcel.com.co/DA_TRAMA";
declare namespace ns3 = "http://www.comcel.com.co/EjecutarReglasNegocio/";
declare namespace ns0 = "http://www.comcel.com.co/Ejecutador/";
declare namespace xf = "http://tempuri.org/ITEL/Core/Resources/XQueries/ejecutarTrama_Req_ejecutador/";

declare function xf:swapOrigenDestino($data as element(ns1:WS_Result))
as element(ns0:Input_Parameters)
{
let $metodo := data($data/MENSAJE/TRAMA/ns4:METODO)
let $Origen := data($data/MENSAJE/TRAMA/ns4:PARAMETROS/ns4:MINORIGEN)
let $Destino := data($data/MENSAJE/TRAMA/ns4:MIN)
let $inOrigen := data($data/MENSAJE/IN_ORIGEN)
let $inDestino := data($data/MENSAJE/IN_DESTINO)
return 
   if ($metodo = '600' ) then
      <ns0:Input_Parameters>
        <MIN_ORIGEN>{ $Destino }</MIN_ORIGEN>
        <MIN_DESTINO>{ $Origen } </MIN_DESTINO>
        <IN_ORIGEN>{$inDestino}</IN_ORIGEN>
        <IN_DESTINO>{$inOrigen}</IN_DESTINO>
      </ns0:Input_Parameters>
   else
      <ns0:Input_Parameters>
        <MIN_ORIGEN>{ $Origen }</MIN_ORIGEN>
        <MIN_DESTINO>{ $Destino } </MIN_DESTINO>
        <IN_ORIGEN>{$inOrigen}</IN_ORIGEN>
        <IN_DESTINO>{$inDestino}</IN_DESTINO>
      </ns0:Input_Parameters>
};


declare function xf:ejecutarTrama_Req_ejecutador($validarResponse as element(ns1:WS_Result),
    $reglasNegocioResponse as element(ns3:WS_Result),
    $tiempoInicio as xs:dateTime)
    as element(ns0:Input_Parameters) {
        <ns0:Input_Parameters>
            <METODO>{ data($validarResponse/MENSAJE/TRAMA/ns4:METODO) }</METODO>
            <MIN_DESTINO>{ data(xf:swapOrigenDestino($validarResponse)/*:MIN_DESTINO) }</MIN_DESTINO>
            <MIN_ORIGEN>{ data(xf:swapOrigenDestino($validarResponse)/*:MIN_ORIGEN) }</MIN_ORIGEN>
            <IN_DESTINO>{ data(xf:swapOrigenDestino($validarResponse)/*:IN_DESTINO) }</IN_DESTINO>
            <IN_ORIGEN>{ data(xf:swapOrigenDestino($validarResponse)/*:IN_ORIGEN) }</IN_ORIGEN>
            <CONSECUTIVO>{ data($validarResponse/MENSAJE/TRAMA/ns4:PARAMETROS/ns4:CONSECUTIVO) }</CONSECUTIVO>
            <PARAMETROS_TRAMA>
                <PARAMETRO>
                    <NOMBRE>MINORIGEN</NOMBRE>
                    <TIPO>string</TIPO>
                    <VALOR>{ data($validarResponse/MENSAJE/TRAMA/ns4:PARAMETROS/ns4:MINORIGEN) }</VALOR>
                </PARAMETRO>
                <PARAMETRO>
                    <NOMBRE>COMENTARIO</NOMBRE>
                    <TIPO>string</TIPO>
                    <VALOR>{ data($validarResponse/MENSAJE/TRAMA/ns4:PARAMETROS/ns4:COMENTARIO) }</VALOR>
                </PARAMETRO>
                <PARAMETRO>
                    <NOMBRE>HOSTID</NOMBRE>
                    <TIPO>string</TIPO>
                    <VALOR>{ data($validarResponse/MENSAJE/TRAMA/ns4:PARAMETROS/ns4:HOSTID) }</VALOR>
                </PARAMETRO>
                <PARAMETRO>
                    <NOMBRE>CONSECUTIVO</NOMBRE>
                    <TIPO>string</TIPO>
                    <VALOR>{ data($validarResponse/MENSAJE/TRAMA/ns4:PARAMETROS/ns4:CONSECUTIVO) }</VALOR>
                </PARAMETRO>
                <PARAMETRO>
                    <NOMBRE>MONTORECARGA</NOMBRE>
                    <TIPO>decimal</TIPO>
                    <VALOR>{ data($validarResponse/MENSAJE/TRAMA/ns4:PARAMETROS/ns4:MONTORECARGA) }</VALOR>
                </PARAMETRO>
                <PARAMETRO>
                    <NOMBRE>BONIFICAR</NOMBRE>
                    <TIPO>string</TIPO>
                    <VALOR>{ data($validarResponse/MENSAJE/TRAMA/ns4:PARAMETROS/ns4:BONIFICAR) }</VALOR>
                </PARAMETRO>
                <PARAMETRO>
                    <NOMBRE>DIASVIGENCIA</NOMBRE>
                    <TIPO>decimal</TIPO>
                    <VALOR>{ data($validarResponse/MENSAJE/TRAMA/ns4:PARAMETROS/ns4:DIASVIGENCIA) }</VALOR>
                </PARAMETRO>
                <PARAMETRO>
                    <NOMBRE>CONTRATO</NOMBRE>
                    <TIPO>string</TIPO>
                    <VALOR>{ data($validarResponse/MENSAJE/*:CONTRATO) }</VALOR>
                </PARAMETRO>      
                <PARAMETRO>
                    <NOMBRE>METODOCONSECUTIVO</NOMBRE>
                    <TIPO>string</TIPO>
                    <VALOR>{ data($validarResponse/MENSAJE/PLATAFORMA) }</VALOR>
                </PARAMETRO>          
                {
		            if(data($validarResponse/MENSAJE/TRAMA/ns4:METODO) = '414') then (
			        <PARAMETRO>
	                    <NOMBRE>TIPONOTIFICACION</NOMBRE>
	                    <TIPO>string</TIPO>
	                    <VALOR>{ data($validarResponse/MENSAJE/TIPONOTIFICACION) }</VALOR>
	                </PARAMETRO> 
	                  )else()
                }  
                <PARAMETRO>
                    <NOMBRE>STATUS</NOMBRE>
                    <TIPO>string</TIPO>
                    <VALOR>{ if(data($validarResponse/MENSAJE/TRAMA/ns4:METODO) = '100' or data($validarResponse/MENSAJE/TRAMA/ns4:METODO) = '101') then (3) else (number($reglasNegocioResponse/MENSAJE/SUSCRIPTOR_OCS/DATOS_SUSCRIPTOR/*:Prepaid_LC_State)) }</VALOR>
                </PARAMETRO>
		        {
	                if(data($validarResponse/MENSAJE/TRAMA/ns4:METODO) = '601','604','100','101') then (
		        <PARAMETRO>
		            <NOMBRE>PLANES_SPR_RTC</NOMBRE>
		            <TIPO>string</TIPO>
		            <VALOR>{ data($validarResponse/MENSAJE/*:PLANES_SPR_RTC) }</VALOR>
		        </PARAMETRO>
                  )else()
                }     
                         		        {
	                if(data($validarResponse/MENSAJE/TRAMA/ns4:METODO) = '100','101') then (
		        <PARAMETRO>
		            <NOMBRE>PAQUETESM_WELCOME</NOMBRE>
		            <TIPO>string</TIPO>
		            <VALOR>{ data($validarResponse/MENSAJE/*:PAQUETESM_WELCOME) }</VALOR>
		        </PARAMETRO>
                  )else()
                }  
		        {
	                if(data($validarResponse/MENSAJE/TRAMA/ns4:METODO) = '409') then (
		        <PARAMETRO>
		            <NOMBRE>MENSAJEACTIVACION</NOMBRE>
		            <TIPO>string</TIPO>
		            <VALOR>{ data($validarResponse/MENSAJE/*:MENSAJEACTIVACION) }</VALOR>
		        </PARAMETRO>,
		        <PARAMETRO>
		            <NOMBRE>PREFIJOSMSPAQUETE</NOMBRE>
		            <TIPO>string</TIPO>
		            <VALOR>{ data($validarResponse/MENSAJE/*:PREFIJOSMSPAQUETE) }</VALOR>
		        </PARAMETRO>		        
                  )else()
                }
                
                {
	            if(data($validarResponse/MENSAJE/TRAMA/ns4:METODO) = '502') then (
		        <PARAMETRO>
		            <NOMBRE>MENSAJEDESACTIVACION</NOMBRE>
		            <TIPO>string</TIPO>
		            <VALOR>{ data($validarResponse/MENSAJE/*:MENSAJEDESACTIVACION) }</VALOR>
		        </PARAMETRO>,
		        <PARAMETRO>
		            <NOMBRE>PREFIJOSMSPAQUETE</NOMBRE>
		            <TIPO>string</TIPO>
		            <VALOR>{ data($validarResponse/MENSAJE/*:PREFIJOSMSPAQUETE) }</VALOR>
		        </PARAMETRO>,		
		        <PARAMETRO>
		            <NOMBRE>SUBSCRIPTIONID</NOMBRE>
		            <TIPO>string</TIPO>
		            <VALOR>{ data($reglasNegocioResponse/MENSAJE/PARAMETROS_REGLAS/PARAMETRO[NOMBRE='SUBSCRIPTIONID']/VALOR) }</VALOR>
		        </PARAMETRO>	
                  )else()
                }
                
                
                {
				if(data($validarResponse/MENSAJE/TRAMA/ns4:METODO) = '503') then (
				
				<PARAMETRO>
					<NOMBRE>PRODUCT_ID</NOMBRE>
					<TIPO>string</TIPO>
					<VALOR>{ data($reglasNegocioResponse/MENSAJE/PARAMETROS_REGLAS/PARAMETRO[NOMBRE='PRODUCT_ID']/VALOR) }</VALOR>
				</PARAMETRO>,		
				<PARAMETRO>
					<NOMBRE>PLATAFORMA_PAQUETE</NOMBRE>
					<TIPO>string</TIPO>
					<VALOR>{ data($reglasNegocioResponse/MENSAJE/PARAMETROS_REGLAS/PARAMETRO[NOMBRE='PLATAFORMA_PAQUETE']/VALOR) }</VALOR>
				</PARAMETRO>,
				<PARAMETRO>
					<NOMBRE>PAQUETES_ACTIVOS</NOMBRE>
					<TIPO>string</TIPO>
					<VALOR>{ $reglasNegocioResponse/MENSAJE/PARAMETROS_REGLAS/PARAMETRO[NOMBRE='PAQUETES_ACTIVOS']/VALOR }</VALOR>
				</PARAMETRO>,
				<PARAMETRO>
					<NOMBRE>PARAMETROS_BB</NOMBRE>
					<TIPO>string</TIPO>
					<VALOR>{ $reglasNegocioResponse/MENSAJE/PARAMETROS_REGLAS/PARAMETRO[NOMBRE='PARAMETROS_BB']/VALOR }</VALOR>
				</PARAMETRO>	
				  )else()
			   }
			   
			   {
				if(data($validarResponse/MENSAJE/TRAMA/ns4:METODO) = '415') then (
				 
				<PARAMETRO>
					<NOMBRE>PLATAFORMA_PAQUETE</NOMBRE>
					<TIPO>string</TIPO>
					<VALOR>{ data($reglasNegocioResponse/MENSAJE/PARAMETROS_REGLAS/PARAMETRO[NOMBRE='PLATAFORMA_PAQUETE']/VALOR) }</VALOR>
				</PARAMETRO>,
				<PARAMETRO>
					<NOMBRE>PAQUETES_ACTIVOS</NOMBRE>
					<TIPO>string</TIPO>
					<VALOR>{ $reglasNegocioResponse/MENSAJE/PARAMETROS_REGLAS/PARAMETRO[NOMBRE='PAQUETES_ACTIVOS']/VALOR }</VALOR>
				</PARAMETRO>,
				<PARAMETRO>
					<NOMBRE>PARAMETROS_BB</NOMBRE>
					<TIPO>string</TIPO>
					<VALOR>{ $reglasNegocioResponse/MENSAJE/PARAMETROS_REGLAS/PARAMETRO[NOMBRE='PARAMETROS_BB']/VALOR }</VALOR>
				</PARAMETRO>	
				  )else()
			   }
                
                
                
                {
	                if(data($validarResponse/MENSAJE/TRAMA/ns4:METODO) = '100' or data($validarResponse/MENSAJE/TRAMA/ns4:METODO) = '101'
	                and number(xf:swapOrigenDestino($validarResponse)/*:IN_DESTINO) ge 50) then (
		                <PARAMETRO>
		                    <NOMBRE>OFFERID_CARGAINICIAL</NOMBRE>
		                    <TIPO>string</TIPO>
		                    <VALOR>{ data($validarResponse/MENSAJE/*:CARGAINICIAL) }</VALOR>
		                </PARAMETRO>,
		                <PARAMETRO>
                    	<NOMBRE>ACC_GRP_ID</NOMBRE>
                    		<TIPO>string</TIPO>
                    		<VALOR>{ data($validarResponse/MENSAJE/*:CATEGORIA) }</VALOR>
               			</PARAMETRO>,
		                <PARAMETRO>
		                    <NOMBRE>TEMPORARY_BLOCKED</NOMBRE>
		                    <TIPO>string</TIPO>
		                    <VALOR>{ if(data($validarResponse/MENSAJE/*:BLOQUEA) = '0') then ( 'FALSE' )else ('TRUE') }</VALOR>
		                </PARAMETRO>,
		                <PARAMETRO>
		                    <NOMBRE>SDP</NOMBRE>
		                    <TIPO>string</TIPO>
		                    <VALOR>{ data($validarResponse/MENSAJE/*:VIGENCIA) }</VALOR>
		                </PARAMETRO>,
		                <PARAMETRO>
		                    <NOMBRE>POSPAGO</NOMBRE>
		                    <TIPO>string</TIPO>
		                    <VALOR>{ data($validarResponse/MENSAJE/*:CONTRATOESPOSTPAGO) }</VALOR>
		                </PARAMETRO>,
		                <PARAMETRO>
		                    <NOMBRE>MATERIALESRTC</NOMBRE>
		                    <TIPO>string</TIPO>
		                    <VALOR>{ data($validarResponse/MENSAJE/*:MATERIALESRTC) }</VALOR>
		                </PARAMETRO>,
		                <PARAMETRO>
		                    <NOMBRE>PAQUETERTC</NOMBRE>
		                    <TIPO>string</TIPO>
		                    <VALOR>{ data($validarResponse/MENSAJE/*:PAQUETERTC) }</VALOR>
		                </PARAMETRO>,
		                <PARAMETRO>
		                    <NOMBRE>MATERIAL</NOMBRE>
		                    <TIPO>string</TIPO>
		                    <VALOR>{ data($validarResponse/MENSAJE/*:MATERIAL) }</VALOR>
		                </PARAMETRO>
		                
		                
	                )else()
                }
 {
	                if(data($validarResponse/MENSAJE/TRAMA/ns4:METODO) = '306') then (	
				        <PARAMETRO>
				            <NOMBRE>VALIDARFNF</NOMBRE>
				            <TIPO>string</TIPO>
				            <VALOR>{ data($reglasNegocioResponse/MENSAJE/PARAMETROS_REGLAS/PARAMETRO[NOMBRE='VALIDARFNF']/VALOR) }</VALOR>
				        </PARAMETRO>	
                  )else()
                }                
                {
                if(data($validarResponse/MENSAJE/TRAMA/ns4:METODO) = '601' or data($validarResponse/MENSAJE/TRAMA/ns4:METODO) = '604'
	                and number(xf:swapOrigenDestino($validarResponse)/*:IN_DESTINO) ge 50) then (
	                <PARAMETRO>
                    	<NOMBRE>CAMBIOSDEPLAN</NOMBRE>
                    	<TIPO>string</TIPO>
                    	<VALOR>{ data($reglasNegocioResponse/MENSAJE/PARAMETROS_REGLAS/PARAMETRO[NOMBRE='CAMBIOSDEPLAN']/VALOR/text()) }</VALOR>
               	    </PARAMETRO>,
	                <PARAMETRO>
                    	<NOMBRE>ACC_GRP_ID</NOMBRE>
                    	<TIPO>string</TIPO>
                    	<VALOR>{ data($validarResponse/MENSAJE/*:CARGAINICIAL) }</VALOR>
               	    </PARAMETRO>,	                
	                <PARAMETRO>
		                <NOMBRE>FAFS ELIMINAR</NOMBRE>
		                <TIPO>string</TIPO>
		                <VALOR>{ fn:string-join(for $listaElegidos in $reglasNegocioResponse/MENSAJE/SUSCRIPTOR_OCS/FAF_LIST/fafInformationList/Detail 
	                	return if(fn:contains($validarResponse/MENSAJE/CATEGORIA, fn:tokenize($listaElegidos/fafIndicator,";")[1])) 
	                				then (  
	                				for $listaFaFs in fn:tokenize($validarResponse/MENSAJE/CATEGORIA,";") 
	                							return if(fn:contains($listaElegidos/fafIndicator, 
	                									fn:tokenize($listaFaFs,"\|")[1])) 
			                							then (if(number(fn:tokenize($listaFaFs,"\|")[3]) < count($listaElegidos/DetailNumber/fafNumber))
			                								 then(fn:concat(data(fn:tokenize($listaElegidos/fafIndicator,";")[1]),
	                							";",fn:string-join(data($listaElegidos/DetailNumber/fafNumber),";")))                				 		
			                				 					else ()
			                				 				)
	                				 					else()     				  	
	                				  	)                				 
	                				else ( fn:concat(data(fn:tokenize($listaElegidos/fafIndicator,";")[1]),
	                							";",fn:string-join(data($listaElegidos/DetailNumber/fafNumber),";"))		                				
		                		  		)
		                		  ,"|")
		                }</VALOR>
		             </PARAMETRO>,
		             <PARAMETRO>
		                <NOMBRE>FAFS INSTALAR</NOMBRE>
		                <TIPO>string</TIPO>
		                <VALOR>{ fn:string-join(for $listaFaFs in fn:tokenize($validarResponse/MENSAJE/CATEGORIA,";") 
	                	return if(fn:contains($reglasNegocioResponse/MENSAJE/SUSCRIPTOR_OCS/FAF_LIST, 
	                				fn:tokenize($listaFaFs,"\|")[1])) 
	                				then (for $listaElegidos in $reglasNegocioResponse/MENSAJE/SUSCRIPTOR_OCS/FAF_LIST/fafInformationList/Detail
	                					where fn:contains($listaElegidos/fafIndicator, fn:tokenize($listaFaFs,"\|")[1])
	                					return (if(number(fn:tokenize($listaFaFs,"\|")[3]) < count($listaElegidos/DetailNumber/fafNumber))
	                							then(
	                							    fn:concat(data(fn:tokenize($listaElegidos/fafIndicator,";")[1]),
	                							";",fn:string-join(for $i in (1 to xs:integer(fn:tokenize($listaFaFs,"\|")[3])) return 
	                						data($listaElegidos/DetailNumber/fafNumber[$i]),";"))
	                							)
	                							else()
	                							)
	                					)
	                					
	                				else (if(fn:contains($reglasNegocioResponse/MENSAJE/SUSCRIPTOR_OCS/FAF_LIST, fn:tokenize($listaFaFs,"\|")[2])) then (
	                				 if(not(fn:exists($reglasNegocioResponse/MENSAJE/SUSCRIPTOR_OCS/FAF_LIST/fafInformationList/Detail/DetailNumber/fafNumber))) then () else (
	                				 fn:concat(fn:tokenize($listaFaFs,"\|")[1],";",
	                				fn:string-join(for $listaElegidos in $reglasNegocioResponse/MENSAJE/SUSCRIPTOR_OCS/FAF_LIST/fafInformationList/Detail
	                					where fn:contains($listaElegidos/fafIndicator, fn:tokenize($listaFaFs,"\|")[2])
	                					return (for $i in (1 to xs:integer(fn:tokenize($listaFaFs,"\|")[3])) return 
	                						data($listaElegidos/DetailNumber/fafNumber[$i])),";"))
	                				 )) else())
	                				 ,"|")
		                }</VALOR>
		             </PARAMETRO>	                				
	                )else()
                }
            </PARAMETROS_TRAMA>
            <PARAMETROS_NEGOCIO>
                {
                    for $PARAMETRO in $reglasNegocioResponse/MENSAJE/PARAMETROS_REGLAS/PARAMETRO
                    return
                        <PARAMETRO>{ $PARAMETRO/@* , $PARAMETRO/node() }</PARAMETRO>
                }
            </PARAMETROS_NEGOCIO>
            <SUSCRIPTOR_DESTINO>{ $reglasNegocioResponse/MENSAJE/SUSCRIPTOR_DESTINO/@* , $reglasNegocioResponse/MENSAJE/SUSCRIPTOR_DESTINO/node() }</SUSCRIPTOR_DESTINO>
            <SUSCRIPTOR_ORIGEN>{ $reglasNegocioResponse/MENSAJE/SUSCRIPTOR_ORIGEN/@* , $reglasNegocioResponse/MENSAJE/SUSCRIPTOR_ORIGEN/node() }</SUSCRIPTOR_ORIGEN>
            <SUSCRIPTOR_OCS>{ $reglasNegocioResponse/MENSAJE/SUSCRIPTOR_OCS/@* , $reglasNegocioResponse/MENSAJE/SUSCRIPTOR_OCS/node() }</SUSCRIPTOR_OCS>
            <TIEMPO_INICIO>{ $tiempoInicio }</TIEMPO_INICIO>
            <TIMEOUT>{ data($validarResponse/MENSAJE/TIMEOUT_PROVISION) }</TIMEOUT>
        </ns0:Input_Parameters>
};

declare variable $validarResponse as element(ns1:WS_Result) external;
declare variable $reglasNegocioResponse as element(ns3:WS_Result) external;
declare variable $tiempoInicio as xs:dateTime external;

xf:ejecutarTrama_Req_ejecutador($validarResponse,
    $reglasNegocioResponse,
    $tiempoInicio)
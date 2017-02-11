(:: pragma bea:global-element-return element="ns0:WS_Result" location="../Schemas/PS_ITEL_EJECUTADOR.xsd" ::)

declare namespace ns0 = "http://www.comcel.com.co/Ejecutador/";
declare namespace xf = "http://tempuri.org/ITEL/Core/Resources/XQueries/ejecutador_Res/";

declare function xf:ejecutador_Res($codigo as xs:string,
    $mensaje as xs:string,
    $descripcion as xs:string,
    $tiempoInicio as xs:dateTime,
    $durReglasProvision as xs:integer,
    $durEjecucionIN as xs:integer,
    $durTxIN as xs:integer,
    $serviciosEjecutados as element(),
    $balances as element(*),
    $balancesAnterior as element(*))
    as element(ns0:WS_Result) {
        <ns0:WS_Result>
            <CODIGO>{ $codigo }</CODIGO>
            <MENSAJE>
            	<RESPUESTA>{ $mensaje }</RESPUESTA>
            	<DURREGLASPROVISION>{ $durReglasProvision }</DURREGLASPROVISION>
            	<DURSERVICIOSIN2>{ $durEjecucionIN }</DURSERVICIOSIN2>
            	<DURTXIN>{ $durTxIN }</DURTXIN>
            	<SERVICIOS_EJECUTADOS>
            		{
	            		for $servicio in $serviciosEjecutados/SERVICIO
	            		return
	            			<SERVICIO cluster = "{ data($servicio/@cluster) }">
	            				<NOMBRE>{ data($servicio/NOMBRE) }</NOMBRE>
	            				<PARAMETROS>
	            					{
	            						for $parametro in $servicio/PARAMETROS/PARAMETRO
	            						return
	            							<PARAMETRO>
	            								<NOMBRE>{ data($parametro/NOMBRE) }</NOMBRE>
	            								<TIPO>{ data($parametro/TIPO) }</TIPO>
	            								<VALOR>{ $parametro/VALOR/node() }</VALOR>
	            							</PARAMETRO>
	            					}
	            				</PARAMETROS>
	            			</SERVICIO>
	            		}
            	</SERVICIOS_EJECUTADOS>
            	<BALANCES>{ $balances/@* , $balances/node() }</BALANCES>
            	<BALANCES_ANTERIOR>{ $balancesAnterior/@* , $balancesAnterior/node() }</BALANCES_ANTERIOR>
            </MENSAJE>
            <DESCRIPCION>{ concat($descripcion , fn:current-dateTime() -  $tiempoInicio) }</DESCRIPCION>
        </ns0:WS_Result>
};

declare variable $codigo as xs:string external;
declare variable $mensaje as xs:string external;
declare variable $descripcion as xs:string external;
declare variable $tiempoInicio as xs:dateTime external;
declare variable $durReglasProvision as xs:integer external;
declare variable $durEjecucionIN as xs:integer external;
declare variable $durTxIN as xs:integer external;
declare variable $serviciosEjecutados as element() external;
declare variable $balances as element(*) external;
declare variable $balancesAnterior as element(*) external;

xf:ejecutador_Res($codigo,
    $mensaje,
    $descripcion,
    $tiempoInicio,
    $durReglasProvision,
    $durEjecucionIN,
    $durTxIN,
    $serviciosEjecutados,
    $balances,
    $balancesAnterior)
(:: pragma bea:global-element-parameter parameter="$wS_Result1" element="ns1:WS_Result" location="../Schemas/PS_ITEL_CONSULTARRANGOMIN.xsd" ::)
(:: pragma bea:global-element-return element="ns0:WS_Result" location="../Schemas/PS_ITEL_SERVICIO_PROVISION.xsd" ::)

declare namespace ns1 = "http://www.comcel.com.co/ConsultarRangoMin/";
declare namespace ns0 = "http://www.comcel.com.co/ServicioProvision/";
declare namespace xf = "http://tempuri.org/ITEL/Core/Resources/XQueries/servicioProvision_Res/";

declare function xf:servicioProvision_Res($codigo as xs:string,
    $mensaje as xs:string,
    $descripcion as xs:string,
    $wS_Result1 as element(ns1:WS_Result))
    as element(ns0:WS_Result) {
        <ns0:WS_Result>
            <CODIGO>{ $codigo }</CODIGO>
            <MENSAJE>
                <USUARIO>{ "" }</USUARIO>
                <METODO>{ "" }</METODO>
                <CODIGO_RESPUESTA>{ "" }</CODIGO_RESPUESTA>
                <DESCRIPCION>{ $mensaje }</DESCRIPCION>
                <PARAMETROS>
	                <PARAMETRO>
						<NOMBRE>{"IN"}</NOMBRE>
						<VALOR>{ data($wS_Result1/MENSAJE/RMCCODIGOIN) }</VALOR>
					</PARAMETRO>
					<PARAMETRO>
						<NOMBRE>{"ESTADO"}</NOMBRE>
						<VALOR>{ data($wS_Result1/MENSAJE/RMCESTADO) }</VALOR>
					</PARAMETRO>
				</PARAMETROS>
            </MENSAJE>
            <DESCRIPCION>{ $descripcion }</DESCRIPCION>
        </ns0:WS_Result>
};

declare variable $codigo as xs:string external;
declare variable $mensaje as xs:string external;
declare variable $descripcion as xs:string external;
declare variable $wS_Result1 as element(ns1:WS_Result) external;

xf:servicioProvision_Res($codigo,
    $mensaje,
    $descripcion,
    $wS_Result1)
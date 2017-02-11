xquery version "1.0" encoding "Cp1252";
(:: pragma bea:global-element-parameter parameter="$wS_Result" element="ns0:WS_Result" location="../../../Trama406/Resources/Schemas/PS_ITEL_CONSULTARREGLASTRAMA406.xsd" ::)
(:: pragma bea:global-element-return element="ns1:WS_Result" location="../Schemas/PS_ITEL_CONSULTARREGLAS.xsd" ::)

declare namespace xf = "http://tempuri.org/ITEL/Core/Resources/XQueries/consultarReglas_Res_Trama406/";
declare namespace ns1 = "http://www.comcel.com.co/ConsultarReglas/";
declare namespace ns0 = "http://www.comcel.com.co/ConsultarReglasTrama406/";

declare function xf:consultarReglas_Res_Trama406($wS_Result as element(ns0:WS_Result))
    as element(ns1:WS_Result) {
        <ns1:WS_Result>
        	{
              if( fn:string-length( $wS_Result/MENSAJE/ERROR ) > 0 ) then
                <CODIGO>{ data($wS_Result/MENSAJE/ERROR) }</CODIGO>
              else
                <CODIGO>7</CODIGO>
            }
            
            <MENSAJE>
                <ERROR>{ data($wS_Result/MENSAJE/ERROR) }</ERROR>
                <ERRORDESC>{ data($wS_Result/MENSAJE/ERROR) }</ERRORDESC>
                <CONSULTASUSCRIPTOR>{ data($wS_Result/MENSAJE/CONSULTASUSCRIPTOR) }</CONSULTASUSCRIPTOR>
                <PARAMETROS>
                    <PARAMETRO>
                        <NOMBRE>{fn:node-name($wS_Result/MENSAJE/ACREDITACUENTA)}</NOMBRE>
                        <TIPO>string</TIPO>
                        <VALOR>{data($wS_Result/MENSAJE/ACREDITACUENTA) }</VALOR>
                    </PARAMETRO>
                    <PARAMETRO>
                        <NOMBRE>{fn:node-name($wS_Result/MENSAJE/MONTOCUENTA)}</NOMBRE>
                        <TIPO>decimal</TIPO>
                        <VALOR>{data($wS_Result/MENSAJE/MONTOCUENTA)}</VALOR>
                    </PARAMETRO>
                    <PARAMETRO>
                        <NOMBRE>{fn:node-name($wS_Result/MENSAJE/MODIFICAVIGENCIACUENTA)}</NOMBRE>
                        <TIPO>string</TIPO>
                        <VALOR>{ data($wS_Result/MENSAJE/MODIFICAVIGENCIACUENTA) }</VALOR>
                    </PARAMETRO>
                    <PARAMETRO>
                        <NOMBRE>{fn:node-name($wS_Result/MENSAJE/VIGENCIACUENTA)}</NOMBRE>
                        <TIPO>decimal</TIPO>
                        <VALOR>{ data($wS_Result/MENSAJE/VIGENCIACUENTA)}</VALOR>
                    </PARAMETRO>
                </PARAMETROS>
            </MENSAJE>
            <DESCRIPCION>{ data($wS_Result/DESCRIPCION) }</DESCRIPCION>
        </ns1:WS_Result>
};

declare variable $wS_Result as element(ns0:WS_Result) external;

xf:consultarReglas_Res_Trama406($wS_Result)
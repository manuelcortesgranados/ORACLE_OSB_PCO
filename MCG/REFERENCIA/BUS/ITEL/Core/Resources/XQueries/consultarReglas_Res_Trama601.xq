(:: pragma bea:global-element-parameter parameter="$wS_Result1" element="ns1:WS_Result" location="../../../Trama601/Resources/Schemas/PS_ITEL_CONSULTARREGLASTRAMA601.xsd" ::)
(:: pragma bea:global-element-return element="ns0:WS_Result" location="../Schemas/PS_ITEL_CONSULTARREGLAS.xsd" ::)

declare namespace ns1 = "http://www.comcel.com.co/ConsultarReglasTrama601/";
declare namespace ns0 = "http://www.comcel.com.co/ConsultarReglas/";
declare namespace xf = "http://tempuri.org/ITEL/Core/Resources/XQueries/consultarReglas_Res_Trama601/";

declare function xf:consultarReglas_Res_Trama601($wS_Result1 as element(ns1:WS_Result))
    as element(ns0:WS_Result) {
        <ns0:WS_Result>
            {
              if( fn:string-length( $wS_Result1/MENSAJE/ERROR ) > 0 ) then
                <CODIGO>{ data($wS_Result1/MENSAJE/ERROR) }</CODIGO>
              else
                <CODIGO>7</CODIGO>
            }
            
            <MENSAJE>
                <ERROR>{ data($wS_Result1/MENSAJE/ERROR) }</ERROR>
                <ERRORDESC>{ data($wS_Result1/MENSAJE/ERROR) }</ERRORDESC>
                <CONSULTASUSCRIPTOR>{ data($wS_Result1/MENSAJE/CONSULTASUSCRIPTOR) }</CONSULTASUSCRIPTOR>
                <PARAMETROS>
                    <PARAMETRO>
                        <NOMBRE>{fn:node-name($wS_Result1/MENSAJE/ACREDITACUENTA)}</NOMBRE>
                        <TIPO>string</TIPO>
                        <VALOR>{data($wS_Result1/MENSAJE/ACREDITACUENTA) }</VALOR>
                    </PARAMETRO>
                    <PARAMETRO>
                        <NOMBRE>{fn:node-name($wS_Result1/MENSAJE/MONTOCUENTA)}</NOMBRE>
                        <TIPO>decimal</TIPO>
                        <VALOR>{ data($wS_Result1/MENSAJE/MONTOCUENTA) }</VALOR>
                    </PARAMETRO>
                    <PARAMETRO>
                        <NOMBRE>{fn:node-name($wS_Result1/MENSAJE/CONTRACT)}</NOMBRE>
                        <TIPO>string</TIPO>
                        <VALOR>{data($wS_Result1/MENSAJE/CONTRACT)}</VALOR>
                    </PARAMETRO>
                </PARAMETROS>
            </MENSAJE>
            <DESCRIPCION>{ data($wS_Result1/DESCRIPCION) }</DESCRIPCION>
        </ns0:WS_Result>
};

declare variable $wS_Result1 as element(ns1:WS_Result) external;

xf:consultarReglas_Res_Trama601($wS_Result1)
(:: pragma bea:global-element-parameter parameter="$wS_Result1" element="ns1:WS_Result" location="../../../Trama400/Resources/Schemas/PS_ITEL_CONSULTARREGLASTRAMA400.xsd" ::)
(:: pragma bea:global-element-return element="ns0:WS_Result" location="../Schemas/PS_ITEL_CONSULTARREGLAS.xsd" ::)

declare namespace ns1 = "http://www.comcel.com.co/ConsultarReglasTrama400/";
declare namespace ns0 = "http://www.comcel.com.co/ConsultarReglas/";
declare namespace xf = "http://tempuri.org/ITEL/Core/Resources/XQueries/consultarReglas_Res_Trama400/";

declare function xf:consultarReglas_Res_Trama400($wS_Result1 as element(ns1:WS_Result))
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
                        <NOMBRE>{fn:node-name($wS_Result1/MENSAJE/ACREDITAONPEAK)}</NOMBRE>
                        <TIPO>string</TIPO>
                        <VALOR>{data($wS_Result1/MENSAJE/ACREDITAONPEAK) }</VALOR>
                    </PARAMETRO>
                    <PARAMETRO>
                        <NOMBRE>{fn:node-name($wS_Result1/MENSAJE/MONTOONPEAK)}</NOMBRE>
                        <TIPO>decimal</TIPO>
                        <VALOR>{data($wS_Result1/MENSAJE/MONTOONPEAK)}</VALOR>
                    </PARAMETRO>
                    <PARAMETRO>
                        <NOMBRE>{fn:node-name($wS_Result1/MENSAJE/MODIFICAVIGENCIAONPEAK)}</NOMBRE>
                        <TIPO>string</TIPO>
                        <VALOR>{ data($wS_Result1/MENSAJE/MODIFICAVIGENCIAONPEAK) }</VALOR>
                    </PARAMETRO>
                    <PARAMETRO>
                        <NOMBRE>{fn:node-name($wS_Result1/MENSAJE/VIGENCIAONPEAK)}</NOMBRE>
                        <TIPO>decimal</TIPO>
                        <VALOR>{ data($wS_Result1/MENSAJE/VIGENCIAONPEAK)}</VALOR>
                    </PARAMETRO>
                    <PARAMETRO>
                        <NOMBRE>{fn:node-name($wS_Result1/MENSAJE/ACREDITABONUS)}</NOMBRE>
                        <TIPO>string</TIPO>
                        <VALOR>{ data($wS_Result1/MENSAJE/ACREDITABONUS)}</VALOR>
                    </PARAMETRO>
                    <PARAMETRO>
                        <NOMBRE>{fn:node-name($wS_Result1/MENSAJE/MODIFICAVIGENCIABONUS)}</NOMBRE>
                        <TIPO>string</TIPO>
                        <VALOR>{ data($wS_Result1/MENSAJE/MODIFICAVIGENCIABONUS)}</VALOR>
                    </PARAMETRO>
                    <PARAMETRO>
                        <NOMBRE>{fn:node-name($wS_Result1/MENSAJE/VIGENCIABONOS)}</NOMBRE>
                        <TIPO>decimal</TIPO>
                        <VALOR>{ data( $wS_Result1/MENSAJE/VIGENCIABONOS ) }</VALOR>
                    </PARAMETRO>
                    <PARAMETRO>
                        <NOMBRE>{fn:node-name($wS_Result1/MENSAJE/MONTOBONOS)}</NOMBRE>
                        <TIPO>decimal</TIPO>
                        <VALOR>{ data( $wS_Result1/MENSAJE/MONTOBONOS) }</VALOR>
                    </PARAMETRO>
                    <PARAMETRO>
                        <NOMBRE>{fn:node-name($wS_Result1/MENSAJE/ACREDITAMIN)}</NOMBRE>
                        <TIPO>boolean</TIPO>
                        <VALOR>{ data( $wS_Result1/MENSAJE/ACREDITAMIN) }</VALOR>
                    </PARAMETRO>
                    <PARAMETRO>
                        <NOMBRE>{fn:node-name($wS_Result1/MENSAJE/MODIFICAVIGENCIAMIN)}</NOMBRE>
                        <TIPO>boolean</TIPO>
                        <VALOR>{ data( $wS_Result1/MENSAJE/MODIFICAVIGENCIAMIN) }</VALOR>
                    </PARAMETRO>
                    <PARAMETRO>
                        <NOMBRE>{fn:node-name($wS_Result1/MENSAJE/VIGENCIAMIN)}</NOMBRE>
                        <TIPO>decimal</TIPO>
                        <VALOR>{ data( $wS_Result1/MENSAJE/VIGENCIAMIN) }</VALOR>
                    </PARAMETRO>
                    <PARAMETRO>
                        <NOMBRE>{fn:node-name($wS_Result1/MENSAJE/MONTOMIN)}</NOMBRE>
                        <TIPO>decimal</TIPO>
                        <VALOR>{ data( $wS_Result1/MENSAJE/MONTOMIN) }</VALOR>
                    </PARAMETRO>
                </PARAMETROS>
            </MENSAJE>
            <DESCRIPCION>{ data($wS_Result1/DESCRIPCION) }</DESCRIPCION>
        </ns0:WS_Result>
};

declare variable $wS_Result1 as element(ns1:WS_Result) external;

xf:consultarReglas_Res_Trama400($wS_Result1)
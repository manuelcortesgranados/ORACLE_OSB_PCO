(:: pragma bea:global-element-parameter parameter="$wS_Result" element="ns0:WS_Result" location="../../../Trama402/Resources/Schemas/PS_ITEL_CONSULTARREGLASTRAMA402.xsd" ::)
(:: pragma bea:global-element-return element="ns1:WS_Result" location="../Schemas/PS_ITEL_CONSULTARREGLAS.xsd" ::)

declare namespace ns1 = "http://www.comcel.com.co/ConsultarReglas/";
declare namespace ns0 = "http://www.comcel.com.co/ConsultarReglasTrama402/";
declare namespace xf = "http://tempuri.org/ITEL/Core/Resources/XQueries/consultarReglas_Res_Trama402/";

declare function xf:consultarReglas_Res_Trama402($wS_Result as element(ns0:WS_Result))
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
                        <NOMBRE>{fn:node-name($wS_Result/MENSAJE/ACREDITAONPEAK)}</NOMBRE>
                        <TIPO>string</TIPO>
                        <VALOR>{data($wS_Result/MENSAJE/ACREDITAONPEAK) }</VALOR>
                    </PARAMETRO>
                    <PARAMETRO>
                        <NOMBRE>{fn:node-name($wS_Result/MENSAJE/MONTOONPEAKORIGEN)}</NOMBRE>
                        <TIPO>decimal</TIPO>
                        <VALOR>{data($wS_Result/MENSAJE/MONTOONPEAKORIGEN)}</VALOR>
                    </PARAMETRO>
                    <PARAMETRO>
                        <NOMBRE>{fn:node-name($wS_Result/MENSAJE/MONTOONPEAKDESTINO)}</NOMBRE>
                        <TIPO>decimal</TIPO>
                        <VALOR>{data($wS_Result/MENSAJE/MONTOONPEAKDESTINO)}</VALOR>
                    </PARAMETRO>
                    <PARAMETRO>
                        <NOMBRE>{fn:node-name($wS_Result/MENSAJE/MODIFICAVIGENCIAONPEAK)}</NOMBRE>
                        <TIPO>string</TIPO>
                        <VALOR>{ data($wS_Result/MENSAJE/MODIFICAVIGENCIAONPEAK) }</VALOR>
                    </PARAMETRO>
                    <PARAMETRO>
                        <NOMBRE>{fn:node-name($wS_Result/MENSAJE/VIGENCIAONPEAK)}</NOMBRE>
                        <TIPO>decimal</TIPO>
                        <VALOR>{ data($wS_Result/MENSAJE/VIGENCIAONPEAK)}</VALOR>
                    </PARAMETRO>
                </PARAMETROS>
            </MENSAJE>
            <DESCRIPCION>{ data($wS_Result/DESCRIPCION) }</DESCRIPCION>
            
        </ns1:WS_Result>
};

declare variable $wS_Result as element(ns0:WS_Result) external;

xf:consultarReglas_Res_Trama402($wS_Result)
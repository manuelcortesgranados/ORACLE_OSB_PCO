(:: pragma bea:global-element-parameter parameter="$input_Parameters1" element="ns0:Input_Parameters" location="../Schemas/PS_ITEL_VALIDARTRAMA701.xsd" ::)
(:: pragma bea:global-element-return element="ns0:WS_Result" location="../Schemas/PS_ITEL_VALIDARTRAMA701.xsd" ::)

declare namespace ns0 = "http://www.comcel.com.co/ValidarTrama701/";
declare namespace xf = "http://tempuri.org/ITEL_Trama701/Resources/XQueries/validarTrama701_Res/";


declare function xf:validarTrama701_Res()
    as element(ns0:WS_Result) {
        <ns0:WS_Result>
        	<CODIGO>912</CODIGO>    
            <MENSAJE>
            </MENSAJE>
            <DESCRIPCION>trama invalida</DESCRIPCION>
        </ns0:WS_Result>
            
};

xf:validarTrama701_Res()
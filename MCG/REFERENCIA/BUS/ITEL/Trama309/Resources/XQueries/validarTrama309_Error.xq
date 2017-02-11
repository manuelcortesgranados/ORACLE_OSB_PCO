(:: pragma bea:global-element-parameter parameter="$input_Parameters1" element="ns0:Input_Parameters" location="../Schemas/PS_ITEL_VALIDARTRAMA309.xsd" ::)
(:: pragma bea:global-element-return element="ns0:WS_Result" location="../Schemas/PS_ITEL_VALIDARTRAMA309.xsd" ::)

declare namespace ns0 = "http://www.comcel.com.co/ValidarTrama309/";
declare namespace xf = "http://tempuri.org/ITEL_Trama309/Resources/XQueries/validarTrama309_Res/";


declare function xf:validarTrama309_Res()
    as element(ns0:WS_Result) {
        <ns0:WS_Result>
        	<CODIGO>912</CODIGO>    
            <MENSAJE>
            </MENSAJE>
            <DESCRIPCION>trama invalida</DESCRIPCION>
        </ns0:WS_Result>
            
};

xf:validarTrama309_Res()
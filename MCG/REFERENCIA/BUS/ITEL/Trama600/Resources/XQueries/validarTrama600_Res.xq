(:: pragma bea:global-element-parameter parameter="$input_Parameters1" element="ns0:Input_Parameters" location="../Schemas/PS_ITEL_VALIDARTRAMA600.xsd" ::)
(:: pragma bea:global-element-return element="ns0:WS_Result" location="../Schemas/PS_ITEL_VALIDARTRAMA600.xsd" ::)

declare namespace ns0 = "http://www.comcel.com.co/ValidarTrama600/";
declare namespace xf = "http://tempuri.org/ITEL_Trama600/Resources/XQueries/validarTrama600_Res/";


declare function xf:validarTrama600_Res($cadenaParametros as xs:string)
    as element(ns0:WS_Result) {
        let $params := fn:tokenize($cadenaParametros, ';')
        return
            <ns0:WS_Result>
            	{if( count($params) != 1 or string(number($params[1])) = 'NaN' or fn:string-length($params[1]) != 10) then
                      <CODIGO>912</CODIGO>
                 else
	                 <CODIGO>1</CODIGO>           	
                }
                <MENSAJE>
                	<MINORIGEN>{$params[1]}</MINORIGEN>
                </MENSAJE>
                <DESCRIPCION>trama valida</DESCRIPCION>
            </ns0:WS_Result>
            
};

declare variable $cadenaParametros as xs:string external;

xf:validarTrama600_Res($cadenaParametros)
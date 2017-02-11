(:: pragma bea:global-element-return element="ns0:WS_Result" location="../Schemas/PS_ITEL_VALIDARTRAMA407.xsd" ::)

declare namespace ns0 = "http://www.comcel.com.co/ValidarTrama407/";
declare namespace xf = "http://tempuri.org/ITEL/Trama407/Resources/XQueries/validarTrama407_Res/";

declare function xf:validarTrama407Res($cadenaParametros as xs:string)
    as element(ns0:WS_Result) {
    	let $params := fn:tokenize($cadenaParametros, ';')
    	return
	        <ns0:WS_Result>
            	{if( count($params) > 1 or $params[1] = "" or (string-length($params[1]) < 10 or string-length($params[1]) > 11)) then
                      <CODIGO>912</CODIGO>
                 else if( string(number($params[1])) = 'NaN') then
			         <CODIGO>915</CODIGO> 	 
                 else
	                 <CODIGO>1</CODIGO>
                }
                <MENSAJE>
                	<VOUCHER>{$params[1]}</VOUCHER>
                </MENSAJE>
                <DESCRIPCION>trama valida</DESCRIPCION>
            </ns0:WS_Result>
};

declare variable $cadenaParametros as xs:string external;

xf:validarTrama407Res($cadenaParametros)
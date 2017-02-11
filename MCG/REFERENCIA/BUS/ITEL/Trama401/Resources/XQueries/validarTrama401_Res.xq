(:: pragma bea:global-element-return element="ns0:WS_Result" location="../Schemas/PS_ITEL_VALIDARTRAMA401.xsd" ::)

declare namespace ns0 = "http://www.comcel.com.co/ValidarTrama401/";
declare namespace xf = "http://tempuri.org/ITEL/Trama401/Resources/XQueries/validarTrama401_Res/";

declare function xf:validarTrama401Res($cadenaParametros as xs:string)
    as element(ns0:WS_Result) {
    	let $params := fn:tokenize($cadenaParametros, ';')
    	return
	        <ns0:WS_Result>
            	{if( count($params) < 6 or count($params) > 7 or $params[2] = "" or $params[3] = "" or $params[4] = "" or $params[5] = "" or $params[6] = "" or $params[1] = ""
            	     or string-length($params[2]) > 100 or string-length($params[3]) > 5 or string-length($params[5]) > 12 or string-length($params[4]) > 75 or string-length($params[7]) > 3) then
                      <CODIGO>912</CODIGO>
                 else if( fn:contains($params[2],",") ) then
                  	 <CODIGO>931</CODIGO>
                 else if( string(number($params[1])) = 'NaN' or fn:string-length($params[1]) != 10) then
			         <CODIGO>912</CODIGO> 	 
                 else if(string(number($params[3])) = 'NaN' or string(number($params[3])) = 'NaN' or string(number($params[5])) = 'NaN' or string(number($params[6])) = 'NaN' or matches($params[5],"[.+]") or ($params[7] != "" and contains($params[7],".")) or contains($params[3],".") or contains($params[1],".")) then
                  	 <CODIGO>915</CODIGO>
                 else if( 0 > fn:number($params[3]) ) then
                	 <CODIGO>915</CODIGO> 	 
                 else if( 0 > fn:number($params[5]) ) then
                	 <CODIGO>920</CODIGO>
                 else if($params[7] != "" and string(number($params[7])) = 'NaN' ) then
                     <CODIGO>915</CODIGO>
                 else if( 0 > fn:number($params[7]) ) then
                	 <CODIGO>939</CODIGO>
			     else if( (0 != fn:number($params[6]) and 1 != fn:number($params[6])) or string-length($params[6]) > 1 ) then
			         <CODIGO>916</CODIGO>    
                 else
	                 <CODIGO>1</CODIGO>
                }
                <MENSAJE>
                	<MINORIGEN>{$params[1]}</MINORIGEN>
                    <COMENTARIO>{$params[2]}</COMENTARIO>
                    <HOSTID>{$params[3]}</HOSTID>
                    <CONSECUTIVO>{$params[4]}</CONSECUTIVO>
                    <MONTORECARGA>{$params[5]}</MONTORECARGA>
                    <BONIFICAR>{$params[6] }</BONIFICAR>
                    <DIASVIGENCIA>{$params[7]}</DIASVIGENCIA>
                </MENSAJE>
                <DESCRIPCION>trama valida</DESCRIPCION>
            </ns0:WS_Result>
};

declare variable $cadenaParametros as xs:string external;

xf:validarTrama401Res($cadenaParametros)
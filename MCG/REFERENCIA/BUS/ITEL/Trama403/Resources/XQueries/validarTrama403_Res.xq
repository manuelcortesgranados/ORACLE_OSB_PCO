(:: pragma bea:global-element-parameter parameter="$input_Parameters1" element="ns0:Input_Parameters" location="../Schemas/PS_ITEL_VALIDARTRAMA403.xsd" ::)
(:: pragma bea:global-element-return element="ns0:WS_Result" location="../Schemas/PS_ITEL_VALIDARTRAMA403.xsd" ::)

declare namespace ns0 = "http://www.comcel.com.co/ValidarTrama403/";
declare namespace xf = "http://tempuri.org/ITEL_Trama403/Resources/XQueries/validarTrama403_Res/";


declare function xf:validarTrama403_Res($cadenaParametros as xs:string)
    as element(ns0:WS_Result) {
        let $params := fn:tokenize($cadenaParametros, ';')
        return
            <ns0:WS_Result>
            	{if( count($params) < 5 or count($params) > 6 or $params[1] = "" or $params[2] = "" or $params[3] = "" or $params[4] = "" or $params[5] = ""
            	    or string-length($params[1]) > 100 or string-length($params[2]) > 5 or string-length($params[3]) > 75 or string-length($params[4]) > 12 or string-length($params[6]) > 3) then
                     <CODIGO>912</CODIGO>
                 else if( fn:contains($params[1],",") ) then
                  	 <CODIGO>931</CODIGO>                  	 
                 else if(string(number($params[2])) = 'NaN' or string(number($params[4])) = 'NaN' or string(number($params[4])) = 'NaN' or string(number($params[5])) = 'NaN' or contains($params[6],".") or contains($params[4],".") or contains($params[4],"+") or contains($params[2],".")) then
                  	 <CODIGO>915</CODIGO> 
                 else if( 0 > fn:number($params[2]) ) then
                	 <CODIGO>915</CODIGO>  	 
                 else if( 0 > fn:number($params[4]) ) then
                	 <CODIGO>920</CODIGO> 	 
                 else if($params[6] != "" and string(number($params[6])) = 'NaN' ) then
                     <CODIGO>915</CODIGO>
                 else if( 0 > fn:number($params[6]) ) then
                	 <CODIGO>939</CODIGO>
                 else if( "0" != $params[5] and "1" != $params[5]  ) then
			         <CODIGO>916</CODIGO>
			     else if( "0" = $params[4] and "0" = $params[6]  ) then
			         <CODIGO>940</CODIGO>    
                 else
	                 <CODIGO>1</CODIGO>           	
                }
                <MENSAJE>
                    <COMENTARIO>{$params[1]}</COMENTARIO>
                    <HOSTID>{$params[2]}</HOSTID>
                    <CONSECUTIVO>{$params[3]}</CONSECUTIVO>
                    <MONTORECARGA>{$params[4]}</MONTORECARGA>
                    <BONIFICAR>{$params[5] }</BONIFICAR>
                    <DIASVIGENCIA>{$params[6]}</DIASVIGENCIA>
                </MENSAJE>
                <DESCRIPCION>trama valida</DESCRIPCION>
            </ns0:WS_Result>
            
};

declare variable $cadenaParametros as xs:string external;

xf:validarTrama403_Res($cadenaParametros)
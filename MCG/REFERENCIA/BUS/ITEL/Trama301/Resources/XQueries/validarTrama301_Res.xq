(:: pragma bea:global-element-parameter parameter="$input_Parameters1" element="ns0:Input_Parameters" location="../Schemas/PS_ITEL_VALIDARTRAMA301.xsd" ::)
(:: pragma bea:global-element-return element="ns0:WS_Result" location="../Schemas/PS_ITEL_VALIDARTRAMA301.xsd" ::)

declare namespace ns0 = "http://www.comcel.com.co/ValidarTrama301/";
declare namespace xf = "http://tempuri.org/ITEL_Trama301/Resources/XQueries/validarTrama301_Res/";


declare function xf:validarTrama301_Res($cadenaParametros as xs:string, $min as xs:string)
    as element(ns0:WS_Result) {
        let $params := fn:tokenize($cadenaParametros, ';')
        return
            <ns0:WS_Result>
            	{if( fn:contains($min, $params[1]) or string-length($params[3]) > 3) then
            		 <CODIGO>912</CODIGO> 
            	 else if( count($params) < 2 or count($params) > 5 or $params[2] = "" or $params[1] = "") then
                     <CODIGO>912</CODIGO>
                 else if( string(number($params[1])) = 'NaN' or string(number($params[2])) = 'NaN' or ($params[3] != "" and string(number($params[3])) = 'NaN') or ($params[3] != "" and matches($params[3],"[.+-]"))   or ($params[5] != "" and string(number($params[5])) = 'NaN') or ($params[5] != "" and  matches($params[5],"[.+-]")) ) then                 
                  	 <CODIGO>915</CODIGO>  
				 else if( fn:string-length($params[1]) != 10  or (string($params[3]) != '' and number($params[3])<= 0  ) ) then
                  	 <CODIGO>912</CODIGO>                  	 
                 else if( "0" != $params[2] and "1" != $params[2]) then
			         <CODIGO>916</CODIGO> 	 
			     else if( $params[4] != "" and fn:not(fn:matches($params[4], '^[0-9]{4}-(0[1-9]|1[0-2])-(0[1-9]|[1-2][0-9]|3[0-1])$'))  ) then
			         <CODIGO>912</CODIGO>    
                 else
                 	 <CODIGO>1</CODIGO>           	
                }
                <MENSAJE>
                    <ELEGIDO>{$params[1]}</ELEGIDO>
                    <OPERACIONCOBRO>{$params[2]}</OPERACIONCOBRO>
                    <VIGENCIA>{$params[3]}</VIGENCIA>
                    <FECHAREGISTRO>{if($params[4] != "" ) then xs:date($params[4]) else ()}</FECHAREGISTRO>
                    <FAFID>{$params[5]}</FAFID>
                </MENSAJE>
                <DESCRIPCION>trama valida</DESCRIPCION>
            </ns0:WS_Result>
            
};
declare variable $cadenaParametros as xs:string external;
declare variable $min as xs:string external;

xf:validarTrama301_Res($cadenaParametros, $min)
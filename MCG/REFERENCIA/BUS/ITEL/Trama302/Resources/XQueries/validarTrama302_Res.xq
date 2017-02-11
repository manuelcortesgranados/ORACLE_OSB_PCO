(:: pragma bea:global-element-parameter parameter="$input_Parameters1" element="ns0:Input_Parameters" location="../Schemas/PS_ITEL_VALIDARTRAMA302.xsd" ::)
(:: pragma bea:global-element-return element="ns0:WS_Result" location="../Schemas/PS_ITEL_VALIDARTRAMA302.xsd" ::)

declare namespace ns0 = "http://www.comcel.com.co/ValidarTrama302/";
declare namespace xf = "http://tempuri.org/ITEL_Trama302/Resources/XQueries/validarTrama302_Res/";


declare function xf:validarTrama302_Res($cadenaParametros as xs:string, $min as xs:string)
    as element(ns0:WS_Result) {
        let $params := fn:tokenize($cadenaParametros, ';')
        return
            <ns0:WS_Result>
            	{if( fn:contains($min, $params[1]) ) then
            		 <CODIGO>912</CODIGO> 
            	 else if( count($params) < 2 or count($params) > 3 or $params[2] = "") then
                     <CODIGO>912</CODIGO>
                 else if( string(number($params[1])) = 'NaN' or string(number($params[2])) = 'NaN') then
                  	 <CODIGO>915</CODIGO>
				 else if( fn:string-length($params[1]) != 10 ) then
                  	 <CODIGO>912</CODIGO>                  	 
                 else if( "0" != $params[2] and "1" != $params[2]) then
			         <CODIGO>916</CODIGO> 	 
			     else if( $params[3] != "" and fn:not(fn:matches($params[3], '^[0-9]{4}-(0[1-9]|1[0-2])-(0[1-9]|[1-2][0-9]|3[0-1])$'))  ) then
			         <CODIGO>912</CODIGO>    
                 else
                 	 <CODIGO>1</CODIGO>           	
                }
                <MENSAJE>
                    <ELEGIDO>{$params[1]}</ELEGIDO>
                    <OPERACIONCOBRO>{$params[2]}</OPERACIONCOBRO>
                    <FECHAMODIFICACION>{if($params[3] != "" ) then xs:date($params[3]) else ()}</FECHAMODIFICACION>
                </MENSAJE>
                <DESCRIPCION>trama valida</DESCRIPCION>
            </ns0:WS_Result>
            
};
declare variable $cadenaParametros as xs:string external;
declare variable $min as xs:string external;

xf:validarTrama302_Res($cadenaParametros, $min)
(:: pragma bea:global-element-parameter parameter="$input_Parameters1" element="ns0:Input_Parameters" location="../Schemas/PS_ITEL_VALIDARTRAMA309.xsd" ::)
(:: pragma bea:global-element-return element="ns0:WS_Result" location="../Schemas/PS_ITEL_VALIDARTRAMA309.xsd" ::)

declare namespace ns0 = "http://www.comcel.com.co/ValidarTrama309/";
declare namespace xf = "http://tempuri.org/ITEL_Trama309/Resources/XQueries/validarTrama309_Res/";


declare function xf:validarTrama309_Res($cadenaParametros as xs:string, $min as xs:string)
    as element(ns0:WS_Result) {
        let $params := fn:tokenize($cadenaParametros, ';')
        return
            <ns0:WS_Result>
            	{if( fn:contains($min, $params[4]) or string-length($params[2]) > 3) then
            		 <CODIGO>912</CODIGO> 
            	 else if( ($params[1] != "" and matches($params[1],"[.+-]")) or count($params) < 2 or count($params) > 4 or $params[1] = "") then
                     <CODIGO>912</CODIGO>                                      
                 else if(string(number($params[1])) = 'NaN' or ($params[2] != "" and string(number($params[2])) = 'NaN') or ($params[2] != "" and contains($params[2],".")) or ($params[4] != "" and string(number($params[4])) = 'NaN') ) then
                  	 <CODIGO>915</CODIGO> 
				 else if( fn:string-length($params[4]) != 10 ) then
                  	 <CODIGO>912</CODIGO>                  	 
			     else if( $params[2] != "" and  fn:number($params[2]) < 1) then
			         <CODIGO>912</CODIGO>     	 
			     else if( $params[3] != "" and fn:not(fn:matches($params[3], '^[0-9]{4}-(0[1-9]|1[0-2])-(0[1-9]|[1-2][0-9]|3[0-1])$'))  ) then
			         <CODIGO>912</CODIGO>    
                 else
                 	 <CODIGO>1</CODIGO>           	
                }
                <MENSAJE>
                	<CODIGOCOBRO>{$params[1]}</CODIGOCOBRO>
                	<VIGENCIA>{$params[2]}</VIGENCIA>
                    <FECHAREGISTRO>{if($params[3] != "" ) then xs:date($params[3]) else ()}</FECHAREGISTRO>
                    <ELEGIDO>{$params[4]}</ELEGIDO>
                </MENSAJE>
                <DESCRIPCION>trama valida</DESCRIPCION>
            </ns0:WS_Result>
            
};

declare variable $cadenaParametros as xs:string external;
declare variable $min as xs:string external;

xf:validarTrama309_Res($cadenaParametros, $min)
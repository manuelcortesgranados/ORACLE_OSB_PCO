(:: pragma bea:global-element-parameter parameter="$input_Parameters1" element="ns0:Input_Parameters" location="../Schemas/PS_ITEL_VALIDARTRAMA311.xsd" ::)
(:: pragma bea:global-element-return element="ns0:WS_Result" location="../Schemas/PS_ITEL_VALIDARTRAMA311.xsd" ::)

declare namespace ns0 = "http://www.comcel.com.co/ValidarTrama311/";
declare namespace xf = "http://tempuri.org/ITEL_Trama311/Resources/XQueries/validarTrama311_Res/";


declare function xf:validarTrama311_Res($cadenaParametros as xs:string, $min as xs:string)
    as element(ns0:WS_Result) {
        let $params := fn:tokenize($cadenaParametros, ';'),
        $elegidos := fn:subsequence($params, 2),
        $numeros := fn:string-join( (data($elegidos)) ,""),
        $numerosdiferenes := for $item in $elegidos
                      		 where fn:string-length($item) !=  10
                      		 return $item
         return         		
            <ns0:WS_Result>
            	{if( fn:contains($numeros, $min) or count($params) < 2 or $params[1] = "") then
                     <CODIGO>912</CODIGO>
                  else if( $params[1] != "" and matches($params[1],"[.+-]") ) then
                  	 <CODIGO>912</CODIGO>    
                 else if( string(number($params[1])) = 'NaN' ) then
                  	 <CODIGO>915</CODIGO> 	 
                 else if( string(number($numeros)) = 'NaN') then
                 	 <CODIGO>915</CODIGO>  	 
				 else if( fn:count($numerosdiferenes) > 0 or count($elegidos)!= count(fn:distinct-values($elegidos)) ) then
                  	 <CODIGO>912</CODIGO>                 	 
                 else
                 	 <CODIGO>1</CODIGO>           	
                }
                <MENSAJE>
                    <CODIGOCOBRO>{$params[1]}</CODIGOCOBRO>
                    <FECHAREGISTRO>{''}</FECHAREGISTRO>
                    <ELEGIDOS>{string-join(
		                    		   for $i in (1 to fn:count($elegidos)) 
		                    		   where $i mod 2 = 0
		                               return $elegidos[$i]
		                               , ";")
                    }</ELEGIDOS>
                    <ELEGIDOSREEMPLAZAR>{string-join(
                    		   for $i in (1 to fn:count($elegidos)) 
                    		   where $i mod 2 = 1
                               return $elegidos[$i]
                               , ";")
                    }</ELEGIDOSREEMPLAZAR>
                </MENSAJE>
                <DESCRIPCION>trama valida</DESCRIPCION>
            </ns0:WS_Result>
            
};

declare variable $cadenaParametros as xs:string external;
declare variable $min as xs:string external;

xf:validarTrama311_Res($cadenaParametros, $min)
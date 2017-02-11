(:: pragma bea:global-element-parameter parameter="$input_Parameters1" element="ns0:Input_Parameters" location="../Schemas/PS_ITEL_VALIDARTRAMA702.xsd" ::)
(:: pragma bea:global-element-return element="ns0:WS_Result" location="../Schemas/PS_ITEL_VALIDARTRAMA702.xsd" ::)

declare namespace ns0 = "http://www.comcel.com.co/ValidarTrama702/";
declare namespace xf = "http://tempuri.org/ITEL_Trama702/Resources/XQueries/validarTrama702_Res/";


declare function xf:validarTrama702_Res($cadenaParametros as xs:string)
    as element(ns0:WS_Result) {
        let $params := fn:tokenize($cadenaParametros, ';'),
            $temp := fn:concat($params[1], ';',$params[2],';',$params[3],';'),
             $elegidos := fn:subsequence($params, 4),
	         $numeros := fn:string-join( (data($elegidos)) ,""),
	         $numerosdiferenes := for $item in $elegidos
	                      		 where fn:string-length($item) !=  10
	                      		 return $item	 	
        return
            <ns0:WS_Result>
            	{if( count($params) < 5) then
                     <CODIGO>912</CODIGO>
                 else if( string(number($params[1])) = 'NaN' or string(number($params[2])) = 'NaN' ) then
                  	 <CODIGO>915</CODIGO>
				 else if( "0" != $params[2] and "1" != $params[2] and "2" != $params[2]) then
			         <CODIGO>912</CODIGO> 	 
			     else if( $params[3] != "" and fn:not(fn:matches($params[3], '^[0-9]{4}-(0[1-9]|1[0-2])-(0[1-9]|[1-2][0-9]|3[0-1])$'))  ) then
			         <CODIGO>912</CODIGO>
                 else if( string(number($numeros)) = 'NaN') then
                 	 <CODIGO>912</CODIGO>
                 else if( fn:count($numerosdiferenes) > 0 or count($elegidos)!= count(fn:distinct-values($elegidos)) ) then
                  	 <CODIGO>912</CODIGO>     	 
                 else
                 	 <CODIGO>1</CODIGO>           	
                }
                <MENSAJE>
                    <CODIGOCOBRO>{$params[1]}</CODIGOCOBRO>
                    <CODIGOCUENTA>{$params[2]}</CODIGOCUENTA>
                    <FECHAREGISTRO>{xs:date($params[3])}</FECHAREGISTRO>
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

xf:validarTrama702_Res($cadenaParametros)
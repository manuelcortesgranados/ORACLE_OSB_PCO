(:: pragma bea:global-element-parameter parameter="$input_Parameters1" element="ns0:Input_Parameters" location="../Schemas/PS_ITEL_VALIDARTRAMA314.xsd" ::)
(:: pragma bea:global-element-return element="ns0:WS_Result" location="../Schemas/PS_ITEL_VALIDARTRAMA314.xsd" ::)

declare namespace ns0 = "http://www.comcel.com.co/ValidarTrama314/";
declare namespace xf = "http://tempuri.org/ITEL_Trama314/Resources/XQueries/validarTrama314_Res/";

declare function xf:validarTrama314_Res($cadenaParametros as xs:string, $min as xs:string)
    as element(ns0:WS_Result) {
        let $params := fn:tokenize($cadenaParametros, ';'),
        $paramsCount := fn:count( fn:tokenize($cadenaParametros, ';') ),
        $elegidos := fn:subsequence($params, 3),
        $numeros := fn:string-join( (data($elegidos)) ,""),
        $numerosdiferenes := for $item in $elegidos
                      		 where fn:string-length($item) != 10
                      		 return $item
        return
            <ns0:WS_Result>
            	{if( ($params[1] != "" and string(number($params[1])) = 'NaN') ) then
                  	 <CODIGO>915</CODIGO>
                 else if( $numeros != "" and string(number($numeros)) = 'NaN') then
                 	 <CODIGO>915</CODIGO>  	 
				 else if( fn:count($numerosdiferenes) > 0 or count($elegidos)!= count(fn:distinct-values($elegidos))) then
                  	 <CODIGO>912</CODIGO>                  	 
			     else if( $params[2] != "" and "0" != $params[2] and "1" != $params[2]) then
			         <CODIGO>916</CODIGO>
			     else if(fn:contains($cadenaParametros, $min) or (1 = fn:number($params[1]) and $numeros != "")) then
			         <CODIGO>912</CODIGO>    
			     else if( $params[1] = ""  or $params[2] = "" or number($params[1]) < 0 or number($params[2]) < 0) then
                  	 <CODIGO>912</CODIGO>
                 else
                 	 <CODIGO>1</CODIGO>           	
                }
                <MENSAJE>
                    <OFERTA>{$params[1]}</OFERTA>
                    <CODIGOCOBRO>{ $params[2]  }</CODIGOCOBRO>
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

xf:validarTrama314_Res($cadenaParametros, $min)
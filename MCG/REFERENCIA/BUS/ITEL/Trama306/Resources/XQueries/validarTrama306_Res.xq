(:: pragma bea:global-element-parameter parameter="$input_Parameters1" element="ns0:Input_Parameters" location="../Schemas/PS_ITEL_VALIDARTRAMA306.xsd" ::)
(:: pragma bea:global-element-return element="ns0:WS_Result" location="../Schemas/PS_ITEL_VALIDARTRAMA306.xsd" ::)

declare namespace ns0 = "http://www.comcel.com.co/ValidarTrama306/";
declare namespace xf = "http://tempuri.org/ITEL_Trama306/Resources/XQueries/validarTrama306_Res/";


declare function xf:validarTrama306_Res($cadenaParametros as xs:string, $min as xs:string)
    as element(ns0:WS_Result) {
        let $params := fn:tokenize($cadenaParametros, ';'),
            $elegidos := fn:subsequence($params, 1, 10),
            $numeros := fn:string-join( (data($elegidos)) ,""),
            $numerosdiferentes := for $item in $elegidos
	                      		 where fn:string-length($item) !=  10 and fn:string-length($item) > 0
	                      		 return $item,
	        $numerosiguales := for $item in $elegidos
	                      		 where fn:string-length($item) =  10
	                      		 return $item
	        (:              		 ,
	        $numerosmoviles := for $item in $elegidos
	                      		 where fn:string-length($item) =  10 and substring($item, 1, 2) != '03'
	                      		 return $item,
			$numerosfijos := for $item in $elegidos
	                      		 where substring($item, 1, 2) = '03'
	                      		 return $item	   :)                   		               		 
        return
            <ns0:WS_Result>
            	{if( ($params[11] != "" and matches($params[11],"[.+-]"))  or $params[1]='' or count($params) > 11 or fn:contains($numeros, $min) or count($numerosiguales) > 9(:or count($numerosfijos) > 1:) ) then
            		 <CODIGO>912</CODIGO> 
                 else if( string(number($numeros)) = 'NaN') then
                 	 <CODIGO>915</CODIGO>  	 
				 else if( fn:count($numerosdiferentes) > 0 or count($numerosiguales)!= count(fn:distinct-values($numerosiguales)) ) then
                  	 <CODIGO>912</CODIGO>
                 else if( $params[11] != '' and string(number($params[11])) = 'NaN' ) then
                     <CODIGO>915</CODIGO> 	                   	 
                 else
                 	 <CODIGO>1</CODIGO>           	
                }
                <MENSAJE>
                    <ELEGIDOS>{fn:string-join( (data($numerosiguales)) ,";")}</ELEGIDOS>
                    <CODIGOCOBRO>{$params[11]}</CODIGOCOBRO>
                    <ELEGIDOFIJO></ELEGIDOFIJO>
                </MENSAJE>
                <DESCRIPCION>{"Trama valida"}</DESCRIPCION>
            </ns0:WS_Result>
            
};

declare variable $cadenaParametros as xs:string external;
declare variable $min as xs:string external;

xf:validarTrama306_Res($cadenaParametros, $min)
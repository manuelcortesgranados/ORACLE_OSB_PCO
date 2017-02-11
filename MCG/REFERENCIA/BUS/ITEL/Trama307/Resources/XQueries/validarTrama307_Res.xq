(:: pragma bea:global-element-parameter parameter="$input_Parameters1" element="ns0:Input_Parameters" location="../Schemas/PS_ITEL_VALIDARTRAMA307.xsd" ::)
(:: pragma bea:global-element-return element="ns0:WS_Result" location="../Schemas/PS_ITEL_VALIDARTRAMA307.xsd" ::)

declare namespace ns0 = "http://www.comcel.com.co/ValidarTrama307/";
declare namespace xf = "http://tempuri.org/ITEL_Trama307/Resources/XQueries/validarTrama307_Res/";


declare function xf:validarTrama307_Res($cadenaParametros as xs:string)
    as element(ns0:WS_Result) {
        let $params := fn:tokenize($cadenaParametros, ';'),
        $elegidos := fn:subsequence($params, 4),
        $numeros := fn:string-join( (data($elegidos)) ,""),
        $numerosdiferenes := for $item in $elegidos
                      		 where fn:string-length($item) !=  10
                      		 return $item
        return
            <ns0:WS_Result>
            	{if( count($params) < 4 or count($params) > 12 or $params[1] = "" or $params[4] = "" or string-length($params[2]) > 3) then
                     <CODIGO>912</CODIGO>
                 else if( ($params[1] != "" and string(number($params[1])) = 'NaN') or ($params[2] != "" and string(number($params[2])) = 'NaN') or string(number($params[4])) = 'NaN' or contains($params[2],".")) then
                  	 <CODIGO>915</CODIGO>
                 else if(( $params[2] != "" and number($params[2]) < 0 ) or ($params[1] != "" and matches($params[1],"[.+-]"))) then
			         <CODIGO>912</CODIGO>
                 else if( $params[3] != "" and fn:not(fn:matches($params[3], '^[0-9]{4}-(0[1-9]|1[0-2])-(0[1-9]|[1-2][0-9]|3[0-1])$'))  ) then
			         <CODIGO>912</CODIGO> 	 
                 else if( string(number($numeros)) = 'NaN') then
                 	 <CODIGO>915</CODIGO>  	 
				 else if( fn:count($numerosdiferenes) > 0 or count($elegidos)!= count(fn:distinct-values($elegidos)) ) then
                  	 <CODIGO>912</CODIGO>                  	 
                 else
                 	 <CODIGO>1</CODIGO>           	
                }
                <MENSAJE>
                    <CODIGOCOBRO>{$params[1]}</CODIGOCOBRO>
                    <VIGENCIA>{$params[2]}</VIGENCIA>
                    <FECHAREGISTRO>{if($params[3] != "" ) then xs:date($params[3]) else ()}</FECHAREGISTRO>
                    <ELEGIDOS>{fn:string-join( (data($elegidos)) ,";")}</ELEGIDOS>
                </MENSAJE>
                <DESCRIPCION>trama valida</DESCRIPCION>
            </ns0:WS_Result>
            
};

declare variable $cadenaParametros as xs:string external;

xf:validarTrama307_Res($cadenaParametros)
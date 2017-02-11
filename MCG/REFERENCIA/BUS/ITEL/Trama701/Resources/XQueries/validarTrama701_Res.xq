(:: pragma bea:global-element-parameter parameter="$input_Parameters1" element="ns0:Input_Parameters" location="../Schemas/PS_ITEL_VALIDARTRAMA701.xsd" ::)
(:: pragma bea:global-element-return element="ns0:WS_Result" location="../Schemas/PS_ITEL_VALIDARTRAMA701.xsd" ::)

declare namespace ns0 = "http://www.comcel.com.co/ValidarTrama701/";
declare namespace xf = "http://tempuri.org/ITEL_Trama701/Resources/XQueries/validarTrama701_Res/";


declare function xf:validarTrama701_Res($cadenaParametros as xs:string)
    as element(ns0:WS_Result) {
        let $params := fn:tokenize($cadenaParametros, ';'),
        $elegidos := fn:subsequence($params, 5),
        $numeros := fn:string-join( (data($elegidos)) ,""),
        $numerosdiferenes := for $item in $elegidos
                      		 where fn:string-length($item) !=  10
                      		 return $item
        return
            <ns0:WS_Result>
            	{if( count($params) < 5 or $params[1] = "" or $params[2] = "" or string-length($params[3]) > 3) then
                     <CODIGO>912</CODIGO>
                 else if(string(number($params[1])) = 'NaN' or string(number($params[2])) = 'NaN' or ($params[3] != "" and string(number($params[3])) = 'NaN') or (contains($params[3],".") and $params[3] != "") ) then
                  	 <CODIGO>915</CODIGO> 
                 else if( string(number($numeros)) = 'NaN') then
                 	 <CODIGO>915</CODIGO>
                 else if( 0 != fn:number($params[2]) and 1 != fn:number($params[2]) and 2 != fn:number($params[2])) then
			         <CODIGO>912</CODIGO>	   	 
				 else if( fn:count($numerosdiferenes) > 0 or count($elegidos)!= count(fn:distinct-values($elegidos)) ) then
                  	 <CODIGO>912</CODIGO>
                 else if( fn:number($params[3]) < 0 ) then
                  	 <CODIGO>912</CODIGO>  	                  	 
                 else if( $params[4] != "" and fn:not(fn:matches($params[4], '^[0-9]{4}-(0[1-9]|1[0-2])-(0[1-9]|[1-2][0-9]|3[0-1])$'))  ) then
			         <CODIGO>912</CODIGO>    
                 else
                 	 <CODIGO>1</CODIGO>           	
                }
                <MENSAJE>
                    <CODIGOCOBRO>{$params[1]}</CODIGOCOBRO>
                    <CODIGOCUENTA>{$params[2]}</CODIGOCUENTA>
                    <VIGENCIA>{$params[3]}</VIGENCIA>
                    <FECHAREGISTRO>{if($params[4] != "") then xs:date($params[4]) else () }</FECHAREGISTRO>
                    <ELEGIDOS>{fn:string-join( (data($elegidos)) ,";")}</ELEGIDOS>
                </MENSAJE>
                <DESCRIPCION>Trama valida</DESCRIPCION>
            </ns0:WS_Result>
            
};

declare variable $cadenaParametros as xs:string external;

xf:validarTrama701_Res($cadenaParametros)
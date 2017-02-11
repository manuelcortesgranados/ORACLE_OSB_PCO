(:: pragma bea:global-element-parameter parameter="$input_Parameters1" element="ns0:Input_Parameters" location="../Schemas/PS_ITEL_VALIDARTRAMA312.xsd" ::)
(:: pragma bea:global-element-return element="ns0:WS_Result" location="../Schemas/PS_ITEL_VALIDARTRAMA312.xsd" ::)

declare namespace ns0 = "http://www.comcel.com.co/ValidarTrama312/";
declare namespace xf = "http://tempuri.org/ITEL_Trama312/Resources/XQueries/validarTrama312_Res/";


declare function xf:validarTrama312_Res($cadenaParametros as xs:string)
    as element(ns0:WS_Result) {
        let $params := fn:tokenize($cadenaParametros, ';'),
        $elegidos := fn:subsequence($params, 2),
        $numeros := fn:string-join( (data($elegidos)) ,""),
        $numerosdiferenes := for $item in $elegidos
                      		 where fn:string-length($item) !=  10
                      		 return $item
        return
            <ns0:WS_Result>
            	{if( ($params[1] != "" and string(number($params[1])) = 'NaN') ) then
                  	 <CODIGO>915</CODIGO>
                 else if( $numeros != "" and string(number($numeros)) = 'NaN') then
                 	 <CODIGO>915</CODIGO>  	 
				 else if( fn:count($numerosdiferenes) > 0 or count($elegidos)!= count(fn:distinct-values($elegidos)) ) then
                  	 <CODIGO>912</CODIGO>                  	 
                 
			     else if( $params[1] != "" and "0" != $params[1] and "1" != $params[1]) then
			         <CODIGO>916</CODIGO>
			     else if( 1 = fn:number($params[1]) and $numeros != "") then
			         <CODIGO>912</CODIGO>    
                 else
                 	 <CODIGO>1</CODIGO>           	
                }
                <MENSAJE>
                    <TIPOELIMINACION>{"0"}</TIPOELIMINACION>
                    <CODIGOELIMINACION>{$params[1]}</CODIGOELIMINACION>
                    <ELEGIDOS>{fn:string-join( (data($elegidos)) ,";")}</ELEGIDOS>
                </MENSAJE>
                <DESCRIPCION>trama valida</DESCRIPCION>
            </ns0:WS_Result>
            
};

declare variable $cadenaParametros as xs:string external;

xf:validarTrama312_Res($cadenaParametros)
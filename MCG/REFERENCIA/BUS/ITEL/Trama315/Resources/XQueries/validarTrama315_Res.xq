(:: pragma bea:global-element-parameter parameter="$input_Parameters1" element="ns0:Input_Parameters" location="../Schemas/PS_ITEL_VALIDARTRAMA315.xsd" ::)
(:: pragma bea:global-element-return element="ns0:WS_Result" location="../Schemas/PS_ITEL_VALIDARTRAMA315.xsd" ::)

declare namespace ns0 = "http://www.comcel.com.co/ValidarTrama315/";
declare namespace xf = "http://tempuri.org/ITEL_Trama315/Resources/XQueries/validarTrama315_Res/";

declare function xf:isCodigoEliminacionOffset($param as xs:string) as xs:boolean {
	if( fn:string-length($param) >=  10 and fn:matches($param, '^31[0-9]{7}') = xs:boolean('true') ) 
		then xs:boolean('true')
		else xs:boolean('false')
};

declare function xf:getOffsetElegidos($param as xs:string) as xs:decimal{
	if( xf:isCodigoEliminacionOffset($param) = xs:boolean('true') ) 
		then 3 
		else 4
};

declare function xf:getCodigoEliminacion($param as xs:string){
	if( xf:isCodigoEliminacionOffset($param) = xs:boolean('true') ) 
		then "1"
		else if ($param = "" ) then "0" else $param
};
	
declare function xf:validarTrama315_Res($cadenaParametros as xs:string)
    as element(ns0:WS_Result) {
        let $params := fn:tokenize($cadenaParametros, ';'),
        $paramsCount := fn:count( fn:tokenize($cadenaParametros, ';') ),
        $codigoCobro := $params[2],
        $codigoEliminacion := xf:getCodigoEliminacion($params[3]),
        $elegidos := fn:subsequence($params, xf:getOffsetElegidos( $params[3]) ),
        $numeros := fn:string-join( (data($elegidos)) ,""),
        $numerosdiferenes := for $item in $elegidos
                      		 where fn:string-length($item) != 10
                      		 return $item
        return
            <ns0:WS_Result>
            	{
            	if ($codigoCobro = "" or $params[1] = "" or number($params[1]) < 0) then
            	 	 <CODIGO>912</CODIGO>
            	 else if( ($params[1] != "" and string(number($params[1])) = 'NaN') ) then
                  	 <CODIGO>915</CODIGO>
                 else if( $numeros != "" and string(number($numeros)) = 'NaN') then
                 	 <CODIGO>915</CODIGO>  	 
				 else if( fn:count($numerosdiferenes) > 0 or count($elegidos)!= count(fn:distinct-values($elegidos)) ) then
                  	 <CODIGO>912</CODIGO>                  	 
			     else if( $codigoCobro != "" and "0" != $codigoCobro and "1" != $codigoCobro) then
			         <CODIGO>916</CODIGO>
			     else if( $codigoEliminacion != "" and "0" != $codigoEliminacion and "1" != $codigoEliminacion) then
			         <CODIGO>916</CODIGO>
			     else if( 1 = fn:number($params[1]) and $numeros != "") then
			         <CODIGO>912</CODIGO>    
                 else
                 	 <CODIGO>1</CODIGO>           	
                }
                <MENSAJE>
                    <OFERTA>{$params[1]}</OFERTA>
                    <CODIGOCOBRO>{ $codigoCobro  }</CODIGOCOBRO>
                    <CODIGOELIMINACION>{ $codigoEliminacion  }</CODIGOELIMINACION>
                    <ELEGIDOS>{fn:string-join( (data($elegidos)) ,";")}</ELEGIDOS>
                </MENSAJE>
                <DESCRIPCION>trama valida</DESCRIPCION>
            </ns0:WS_Result>
            
};

declare variable $cadenaParametros as xs:string external;

xf:validarTrama315_Res($cadenaParametros)
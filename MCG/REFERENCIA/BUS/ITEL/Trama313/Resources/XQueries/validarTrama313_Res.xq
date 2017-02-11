(:: pragma bea:global-element-parameter parameter="$input_Parameters1" element="ns0:Input_Parameters" location="../Schemas/PS_ITEL_VALIDARTRAMA313.xsd" ::)
(:: pragma bea:global-element-return element="ns0:WS_Result" location="../Schemas/PS_ITEL_VALIDARTRAMA313.xsd" ::)

declare namespace ns0 = "http://www.comcel.com.co/ValidarTrama313/";
declare namespace xf = "http://tempuri.org/ITEL_Trama313/Resources/XQueries/validarTrama313_Res/";

declare function xf:isVigenciaOffset($param as xs:string) as xs:boolean {
	if( fn:string-length($param) >=  10 and fn:matches($param, '^31[0-9]{7}') = xs:boolean('true') ) 
		then xs:boolean('true')
		else xs:boolean('false')
};

declare function xf:getOffsetElegidos($param as xs:string) as xs:decimal{
	if( xf:isVigenciaOffset($param) = xs:boolean('true') ) 
		then 3 
		else 4
};

declare function xf:getOffsetCodigoCobro($param as xs:string) as xs:decimal{
	if( xf:isVigenciaOffset($param) = xs:boolean('true') ) 
		then 2 
		else 3
};

declare function xf:validarTrama313_Res($cadenaParametros as xs:string, $min as xs:string)
    as element(ns0:WS_Result) {
        let $params := fn:tokenize($cadenaParametros, ';'),
        $paramsCount := fn:count( fn:tokenize($cadenaParametros, ';') ),
        $vigencia := if( xf:isVigenciaOffset($params[3]) = xs:boolean('true') ) then 0 else if( $params[2] = "" ) then 0 else $params[2],
        $codigoCobro := $params[xf:getOffsetCodigoCobro($params[3])],
        $elegidos := fn:subsequence($params, xf:getOffsetElegidos( $params[3]) ),
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
                 else if (string(number($vigencia)) = 'NaN' or number($vigencia) < 0) then
                     <CODIGO>912</CODIGO>	 
				 else if( fn:count($numerosdiferenes) > 0 or count($elegidos)!= count(fn:distinct-values($elegidos)) ) then
                  	 <CODIGO>912</CODIGO>                  	 
			     else if( $codigoCobro = "" or "0" != $codigoCobro and "1" != $codigoCobro) then
			         <CODIGO>916</CODIGO>
			     else if( fn:contains($cadenaParametros, $min) or (1 = fn:number($params[1]) and $numeros != "")) then
			         <CODIGO>912</CODIGO>    
                 else
                 	 <CODIGO>1</CODIGO>           	
                }
                <MENSAJE>
                    <OFERTA>{$params[1]}</OFERTA>
                    <VIGENCIA>{ $vigencia }</VIGENCIA>
                    <CODIGOCOBRO>{ $codigoCobro  }</CODIGOCOBRO>
                    <ELEGIDOS>{fn:string-join( (data($elegidos)) ,";")}</ELEGIDOS>
                </MENSAJE>
                <DESCRIPCION>trama valida</DESCRIPCION>
            </ns0:WS_Result>
            
};

declare variable $cadenaParametros as xs:string external;
declare variable $min as xs:string external;

xf:validarTrama313_Res($cadenaParametros, $min)
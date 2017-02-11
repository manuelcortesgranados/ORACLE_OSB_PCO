(:: pragma bea:global-element-parameter parameter="$input_Parameters1" element="ns0:Input_Parameters" location="../Schemas/PS_ITEL_VALIDARTRAMA502.xsd" ::)
(:: pragma bea:global-element-return element="ns0:WS_Result" location="../Schemas/PS_ITEL_VALIDARTRAMA502.xsd" ::)

declare namespace ns0 = "http://www.comcel.com.co/ValidarTrama502/";
declare namespace xf = "http://tempuri.org/ITEL_Trama502/Resources/XQueries/validarTrama502_Res/";


declare function xf:validarTrama502_Res($cadenaParametros as xs:string)
    as element(ns0:WS_Result) {
        let $params := fn:tokenize($cadenaParametros, ';') 	
        return
            <ns0:WS_Result>
            	{if( count($params) < 1 or count($params) > 2) then
                     <CODIGO>912</CODIGO>                 
                 else if( $params[1] = '' ) then
			         <CODIGO>912</CODIGO>
				 else
				 if( $params[2] != '' and  string(number($params[2])) = 'NaN') then
			         <CODIGO>912</CODIGO>
				 else if($params[2] != '' and( 0 != fn:number($params[2]) and 1 != fn:number($params[2]) or string-length($params[2]) > 1 )) then
			         <CODIGO>916</CODIGO>
			     else
                 	 <CODIGO>1</CODIGO>           	
                }
                <MENSAJE>
                	<OFFERID>{ $params[1] }</OFFERID>
                	<AIRPTF>{ 
                	if( $params[2] != '') then
                	$params[2]
                	else
                	'0' 
                	}</AIRPTF>                	
                </MENSAJE>
                <DESCRIPCION>trama valida</DESCRIPCION>
            </ns0:WS_Result>
            
};

declare variable $cadenaParametros as xs:string external;

xf:validarTrama502_Res($cadenaParametros)
(:: pragma bea:global-element-parameter parameter="$input_Parameters1" element="ns0:Input_Parameters" location="../Schemas/PS_ITEL_VALIDARTRAMA303.xsd" ::)
(:: pragma bea:global-element-return element="ns0:WS_Result" location="../Schemas/PS_ITEL_VALIDARTRAMA303.xsd" ::)

declare namespace ns0 = "http://www.comcel.com.co/ValidarTrama303/";
declare namespace xf = "http://tempuri.org/ITEL_Trama303/Resources/XQueries/validarTrama303_Res/";


declare function xf:validarTrama303_Res($cadenaParametros as xs:string)
    as element(ns0:WS_Result) {
        let $params := fn:tokenize($cadenaParametros, ';')
        return
            <ns0:WS_Result>
            	{if( count($params) > 2) then
                     <CODIGO>912</CODIGO>
                 else if( $params[1] != "" and fn:not(fn:matches($params[1], '^[0-9]{4}-(0[1-9]|1[0-2])-(0[1-9]|[1-2][0-9]|3[0-1])$'))  ) then
			         <CODIGO>912</CODIGO> 
                 else if( $params[2] != "" and string(number($params[2])) = 'NaN' ) then
                  	 <CODIGO>915</CODIGO>
                 else if( $params[2] != "" and "0" != $params[2] and "1" != $params[2]) then
			         <CODIGO>916</CODIGO> 	 
			        
                 else
                 	 <CODIGO>1</CODIGO>           	
                }
                <MENSAJE>
                    <FECHARENOVACION>{if($params[1] != "" ) then xs:date($params[1]) else ()}</FECHARENOVACION>
                    <OPERACIONCOBRO>{$params[2]}</OPERACIONCOBRO>
                </MENSAJE>
                <DESCRIPCION>trama valida</DESCRIPCION>
            </ns0:WS_Result>
            
};

declare variable $cadenaParametros as xs:string external;

xf:validarTrama303_Res($cadenaParametros)
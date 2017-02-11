(:: pragma bea:global-element-parameter parameter="$input_Parameters1" element="ns0:Input_Parameters" location="../Schemas/PS_ITEL_VALIDARTRAMA305.xsd" ::)
(:: pragma bea:global-element-return element="ns0:WS_Result" location="../Schemas/PS_ITEL_VALIDARTRAMA305.xsd" ::)

declare namespace ns0 = "http://www.comcel.com.co/ValidarTrama305/";
declare namespace xf = "http://tempuri.org/ITEL_Trama305/Resources/XQueries/validarTrama305_Res/";


declare function xf:validarTrama305_Res($cadenaParametros as xs:string, $min as xs:string)
    as element(ns0:WS_Result) {
        let $params := fn:tokenize($cadenaParametros, ';')
        return
            <ns0:WS_Result>
            	{if( fn:contains($min, $params[1]) or string-length($params[2]) > 3) then
            		 <CODIGO>912</CODIGO> 
            	 else if( count($params) > 2) then
                     <CODIGO>912</CODIGO>
                 else if( matches($params[2],"[+-]") or $params[2] = "0") then
                     <CODIGO>912</CODIGO>                     
                 else if( string(number($params[1])) = 'NaN' or ($params[2] != "" and string(number($params[2])) = 'NaN') or ($params[2] != "" and contains($params[2],".")) ) then
                  	 <CODIGO>915</CODIGO>             	  
				 else if( fn:string-length($params[1]) != 10 ) then
                  	 <CODIGO>912</CODIGO>                  	 
                 else
                 	 <CODIGO>1</CODIGO>           	
                }
                <MENSAJE>
                    <ELEGIDO>{ $params[1] }</ELEGIDO>
                    <VIGENCIA>{ $params[2] }</VIGENCIA>
                </MENSAJE>
                <DESCRIPCION>trama valida</DESCRIPCION>
            </ns0:WS_Result>
            
};
declare variable $cadenaParametros as xs:string external;
declare variable $min as xs:string external;

xf:validarTrama305_Res($cadenaParametros, $min)
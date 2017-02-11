(:: pragma bea:global-element-parameter parameter="$input_Parameters1" element="ns0:Input_Parameters" location="../Schemas/PS_ITEL_VALIDARTRAMA200.xsd" ::)
(:: pragma bea:global-element-return element="ns0:WS_Result" location="../Schemas/PS_ITEL_VALIDARTRAMA200.xsd" ::)

declare namespace ns0 = "http://www.comcel.com.co/ValidarTrama200/";
declare namespace xf = "http://tempuri.org/ITEL_Trama200/Resources/XQueries/validarTrama200_Res/";


declare function xf:validarTrama200_Res($cadenaParametros as xs:string)
    as element(ns0:WS_Result) {
        let $params := fn:tokenize($cadenaParametros, ';')
        return
            <ns0:WS_Result>
            	{if( count($params) < 2 or count($params) > 2 or $params[1] = "" or $params[2] = "") then
                     <CODIGO>912</CODIGO>
                 else if( string(number($params[1])) = 'NaN' or string(number($params[2])) = 'NaN' ) then
                  	 <CODIGO>915</CODIGO>
                 else if( "0" != $params[1] and "1" != $params[1]) then
			         <CODIGO>916</CODIGO> 	 
			     else if( "0" != $params[2] and "1" != $params[2] ) then
			         <CODIGO>916</CODIGO>    
                 else
	                 <CODIGO>1</CODIGO>           	
                }
                <MENSAJE>
                    <TIPOCONSULTA>{$params[1]}</TIPOCONSULTA>
                    <COBRARCONSULTA>{$params[2] }</COBRARCONSULTA>
                </MENSAJE>
                <DESCRIPCION>trama valida</DESCRIPCION>
            </ns0:WS_Result>
            
};

declare variable $cadenaParametros as xs:string external;

xf:validarTrama200_Res($cadenaParametros)
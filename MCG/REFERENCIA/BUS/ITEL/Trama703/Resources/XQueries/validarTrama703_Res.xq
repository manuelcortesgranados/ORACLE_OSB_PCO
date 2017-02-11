(:: pragma bea:global-element-parameter parameter="$input_Parameters1" element="ns0:Input_Parameters" location="../Schemas/PS_ITEL_VALIDARTRAMA703.xsd" ::)
(:: pragma bea:global-element-return element="ns0:WS_Result" location="../Schemas/PS_ITEL_VALIDARTRAMA703.xsd" ::)

declare namespace ns0 = "http://www.comcel.com.co/ValidarTrama703/";
declare namespace xf = "http://tempuri.org/ITEL_Trama703/Resources/XQueries/validarTrama703_Res/";


declare function xf:validarTrama703_Res($cadenaParametros as xs:string)
    as element(ns0:WS_Result) {
        let $params := fn:tokenize($cadenaParametros, ';')
        return
            <ns0:WS_Result>
            	{if( count($params) < 3 or $params[3] = "" ) then
                     <CODIGO>912</CODIGO>
                 else if( $params[1] != "" and fn:not(fn:matches($params[1], '^[0-9]{4}-(0[1-9]|1[0-2])-(0[1-9]|[1-2][0-9]|3[0-1])$'))  ) then
			         <CODIGO>912</CODIGO>    
			      else if( "0" != $params[2] and "1" != $params[2] and "2" != $params[2] ) then
			         <CODIGO>912</CODIGO> 	     
                 else if( $params[3] != "" and string(number($params[3])) = 'NaN' ) then
                  	 <CODIGO>915</CODIGO>
                 else
                 	 <CODIGO>1</CODIGO>           	
                }
                <MENSAJE>
                	<FECHARENOVACION>{xs:date($params[1])}</FECHARENOVACION>
                	<CODIGOCUENTA>{$params[2]}</CODIGOCUENTA>
                    <CODIGOCOBRO>{$params[3]}</CODIGOCOBRO>
                </MENSAJE>
                <DESCRIPCION>trama valida</DESCRIPCION>
            </ns0:WS_Result>
            
};

declare variable $cadenaParametros as xs:string external;

xf:validarTrama703_Res($cadenaParametros)
(:: pragma bea:global-element-parameter parameter="$input_Parameters1" element="ns0:Input_Parameters" location="../Schemas/PS_ITEL_VALIDARTRAMA602.xsd" ::)
(:: pragma bea:global-element-return element="ns0:WS_Result" location="../Schemas/PS_ITEL_VALIDARTRAMA602.xsd" ::)

declare namespace ns0 = "http://www.comcel.com.co/ValidarTrama602/";
declare namespace xf = "http://tempuri.org/ITEL/Trama602/Resources/XQueries/validarTrama602_Res/";


declare function xf:validarTrama602_Res($cadenaParametros as xs:string)
    as element(ns0:WS_Result) {
        let $params := fn:tokenize($cadenaParametros, ';')
        return
            <ns0:WS_Result>
            	{if( count($params) > 2 or (fn:string-length($params[1])=0 and fn:string-length($params[2])=0  ) ) then
                      <CODIGO>912</CODIGO>
                 else if( fn:string-length($params[1])>0 and string(number($params[1])) = 'NaN'  ) then
                  	 <CODIGO>915</CODIGO>
                 else if( fn:string-length($params[2])>0 and string(number($params[2])) = 'NaN'  ) then
                  	 <CODIGO>915</CODIGO> 	 
            	 else if( $params[1] != "" and  "0" != $params[1] and "1" != $params[1]  ) then
                	 <CODIGO>916</CODIGO>
				 else if( $params[2] != "" and "0" != $params[2] and "1" != $params[2]  ) then
                	 <CODIGO>916</CODIGO>               	 
                 else
	                 <CODIGO>1</CODIGO>           	
                }
                <ns0:MENSAJE>
                    <ns0:BLOQUEARFRAUDE>{$params[1]}</ns0:BLOQUEARFRAUDE>
                    <ns0:BLOQUEAROTRO>{$params[2]}</ns0:BLOQUEAROTRO>
                </ns0:MENSAJE>
                <ns0:DESCRIPCION>trama valida</ns0:DESCRIPCION>
            </ns0:WS_Result>
            
};

declare variable $cadenaParametros as xs:string external;

xf:validarTrama602_Res($cadenaParametros)
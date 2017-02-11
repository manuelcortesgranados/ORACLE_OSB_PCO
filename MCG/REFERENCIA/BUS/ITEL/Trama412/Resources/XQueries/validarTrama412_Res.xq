(:: pragma bea:global-element-parameter parameter="$input_Parameters1" element="ns0:Input_Parameters" location="../Schemas/PS_ITEL_VALIDARTRAMA412.xsd" ::)
(:: pragma bea:global-element-return element="ns0:WS_Result" location="../Schemas/PS_ITEL_VALIDARTRAMA412.xsd" ::)

declare namespace ns0 = "http://www.comcel.com.co/ValidarTrama412/";
declare namespace xf = "http://tempuri.org/ITEL_Trama412/Resources/XQueries/validarTrama412_Res/";


declare function xf:validarTrama412_Res($cadenaParametros as xs:string)
    as element(ns0:WS_Result) {
        let $params := fn:tokenize($cadenaParametros, ';')
        return
            <ns0:WS_Result>
            	{if( count($params) != 1) then
                     <CODIGO>912</CODIGO>
                 else if( $params[1]!="" and string(number($params[1])) = 'NaN' ) then
                  	 <CODIGO>915</CODIGO>
                 else if( (number($params[1]) != 0 and number($params[1]) != 1) ) then
                  	 <CODIGO>912</CODIGO> 	 
                 else
	                 <CODIGO>1</CODIGO>           	
                }
                <MENSAJE>
                    <ACTIVACION>{$params[1]}</ACTIVACION>
                </MENSAJE>
                <DESCRIPCION>trama valida</DESCRIPCION>
            </ns0:WS_Result>
            
};

declare variable $cadenaParametros as xs:string external;

xf:validarTrama412_Res($cadenaParametros)
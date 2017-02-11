(:: pragma bea:global-element-parameter parameter="$input_Parameters1" element="ns0:Input_Parameters" location="../Schemas/PS_ITEL_VALIDARTRAMA604.xsd" ::)
(:: pragma bea:global-element-return element="ns0:WS_Result" location="../Schemas/PS_ITEL_VALIDARTRAMA604.xsd" ::)

declare namespace ns0 = "http://www.comcel.com.co/ValidarTrama604/";
declare namespace xf = "http://tempuri.org/ITEL/Trama604/Resources/XQueries/validarTrama604_Res/";


declare function xf:validarTrama604_Res($cadenaParametros as xs:string)
    as element(ns0:WS_Result) {
        let $params := fn:tokenize($cadenaParametros, ';')
        return
            <ns0:WS_Result>
            	{if( count($params) != 2 or $params[1]= '' or $params[2]= '' ) then
                      <CODIGO>912</CODIGO>
                 else if( string(number($params[1])) = 'NaN' or string(number($params[2])) = 'NaN' or contains($params[1],".") or contains($params[2],".") ) then
                  	 <CODIGO>915</CODIGO> 
            	 else if( string(number($params[1])) = 'NaN' or "0" != $params[1] and "1" != $params[1]  ) then
                	 <CODIGO>916</CODIGO>
                 else
	                 <CODIGO>1</CODIGO>           	
                }
                <MENSAJE>
                    <OPERACIONCOBRO>{$params[1]}</OPERACIONCOBRO>
                    <OFFER>{$params[2]}</OFFER>
                </MENSAJE>
                <DESCRIPCION>trama valida</DESCRIPCION>
            </ns0:WS_Result>
            
};

declare variable $cadenaParametros as xs:string external;

xf:validarTrama604_Res($cadenaParametros)
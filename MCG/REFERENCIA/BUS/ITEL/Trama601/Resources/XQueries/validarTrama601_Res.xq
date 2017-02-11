(:: pragma bea:global-element-parameter parameter="$input_Parameters1" element="ns0:Input_Parameters" location="../Schemas/PS_ITEL_VALIDARTRAMA601.xsd" ::)
(:: pragma bea:global-element-return element="ns0:WS_Result" location="../Schemas/PS_ITEL_VALIDARTRAMA601.xsd" ::)

declare namespace ns0 = "http://www.comcel.com.co/ValidarTrama601/";
declare namespace xf = "http://tempuri.org/ITEL/Trama601/Resources/XQueries/validarTrama601_Res/";


declare function xf:validarTrama601_Res($cadenaParametros as xs:string)
    as element(ns0:WS_Result) {
        let $params := fn:tokenize($cadenaParametros, ';')
        return
            <ns0:WS_Result>
            	{if( count($params) != 3 or $params[1]= '' or $params[2]= '' or $params[3] = '' or string-length($params[2]) > 5 or string-length($params[3]) > 5) then
                      <CODIGO>912</CODIGO>
                 else if( string(number($params[1])) = 'NaN' or string(number($params[2])) = 'NaN' or string(number($params[3])) = 'NaN' or contains($params[1],".") or contains($params[2],".") or contains($params[3],".") ) then
                  	 <CODIGO>915</CODIGO>
                 else if( 0 > fn:number($params[2]) or 0 > fn:number($params[3]) ) then
                	 <CODIGO>933</CODIGO>  	 
            	 else if( string(number($params[1])) = 'NaN' or "0" != $params[1] and "1" != $params[1]  ) then
                	 <CODIGO>916</CODIGO>
                 else
	                 <CODIGO>1</CODIGO>           	
                }
                <MENSAJE>
                    <OPERACIONCOBRO>{$params[1]}</OPERACIONCOBRO>
                    <TMCODE>{$params[2]}</TMCODE>
                    <SPCODE>{$params[3]}</SPCODE>
                </MENSAJE>
                <DESCRIPCION>trama valida</DESCRIPCION>
            </ns0:WS_Result>
            
};

declare variable $cadenaParametros as xs:string external;

xf:validarTrama601_Res($cadenaParametros)
(:: pragma bea:global-element-parameter parameter="$input_Parameters1" element="ns0:Input_Parameters" location="../Schemas/PS_ITEL_VALIDARTRAMA100.xsd" ::)
(:: pragma bea:global-element-return element="ns0:WS_Result" location="../Schemas/PS_ITEL_VALIDARTRAMA100.xsd" ::)

declare namespace ns0 = "http://www.comcel.com.co/ValidarTrama100/";
declare namespace xf = "http://tempuri.org/ITEL/Trama100/Resources/XQueries/validarTrama100_Res/";


declare function xf:validarTrama100_Res($cadenaParametros as xs:string)
    as element(ns0:WS_Result) {
        let $params := fn:tokenize($cadenaParametros, ';')
        return
            <ns0:WS_Result>
            	{if( count($params) < 3 or count($params) > 4 or $params[1] = "" or $params[2] = "" or $params[3] = ""
            	     or string-length($params[1]) > 5 or string-length($params[2]) > 5 or string-length($params[3]) > 8 or string-length($params[4]) > 50) then
                      <CODIGO>912</CODIGO>
                 else if( ($params[4] != "" and string(number($params[4])) = 'NaN') or  string(number($params[1])) = 'NaN' or string(number($params[2])) = 'NaN' or string(number($params[3])) = 'NaN' or contains($params[1],".") or contains($params[2],".") or contains($params[3],".") ) then
                     <CODIGO>915</CODIGO>
                 else if(fn:number($params[1]) < 0 or fn:number($params[2]) < 0 or fn:number($params[3]) < 0) then
                	 <CODIGO>915</CODIGO>  
                else if(fn:number($params[4]) <= 0) then
                	 <CODIGO>912</CODIGO>	   
                 else
	                 <CODIGO>1</CODIGO>           	
                }
                <MENSAJE>
                    <TMCODE>{$params[1]}</TMCODE>
                    <SPCODE>{$params[2]}</SPCODE>
                    <CODIGOMATERIAL>{$params[3]}</CODIGOMATERIAL>
                    <IMEI>{$params[4]}</IMEI>
                </MENSAJE>
                <DESCRIPCION>trama valida</DESCRIPCION>
            </ns0:WS_Result>
            
};

declare variable $cadenaParametros as xs:string external;

xf:validarTrama100_Res($cadenaParametros)
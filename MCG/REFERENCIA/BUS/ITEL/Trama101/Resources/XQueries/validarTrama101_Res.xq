(:: pragma bea:global-element-parameter parameter="$input_Parameters1" element="ns0:Input_Parameters" location="../Schemas/PS_ITEL_VALIDARTRAMA101.xsd" ::)
(:: pragma bea:global-element-return element="ns0:WS_Result" location="../Schemas/PS_ITEL_VALIDARTRAMA101.xsd" ::)

declare namespace ns0 = "http://www.comcel.com.co/ValidarTrama101/";
declare namespace xf = "http://tempuri.org/ITEL/Trama101/Resources/XQueries/validarTrama101_Res/";


declare function xf:validarTrama101_Res($cadenaParametros as xs:string)
    as element(ns0:WS_Result) {
        let $params := fn:tokenize($cadenaParametros, ';')
        return
            <ns0:WS_Result>
            	{if( count($params) < 2 or count($params) > 2 or $params[1] = "" or $params[2] = "") then
                      <CODIGO>912</CODIGO>
                 else if( ($params[3] != "" and string(number($params[3])) = 'NaN') or  string(number($params[1])) = 'NaN' or string(number($params[2])) = 'NaN' ) then
                     <CODIGO>915</CODIGO>
                 else if(fn:number($params[1]) < 0 or fn:number($params[2]) < 0 ) then
                	 <CODIGO>915</CODIGO>  
                else if(fn:number($params[4]) <= 0) then
                	 <CODIGO>912</CODIGO>	   
                 else
	                 <CODIGO>1</CODIGO>           	
                }
                <MENSAJE>
                    <OFFER>{$params[1]}</OFFER>
                    <CODIGOMATERIAL>{$params[2]}</CODIGOMATERIAL>
                    <IMEI>{""}</IMEI>
                </MENSAJE>
                <DESCRIPCION>trama valida</DESCRIPCION>
            </ns0:WS_Result>
            
};

declare variable $cadenaParametros as xs:string external;

xf:validarTrama101_Res($cadenaParametros)
(:: pragma bea:global-element-return element="ns0:WS_Result" location="../Schemas/PS_ITEL_VALIDARTRAMA415.xsd" ::)

declare namespace ns0 = "http://www.comcel.com.co/ValidarTrama415/";
declare namespace xf = "http://tempuri.org/ITEL/Trama415/Resources/XQueries/validarTrama415_Res/";

declare function xf:validarTrama415Res($cadenaParametros as xs:string)
    as element(ns0:WS_Result) {
    	let $params := fn:tokenize($cadenaParametros, ';')
    	return
	        <ns0:WS_Result>
	            {if( count($params) < 3 or count($params) > 3 or $params[1] = "" or $params[2] = "" or $params[3] = "") then
                      <CODIGO>912</CODIGO>                 
                 else if(string(number($params[1])) = 'NaN' or string(number($params[2])) = 'NaN' or 0 > fn:number($params[3]) or 1 < fn:number($params[3])) then
                  	 <CODIGO>915</CODIGO>
                 else if( fn:contains($params[1],",") ) then
                  	 <CODIGO>931</CODIGO>
                 else
	                 <CODIGO>1</CODIGO>
                }
                <MENSAJE>
                    <CODIGO_CANAL>{ $params[1] }</CODIGO_CANAL> 
                	<CODIGO_PAQUETE_SM>{ $params[2] }</CODIGO_PAQUETE_SM>                               
                    <CODIGO_COBRO>{ $params[3] }</CODIGO_COBRO>                 
                </MENSAJE>
                <DESCRIPCION>trama valida</DESCRIPCION>
            </ns0:WS_Result>
};

declare variable $cadenaParametros as xs:string external;

xf:validarTrama415Res($cadenaParametros)
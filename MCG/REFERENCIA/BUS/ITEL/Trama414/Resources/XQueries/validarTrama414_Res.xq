(:: pragma bea:global-element-return element="ns0:WS_Result" location="../Schemas/PS_ITEL_VALIDARTRAMA414.xsd" ::)

declare namespace ns0 = "http://www.comcel.com.co/ValidarTrama414/";
declare namespace xf = "http://tempuri.org/ITEL/Trama414/Resources/XQueries/validarTrama414_Res/";

declare function xf:validarTrama414Res($cadenaParametros as xs:string)
    as element(ns0:WS_Result) {
    	let $params := fn:tokenize($cadenaParametros, ';')
    	return
	        <ns0:WS_Result>
            	{if( count($params) < 5 or count($params) > 5 or $params[1] = "" or $params[2] = "" or $params[3] = "" or $params[4] = "" or $params[5] = ""
            	     or string-length($params[1]) > 100 or string-length($params[2]) > 5 or string-length($params[3]) > 75 or string-length($params[4]) > 100 or string-length($params[5]) > 1) then
                      <CODIGO>912</CODIGO>                 
                 else if(string(number($params[2])) = 'NaN' or string(number($params[5])) = 'NaN' or 0 > fn:number($params[5]) or 1 < fn:number($params[5])) then
                  	 <CODIGO>915</CODIGO>
                 else if( fn:contains($params[1],",") ) then
                  	 <CODIGO>931</CODIGO>
                 else
	                 <CODIGO>1</CODIGO>
                }
                <MENSAJE>
                	<COMENTARIO>{ $params[1] }</COMENTARIO>                               
                    <HOSTID>{ $params[2] }</HOSTID>
                    <CONSECUTIVO>{ $params[3] }</CONSECUTIVO>                    
                    <CODIGO_PAQUETE>{ $params[4] }</CODIGO_PAQUETE>
                    <CODIGO_COBRO>{ $params[5] }</CODIGO_COBRO>                  
                </MENSAJE>
                <DESCRIPCION>trama valida</DESCRIPCION>
            </ns0:WS_Result>
};

declare variable $cadenaParametros as xs:string external;

xf:validarTrama414Res($cadenaParametros)
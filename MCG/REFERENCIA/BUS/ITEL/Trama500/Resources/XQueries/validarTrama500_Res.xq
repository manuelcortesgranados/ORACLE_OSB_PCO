(:: pragma bea:global-element-return element="ns0:WS_Result" location="../Schemas/PS_ITEL_VALIDARTRAMA500.xsd" ::)

declare namespace ns0 = "http://www.comcel.com.co/ValidarTrama500/";
declare namespace xf = "http://tempuri.org/ITEL/Trama500/Resources/XQueries/validarTrama500_Res/";

declare function xf:validarTrama500_Res($cadenaParametros as xs:string)
    as element(ns0:WS_Result) {
    	let $params := fn:tokenize($cadenaParametros, ';')
        return
            <ns0:WS_Result>
            	{if (count($params) < 3 or count($params) > 3 or $params[1] = "" or $params[2] = "" or $params[3] = ""
            	     or string-length($params[1]) > 5 or string-length($params[1]) > 75) then
                     <CODIGO>912</CODIGO>
                 else if ( string(number($params[1])) = 'NaN') then
                  	 <CODIGO>915</CODIGO>
                 else
	                 <CODIGO>1</CODIGO>           	
                }
                <MENSAJE>
                    <HOSTID>{$params[1]}</HOSTID>
                    <CONSECUTIVO>{$params[2] }</CONSECUTIVO>
                    <FECHARECARGA>{xs:date($params[3])}</FECHARECARGA>
                </MENSAJE>
                <DESCRIPCION>Trama valida</DESCRIPCION>
            </ns0:WS_Result>
};

declare variable $cadenaParametros as xs:string external;

xf:validarTrama500_Res($cadenaParametros)
(:: pragma bea:global-element-parameter parameter="$input_Parameters1" element="ns0:Input_Parameters" location="../Schemas/PS_ITEL_VALIDARTRAMA410.xsd" ::)
(:: pragma bea:global-element-return element="ns0:WS_Result" location="../Schemas/PS_ITEL_VALIDARTRAMA410.xsd" ::)

declare namespace ns0 = "http://www.comcel.com.co/ValidarTrama410/";
declare namespace xf = "http://tempuri.org/ITEL/Trama410/Resources/XQueries/validarTrama410_Res/";


declare function xf:validarTrama410_Res($cadenaParametros as xs:string, $in as xs:integer)
    as element(ns0:WS_Result) {
        let $params := fn:tokenize($cadenaParametros, ';')
        return
            <ns0:WS_Result>
            	{if( count($params) < 5 or $params[1] = "" or  $params[2] = "" or  $params[3] = "" or  $params[4] = ""
            	    or string-length($params[1]) > 100 or string-length($params[2]) > 5 or string-length($params[3]) > 75 or string-length($params[6]) > 3 or string-length($params[5]) > 12) then
                      <CODIGO>912</CODIGO>
                 else if( fn:contains($params[1],",") ) then
                  	 <CODIGO>931</CODIGO>
                 else if( string($params[5]) = '' or string($params[6]) = '' ) then
                     <CODIGO>912</CODIGO>      	              	 
                 else if( string(number($params[2])) = 'NaN' or string(number($params[4])) = 'NaN' or string(number($params[5])) = 'NaN' or ( $params[6] != '' and string(number($params[6])) = 'NaN') or contains($params[6],".") or contains($params[5],".") or contains($params[4],".") or contains($params[2],".")) then
                  	 <CODIGO>915</CODIGO>
                 else if( 0 > fn:number($params[2]) ) then
                	 <CODIGO>915</CODIGO>
                 (: else if( string(number($params[4])) = 'NaN' or string-length($params[4]) > 2 or (fn:number($params[4]) < 1 and $in <50 ) or (fn:number($params[4]) < 0 and $in >=50 ) or fn:number($params[4])> 11  ) then :)  	 
            	 else if( string(number($params[4])) = 'NaN') then
                	 <CODIGO>936</CODIGO>
                 else if( fn:number($params[5]) = 0 and fn:number($params[6])=0 ) then	 
                	 <CODIGO>940</CODIGO>	 
                 else
	                 <CODIGO>1</CODIGO>           	
                }
                <MENSAJE>
                    <COMENTARIO>{$params[1]}</COMENTARIO>
                    <HOSTID>{$params[2]}</HOSTID>
                    <CONSECUTIVO>{$params[3]}</CONSECUTIVO>
                    <CUENTA>{$params[4]}</CUENTA>
                    <MONTO>{$params[5]}</MONTO>
                    <DIASVIGENCIA>{if(count($params) < 6 or $params[6]='') then 0 else $params[6]}</DIASVIGENCIA>
                </MENSAJE>
                <DESCRIPCION>trama valida</DESCRIPCION>
            </ns0:WS_Result>
            
};

declare variable $cadenaParametros as xs:string external;
declare variable $in as xs:integer external;

xf:validarTrama410_Res($cadenaParametros,$in)
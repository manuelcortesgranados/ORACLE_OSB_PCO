(:: pragma bea:global-element-parameter parameter="$input_Parameters1" element="ns0:Input_Parameters" location="../Schemas/PS_ITEL_VALIDARTRAMA402.xsd" ::)
(:: pragma bea:global-element-return element="ns0:WS_Result" location="../Schemas/PS_ITEL_VALIDARTRAMA402.xsd" ::)

declare namespace ns0 = "http://www.comcel.com.co/ValidarTrama402/";
declare namespace xf = "http://tempuri.org/ITEL_Trama402/Resources/XQueries/validarTrama402_Res/";


declare function xf:validarTrama402_Res($cadenaParametros as xs:string, $min as xs:string)
    as element(ns0:WS_Result) {
        let $params := fn:tokenize($cadenaParametros, ';')
        return
            <ns0:WS_Result>
            	{if( count($params) < 5 or count($params) > 6 or fn:string-length($params[5]) = 0 or $params[2] = ""  or $params[3] = "" or $params[4] = "" or $params[1] = ""
            	 or string-length($params[2]) > 100 or string-length($params[3]) > 5 or string-length($params[4]) > 75 or string-length($params[5]) > 12 ) then
                      <CODIGO>912</CODIGO>
                 else if ( fn:contains($min, $params[1])) then
                 	  <CODIGO>912</CODIGO>
                 else if ( count($params) = 6 and string-length($params[6]) > 1 ) then
                 	  <CODIGO>912</CODIGO>
                 else if( fn:contains($params[2],",") ) then
                  	 <CODIGO>931</CODIGO>
                  else if( string(number($params[1])) = 'NaN' or  fn:string-length($params[1]) != 10 ) then
			         <CODIGO>912</CODIGO>  	 
                 else if(string(number($params[3])) = 'NaN' or string(number($params[5])) = 'NaN' or matches($params[5],"[,.+]") or contains($params[3],".") or contains($params[1],".")) then
                  	 <CODIGO>915</CODIGO>
                 else if( 0 > fn:number($params[3]) ) then
                	 <CODIGO>915</CODIGO> 
                 else if ( count($params) = 6 and string(number($params[6])) = 'NaN' ) then
                 	  <CODIGO>912</CODIGO>	 
                 else if( 0 > fn:number($params[5]) ) then
                	 <CODIGO>920</CODIGO>
               	 else if( (count($params) = 6 and 0 != fn:number($params[6]) and 1 != fn:number($params[6]))) then
			         <CODIGO>916</CODIGO>  
                 else
	                 <CODIGO>1</CODIGO>           	
                }
                <MENSAJE>
                	<MINORIGEN>{$params[1]}</MINORIGEN>
                    <COMENTARIO>{$params[2]}</COMENTARIO>
                    <HOSTID>{$params[3]}</HOSTID>
                    <CONSECUTIVO>{$params[4]}</CONSECUTIVO>
                    <MONTORECARGA>{$params[5]}</MONTORECARGA>
                    <COBROSMS>{ if (count($params) = 6) then $params[6] else '1' }</COBROSMS>
                </MENSAJE>
                <DESCRIPCION>trama valida</DESCRIPCION>
            </ns0:WS_Result>
            
};

declare variable $cadenaParametros as xs:string external;
declare variable $min as xs:string external;

xf:validarTrama402_Res($cadenaParametros, $min)
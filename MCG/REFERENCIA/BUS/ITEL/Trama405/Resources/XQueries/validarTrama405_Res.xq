(:: pragma bea:global-element-parameter parameter="$input_Parameters1" element="ns0:Input_Parameters" location="../Schemas/PS_ITEL_VALIDARTRAMA405.xsd" ::)
(:: pragma bea:global-element-return element="ns0:WS_Result" location="../Schemas/PS_ITEL_VALIDARTRAMA405.xsd" ::)

declare namespace ns0 = "http://www.comcel.com.co/ValidarTrama405/";
declare namespace xf = "http://tempuri.org/ITEL_Trama405/Resources/XQueries/validarTrama405_Res/";

declare function xf:castAccountID($codCuenta){
   if ( $codCuenta = '0' ) then '1' else
    if ( $codCuenta = '1' ) then '4' else
     if ( $codCuenta = '2' ) then '5' else
      if ( $codCuenta = '3' ) then '2' else
       if ( $codCuenta = '4' ) then '3' else
        if ( $codCuenta = '5' ) then '6' else
         if ( $codCuenta = '6' ) then '7' else
          if ( $codCuenta = '7' ) then '8' else
           if ( $codCuenta = '8' ) then '9' else 
             if ( $codCuenta = '9' ) then '10' else
               if ( $codCuenta = '10' ) then '11' else
           	 if ( $codCuenta = '11' ) then '12' else ''
};

declare function xf:validarTrama405_Res($cadenaParametros as xs:string)
    as element(ns0:WS_Result) {
        let $params := fn:tokenize($cadenaParametros, ';')
        return
            <ns0:WS_Result>
            	{if( count($params) != 6 or $params[1] = "" or $params[2] = "" or $params[3] = "" or $params[5] = "" or $params[6] = "" or $params[4] = ""
            	     or string-length($params[1]) > 100 or string-length($params[2]) > 5 or string-length($params[3]) > 75 or string-length($params[5]) > 12 or string-length($params[6]) > 3) then
                      <CODIGO>912</CODIGO>
                 else if( fn:contains($params[1],",") ) then
                  	 <CODIGO>931</CODIGO>
                 else if(string(number($params[2])) = 'NaN' or string(number($params[4])) = 'NaN' or string(number($params[5])) = 'NaN' or string(number($params[6])) = 'NaN' or contains($params[6],".") or contains($params[5],".") or contains($params[4],".") or contains($params[2],".") ) then
                  	 <CODIGO>915</CODIGO>
                 else if( 0 > fn:number($params[2]) ) then
                	 <CODIGO>915</CODIGO>   	 
            	 else if( fn:number($params[4]) < 0  or string-length($params[4]) > 2 or fn:number($params[4])> 11  ) then
                	 <CODIGO>936</CODIGO>
                 else if( fn:number($params[5]) < 0 ) then	 
                	 <CODIGO>941</CODIGO>
                 else if( fn:number($params[6]) < 0 ) then	 
                	 <CODIGO>939</CODIGO>
                 else if( fn:number($params[5]) = 0 and fn:number($params[6])=0 ) then	 
                	 <CODIGO>942</CODIGO>	 
                 else
	                 <CODIGO>1</CODIGO>           	
                }
                <MENSAJE>
                    <COMENTARIO>{$params[1]}</COMENTARIO>
                    <HOSTID>{$params[2]}</HOSTID>
                    <CONSECUTIVO>{$params[3]}</CONSECUTIVO>
                    <CUENTA>{xf:castAccountID($params[4])}</CUENTA>
                    <MONTODEBITO>{$params[5]}</MONTODEBITO>
                    <DIASVIGENCIA>{$params[6]}</DIASVIGENCIA>
                </MENSAJE>
                <DESCRIPCION>trama valida</DESCRIPCION>
            </ns0:WS_Result>
            
};

declare variable $cadenaParametros as xs:string external;

xf:validarTrama405_Res($cadenaParametros)
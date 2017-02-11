(:: pragma bea:global-element-parameter parameter="$input_Parameters1" element="ns0:Input_Parameters" location="../Schemas/PS_ITEL_VALIDARTRAMA704.xsd" ::)
(:: pragma bea:global-element-return element="ns0:WS_Result" location="../Schemas/PS_ITEL_VALIDARTRAMA704.xsd" ::)

declare namespace ns0 = "http://www.comcel.com.co/ValidarTrama704/";
declare namespace xf = "http://tempuri.org/ITEL_Trama704/Resources/XQueries/validarTrama704_Res/";


declare function xf:validarTrama704_Res($cadenaParametros as xs:string)
    as element(ns0:WS_Result) {
        let $params := fn:tokenize($cadenaParametros, ';'),
            $temp := fn:concat($params[1], ';',$params[2],';',$params[3],';'),
            $elegidos := fn:substring-after($cadenaParametros, $temp),
            $numeros := fn:replace($elegidos, ';', '' )		 	
        return
            <ns0:WS_Result>
            	{if( count($params) < 3) then
                     <CODIGO>912</CODIGO>
                 else if( string(number($params[1])) = 'NaN' or ($params[2] != "" and string(number($params[2])) = 'NaN') or ($params[3] != "" and string(number($params[3])) = 'NaN') ) then
                  	 <CODIGO>915</CODIGO>
				 else if( "0" != $params[1] and "1" != $params[1] and "2" != $params[1]) then
			         <CODIGO>912</CODIGO>
			     else if( $params[2] != "" and "0" != $params[2] and "1" != $params[2] ) then
			         <CODIGO>916</CODIGO>
			     else if( $params[3] != "" and "0" != $params[3] and "1" != $params[3] ) then
			         <CODIGO>916</CODIGO>
                 else if( $numeros!= "" and string(number($numeros)) = 'NaN') then
                 	 <CODIGO>912</CODIGO> 	 
                 else
                 	 <CODIGO>1</CODIGO>           	
                }
                <MENSAJE>
                	<CODIGOCUENTA>{$params[1]}</CODIGOCUENTA>
                	<TIPOELIMINACION>{$params[2]}</TIPOELIMINACION>
                    <ELIMINARTODOS>{$params[3]}</ELIMINARTODOS>
                    <ELEGIDOS>{$elegidos}</ELEGIDOS>
                </MENSAJE>
                <DESCRIPCION>Trama valida</DESCRIPCION>
            </ns0:WS_Result>
            
};

declare variable $cadenaParametros as xs:string external;

xf:validarTrama704_Res($cadenaParametros)
(:: pragma bea:global-element-parameter parameter="$input_Parameters1" element="ns0:Input_Parameters" location="../Schemas/PS_ITEL_VALIDARTRAMA705.xsd" ::)
(:: pragma bea:global-element-return element="ns0:WS_Result" location="../Schemas/PS_ITEL_VALIDARTRAMA705.xsd" ::)

declare namespace ns0 = "http://www.comcel.com.co/ValidarTrama705/";
declare namespace xf = "http://tempuri.org/ITEL_Trama705/Resources/XQueries/validarTrama705_Res/";


declare function xf:validarTrama705_Res($cadenaParametros as xs:string)
    as element(ns0:WS_Result) {
        let $params := fn:tokenize($cadenaParametros, ';') 	
        return
            <ns0:WS_Result>
            	{if( count($params) < 3) then
                     <CODIGO>912</CODIGO>
                 else if( string(number($params[1])) = 'NaN' or string(number($params[2])) = 'NaN' or string(number($params[3])) = 'NaN' ) then
                  	 <CODIGO>915</CODIGO>
                 else if( fn:number($params[1]) < 0 or fn:number($params[2]) < 0 or fn:number($params[3]) < 0 ) then
			         <CODIGO>912</CODIGO>
				 else if( "0" != $params[3] and "1" != $params[3] ) then
			         <CODIGO>916</CODIGO>
                 else
                 	 <CODIGO>1</CODIGO>           	
                }
                <MENSAJE>
                	<CANTIDADMENSAJES>{$params[1]}</CANTIDADMENSAJES>
                	<VIGENCIA>{$params[2]}</VIGENCIA>
                    <CODIGOCOBRO>{$params[3]}</CODIGOCOBRO>
                </MENSAJE>
                <DESCRIPCION>trama valida</DESCRIPCION>
            </ns0:WS_Result>
            
};

declare variable $cadenaParametros as xs:string external;

xf:validarTrama705_Res($cadenaParametros)
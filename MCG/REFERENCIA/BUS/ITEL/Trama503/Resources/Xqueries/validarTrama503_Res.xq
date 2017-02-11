(:: pragma bea:global-element-parameter parameter="$input_Parameters1" element="ns0:Input_Parameters" location="../Schemas/PS_ITEL_VALIDARTRAMA503.xsd" ::)
(:: pragma bea:global-element-return element="ns0:WS_Result" location="../Schemas/PS_ITEL_VALIDARTRAMA503.xsd" ::)

declare namespace ns0 = "http://www.comcel.com.co/ValidarTrama503/";
declare namespace xf = "http://tempuri.org/ITEL_Trama503/Resources/XQueries/validarTrama503_Res/";


declare function xf:validarTrama503_Res($cadenaParametros as xs:string)
    as element(ns0:WS_Result) {
        let $params := fn:tokenize($cadenaParametros, ';') 	
        return
            <ns0:WS_Result>
            	{if( count($params) > 1) then
                     <CODIGO>912</CODIGO>                 
                 else if( $params[1] = '' ) then
			         <CODIGO>912</CODIGO>
			     else
                 	 <CODIGO>1</CODIGO>           	
                }
                <MENSAJE>
                	<OFFERID>{ $params[1] }</OFFERID> 
                </MENSAJE>
                <DESCRIPCION>trama valida</DESCRIPCION>
            </ns0:WS_Result>
            
};

declare variable $cadenaParametros as xs:string external;

xf:validarTrama503_Res($cadenaParametros)
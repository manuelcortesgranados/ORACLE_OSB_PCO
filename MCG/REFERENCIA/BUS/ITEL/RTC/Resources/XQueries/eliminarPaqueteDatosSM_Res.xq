(:: pragma bea:global-element-return element="ns0:WS_Result" location="../Schemas/PS_ELIMINAR_PAQUETE_DATOS_SM.xsd" ::)

declare namespace ns0 = "http://www.comcel.com.co/EliminarPaqueteSM/";
declare namespace xf = "http://tempuri.org/ITEL/RTC/Resources/XQueries/eliminarPaqueteDatosSM_Res/";

declare function xf:eliminarPaqueteDatosSM_Res($response as xs:string,
    
    $descripcion as xs:string)
    as element(ns0:WS_Result) {
    	let $quote := "&#34;"
    	return
        <ns0:WS_Result>
            <CODIGO>{ if(fn:normalize-space(fn:tokenize((fn:tokenize($response,':')[3]),",")[1]) = '0') then '1' else '63' }</CODIGO>
            <MENSAJE>
                <resultCode>{ fn:normalize-space(fn:tokenize((fn:tokenize($response,':')[3]),",")[1]) }</resultCode>
                <resultDescription>{ fn:normalize-space(fn:tokenize((fn:tokenize($response,':')[4]),"\}")[1]) }</resultDescription>
            </MENSAJE>
            <DESCRIPCION>{ $descripcion }</DESCRIPCION>
        </ns0:WS_Result>
};

declare variable $response as xs:string external;
declare variable $codigo as xs:string external;
declare variable $descripcion as xs:string external;

xf:eliminarPaqueteDatosSM_Res($response,
    
    $descripcion)

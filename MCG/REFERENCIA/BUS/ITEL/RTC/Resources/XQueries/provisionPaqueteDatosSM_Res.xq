(:: pragma bea:global-element-return element="ns0:WS_Result" location="../Schemas/PS_PROVISION_PAQUETE_DATOS_SM.xsd" ::)

declare namespace ns0 = "http://www.comcel.com.co/SuscriptionAddRequestSM/";
declare namespace xf = "http://tempuri.org/ITEL/RTC/Resources/XQueries/provisionPaqueteDatosSM_Res/";

declare function xf:provisionPaqueteDatosSM_Res($response as xs:string,
    
    $descripcion as xs:string)
    as element(ns0:WS_Result) {
    	let $quote := "&#34;"
    	let $resultCode := fn:normalize-space(fn:tokenize((fn:tokenize($response,':')[4]),",")[1])
    	return
        <ns0:WS_Result>
            <CODIGO>{ if($resultCode = '0') then '1'
            		  else if ($resultCode =  '1703') then '962'
            			else '63' }</CODIGO>
            <MENSAJE>
                <resultCode>{ fn:normalize-space(fn:tokenize((fn:tokenize($response,':')[4]),",")[1]) }</resultCode>
                <resultDescription>{ fn:normalize-space(fn:tokenize((fn:tokenize($response,':')[5]),"\}")[1]) }</resultDescription>
                <subscriptionId>{ fn:normalize-space(fn:tokenize((fn:tokenize($response,':')[6]),"\}")[1]) }</subscriptionId>
            </MENSAJE>
            <DESCRIPCION>{ $descripcion }</DESCRIPCION>
        </ns0:WS_Result>
};

declare variable $response as xs:string external;
declare variable $codigo as xs:string external;
declare variable $descripcion as xs:string external;

xf:provisionPaqueteDatosSM_Res($response,
    
    $descripcion)

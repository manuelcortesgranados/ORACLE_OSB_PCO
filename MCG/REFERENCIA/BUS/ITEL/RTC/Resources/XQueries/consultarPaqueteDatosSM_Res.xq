(:: pragma bea:global-element-return element="ns0:WS_Result" location="../Schemas/PS_CONSULTAR_PAQUETE_DATOS_SM.xsd" ::)

declare namespace ns0 = "http://www.comcel.com.co/SubscriptionRetrieveSM/";
declare namespace xf = "http://tempuri.org/ITEL/RTC/Resources/XQueries/consultarPaqueteDatosSM_Res/";

declare function xf:consultarPaqueteDatosSM_Res($response as xs:string,
    
    $descripcion as xs:string)
    as element(ns0:WS_Result) {
    	let $quote := "&#34;"
    	return
        <ns0:WS_Result>
            <CODIGO>{ if(fn:normalize-space(fn:tokenize((fn:tokenize($response,':')[4]),",")[1]) = '0') then '1' else '63' }</CODIGO>
            <MENSAJE>
                <resultCode>{ fn:normalize-space(fn:tokenize((fn:tokenize($response,':')[4]),",")[1]) }</resultCode>
                <resultDescription>{ fn:normalize-space(fn:tokenize((fn:tokenize($response,':')[5]),"\}")[1]) }</resultDescription>
                <subscriptionList>{ 
                for $subscription in fn:tokenize($response,'\"subscription\"') where fn:string-length($subscription) != 0 and contains($subscription, 'productId') 
                    let $productId := fn:normalize-space(fn:tokenize(substring-before(substring-after($subscription, "productId"), ","),":")[2])
                    let $subscriptionId := fn:normalize-space(fn:tokenize(substring-before(substring-after($subscription, "subscriptionId"), ","),":")[2])
					return 
					<paquete>
						<productId>{$productId}</productId>
						<subscriptionId>{$subscriptionId}</subscriptionId>
					</paquete>
              }
 			</subscriptionList>
            </MENSAJE>
            <DESCRIPCION>{ $descripcion }</DESCRIPCION>
        </ns0:WS_Result>
};

declare variable $response as xs:string external;
declare variable $codigo as xs:string external;
declare variable $descripcion as xs:string external;

xf:consultarPaqueteDatosSM_Res($response, 
    $descripcion)

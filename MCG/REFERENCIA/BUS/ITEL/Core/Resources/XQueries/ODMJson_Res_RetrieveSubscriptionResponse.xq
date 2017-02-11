xquery version "1.0" encoding "Cp1252";
(:: pragma bea:global-element-parameter parameter="$wS_Result1" element="ns0:WS_Result" location="../Schemas/PS_ITEL_EJECUTARTRAMA_ESPECIFICA.xsd" ::)

declare namespace xf = "http://tempuri.org/ITEL/Core/Resources/XQueries/ODMJson_Res_RetrieveSubscriptionResponse/";
declare namespace ns0 = "http://www.comcel.com.co/EjecutarTrama/";

declare function xf:ODMJson_Res_RetrieveSubscriptionResponse($wS_Result1 as element(ns0:WS_Result),$min as xs:string)
    as xs:string {
    let $quote := "&#34;"
    let $cadena := concat("{",
			  $quote,"RetrieveSubscriptionResponse",$quote,": {",
			    $quote,"resultCode",$quote,": {",
			      $quote,"resultCode",$quote,": 0,",
			      $quote,"resultDescription",$quote,": ",$quote,"Success",$quote,
			    "},",
			    $quote,"subscriptionList",$quote,": {",
			      $quote,"subscriptionElements",$quote,": [",
			        "")
	let $cadena1 := (
            	for $Paquete in $wS_Result1/MENSAJE/PARAMETROS/PARAMETRO/VALOR/PAQUETE
            	return concat("{",       
			          $quote,"subscription",$quote,": {",
			            $quote,"subscriptionId",$quote,": ",data($Paquete/SUSCRIPCION),",",
			            $quote,"subscriberId",$quote,": ",data($min),",",
			            $quote,"subscriberType",$quote,": 1,",
			            $quote,"region",$quote,": 1,",
			            $quote,"imsi",$quote,": 732101406543933,",
			            $quote,"mainSubscriptionId",$quote,": ","0",",",
			            $quote,"relatedSubscriptionId",$quote,": 0,",
			            $quote,"statusId",$quote,": ",data($Paquete/ESTADO),",",
			            $quote,"subscriptionType",$quote,": 0,",
			            $quote,"productId",$quote,": ",data($Paquete/PRODUCTID),",",
			            $quote,"productGroup",$quote,": ",$quote,"PG.Prepago.Datos.Paquete.NavegacionWTF",$quote,",",
			            $quote,"startDate",$quote,": 1481917835095,",
			            $quote,"activationDate",$quote,": ",data((current-dateTime() - xs:dateTime($Paquete/FECHAINICIO)) div xdt:dayTimeDuration('PT0.001S')),",",
			            $quote,"activationMethod",$quote,": ",$quote,"ITEL_TEST",$quote,
			            $quote,"expirationDate",$quote,": ",data((current-dateTime() - xs:dateTime(data($Paquete/FECHAFIN))) div xdt:dayTimeDuration('PT0.001S')),",",
			            $quote,"expirationNotice",$quote,": 0,",
			            $quote,"recurrentFlag",$quote,": 0,",
			            $quote,"recurrentCount",$quote,": 0,",
			            $quote,"recurrenceNotice",$quote,": 0,",
			            $quote,"recurrenceNoticeDate",$quote,": -1,",
			            $quote,"scheduledFlag",$quote,": 0,",
			            $quote,"roamingFlag",$quote,": 0,",
			            $quote,"restrictedFlag",$quote,": 0,",
			            $quote,"chargedFlag",$quote,": 1,",
			            $quote,"activationRequestDate",$quote,": 1481917835095,",
			            $quote,"cancelationRequestDate",$quote,": -1,",
			            $quote,"smCancelationRequestDeliveryDate",$quote,": -1,",
			            $quote,"smCancelationRequestCompletitionDate",$quote,": -1,",
			            $quote,"activateOnFirstUsage",$quote,": 0,",
			            $quote,"parameters",$quote,": [",
			              "{",
			                $quote,"subscriptionParameterId",$quote,": 321148191783514700,",
			                $quote,"subscriptionId",$quote,": ",data($Paquete/SUSCRIPCION),
			                $quote,"deviceId",$quote,": 0,",
			                $quote,"subscriberId",$quote,": 573213060465,",
			                $quote,"pkey",$quote,": ",$quote,"productLabel",$quote,
			                $quote,"pvalue",$quote,": ",$quote,data($Paquete/NOMBRE),$quote,
			                $quote,"ptype",$quote,": ",$quote,"java.lang.String",
			              "},",
			              "{",
			                $quote,"subscriptionParameterId",$quote,": 321148191783514700,",
			                $quote,"subscriptionId",$quote,": 3211481917835147,",
			                $quote,"deviceId",$quote,": 0,",
			                $quote,"subscriberId",$quote,": 573213060465,",
			                $quote,"pkey",$quote,": ",$quote,"offerID",$quote,
			                $quote,"pvalue",$quote,": ",$quote,data($min),$quote,
			                $quote,"ptype",$quote,": ",$quote,"java.lang.Integer",
			              "}","]","}","}"))
			              
    let $variableTemporal := concat(data($wS_Result1/MENSAJE/METODO),data($min))
    let $cadena3 := concat("]","}","}","}")
    let $resultadoFinal := concat(data(substring($min,1,0)),data(substring($wS_Result1/MENSAJE/METODO,1,0)),$cadena,$cadena1,$cadena3)
	return $resultadoFinal
};

declare variable $min as xs:string external;
declare variable $wS_Result1 as element(ns0:WS_Result) external;

xf:ODMJson_Res_RetrieveSubscriptionResponse($wS_Result1,$min)

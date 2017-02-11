(:: pragma bea:global-element-parameter parameter="$input_Parameter1" element="ns0:Input_Parameter" location="../Schemas/PS_ENVIAR_RECARGAS_SAT_SM.xsd" ::)

declare namespace ns0 = "http://www.comcel.com.co/EnviarRecargasSATSM/";
declare namespace xf = "http://tempuri.org/ITEL/SAT/Resources/XQueries/enviarRecargasSATSM_Req/";

declare function xf:enviarRecargasSATSM_Req($input_Parameter1 as element(ns0:Input_Parameter))
    as xs:string {
    	let $quote := "&#34;"  
    	return
    	concat("{",
			$quote, "AddSubscriptionRequest",$quote," : {",
			$quote, "authentication",$quote," : {",
			$quote, "min",$quote," : ", $quote, data($input_Parameter1/ns0:EVEMIN), $quote,",",
			$quote, "recarga",$quote," : ", $quote, data($input_Parameter1/ns0:EVERECARGA), $quote,",",
			$quote, "fechaRecarga", $quote, " : ", $quote, data($input_Parameter1/ns0:EVEFECHARECARGA), $quote, "}}"
		)
		
};

declare variable $input_Parameter1 as element(ns0:Input_Parameter) external;

xf:enviarRecargasSATSM_Req($input_Parameter1)

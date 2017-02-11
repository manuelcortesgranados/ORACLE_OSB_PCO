
declare namespace xf = "http://tempuri.org/OSB_Project_PCO_007/XQueryResponse/";

declare function xf:XQueryResponse()
    as xs:string {
	let $quote := "&#34;"
	let $codigo := "777" 
	return
        concat("{",
			$quote, "AddSubscriptionResponse",$quote," : {",
			$quote, "resultCode",$quote," : {",
			$codigo,
			$quote, "subscriptionId", $quote, " : ", $quote, "1234567890123456", $quote, "}}"
		)
};


xf:XQueryResponse()

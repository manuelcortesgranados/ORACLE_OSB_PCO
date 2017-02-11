
declare namespace xf = "http://tempuri.org/ITEL/Core/Resources/XQueries/ODMJson_Res_UserUnauthorized/";

declare function xf:ODMJson_Res_UserUnauthorized($codigo as xs:string)
    as xs:string {
    let $quote := "&#34;"
        return concat("",
		$quote,"{",$quote,
		  $quote,"RetrieveSubscriptionResponse",$quote,": {",
		    $quote,"resultCode",$quote,": {",
		      $quote,"resultCode",$quote,": 401,",
		      $quote,"resultDescription",$quote,": ",$quote,"Unauthorized",$quote,
		    "}",
		  "}",
		"}")        
};

declare variable $codigo as xs:string external;

xf:ODMJson_Res_UserUnauthorized($codigo)

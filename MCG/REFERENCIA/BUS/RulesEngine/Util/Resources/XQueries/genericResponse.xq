(:: pragma  parameter="$message" type="xs:anyType" ::)
(:: pragma  type="anyType" ::)

declare namespace xf = "http://tempuri.org/RulesEngine/Util/Resources/XQueries/genericResponse/";

declare function xf:genericResponse($targetNamespace as xs:string,
	$code as xs:string,
	$message as element()*,
	$description as xs:string)
	as element(*) {
		element{expanded-QName($targetNamespace, 'WS_Result')}
		{
			<code>{ $code }</code>,
			$message,
			<description>{ $description }</description>
		}
};

declare variable $targetNamespace as xs:string external;
declare variable $code as xs:string external;
declare variable $message as element()* external;
declare variable $description as xs:string external;

xf:genericResponse($targetNamespace,
	$code,
	$message,
	$description)

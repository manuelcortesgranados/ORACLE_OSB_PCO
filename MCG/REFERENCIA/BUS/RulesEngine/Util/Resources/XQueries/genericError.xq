(:: pragma  parameter="$fault" type="xs:anyType" ::)
(:: pragma  type="xs:anyType" ::)

declare namespace xf = "http://tempuri.org/RulesEngine/Util/Resources/XQueries/genericError/";

declare function xf:genericError($targetNamespace as xs:string,
	$code as xs:string,
	$fault as element(*))
	as element(*) {
		element{expanded-QName($targetNamespace, 'WS_Result')}
		{
			<code>{ $code }</code>,
			<message />,
			<description>
			{
				let $node := if (data($fault/*:location/*:node)) then concat('[node: ', data($fault/*:location/*:node), ']') else ''
				let $stage := if (data($fault/*:location/*:stage)) then concat(' [stage: ', data($fault/*:location/*:stage), ']') else ''
				let $separator := if (data($node) or data($stage)) then ' - ' else ''
				let $details := if ($fault/*:details) then data($fault/*:details) else
					if ($fault/*:reason) then data($fault/*:reason) else ''
				return
					concat($node, $stage, $separator, $details)
			}
			</description>
		}
};

declare variable $targetNamespace as xs:string external;
declare variable $code as xs:string external;
declare variable $fault as element(*) external;

xf:genericError($targetNamespace,
	$code,
	$fault)

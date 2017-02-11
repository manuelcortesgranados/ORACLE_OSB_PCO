xquery version "1.0" encoding "Cp1252";
(:: pragma  type="xs:anyType" ::)

declare namespace xf = "http://tempuri.org/RulesEngine/Framework/Resources/XQueries/faultGenerator/";
declare namespace ce  = "http://commonsexceptions.schema.amx.com";

declare function xf:faultGenerator($exceptionCode as xs:string,
	$exceptionName as xs:string,
    $exceptionDetail as xs:string,
    $operation as xs:string)
    as element(*) {
    	if($operation = 'validateEquipment') then
			xf:validateEquipmentFaults($exceptionCode, $exceptionName, $exceptionDetail)
		else if($operation = 'getCreditScoreByCustomer') then
			xf:getCreditScoreByCustomerFaults($exceptionCode, $exceptionName, $exceptionDetail)	
		else if($operation = 'performFullCreditEvaluation') then
			xf:performFullCreditEvaluationFaults($exceptionCode, $exceptionName, $exceptionDetail)
		else if($operation = 'closeCeExceptionCase') then
			xf:closeCeExceptionCaseFaults($exceptionCode, $exceptionName, $exceptionDetail)		
    	else 
    		element{expanded-QName(string('http://commonsexceptions.schema.amx.com'), 'BusinessExceptionFault') }{
				element{ 'errorCode'} { $exceptionCode },
				element{ 'errorMsg'} { $exceptionName },
				element{ 'message'} { $exceptionDetail }
		}
};


declare function xf:validateEquipmentFaults($exceptionCode as xs:string,
	$exceptionName as xs:string,
    $exceptionDetail as xs:string) as element(*)
{
	<ce:BusinessExceptionFault>
		<errorCode>{$exceptionCode}</errorCode>
		<errorMsg>{$exceptionName}</errorMsg>
		<message>{$exceptionDetail}</message>
	</ce:BusinessExceptionFault>

};

declare function xf:getCreditScoreByCustomerFaults($exceptionCode as xs:string,
	$exceptionName as xs:string,
    $exceptionDetail as xs:string) as element(*)
{
	let $faultName := 
		if($exceptionCode = '23') then
			'MandatoryDataMissingException'
		else if($exceptionCode = ('2', '3', '4', '5', '6', '7', '25', '26') ) then
			'InternalSystemErrorException'
		else if($exceptionCode = ('20', '21', '22', '24')) then	
			'ExternalSystemNotAvailableException'
		else if($exceptionCode = '992') then	
			'ReferenceDataMissingException'
		else
			'BusinessExceptionFault'
	return	
		element{expanded-QName(string('http://commonsexceptions.schema.amx.com'), $faultName) }{
			element{ 'errorCode'} { $exceptionCode },
			element{ 'errorMsg'} { $exceptionName },
			element{ 'message'} { $exceptionDetail }	
		}
};

declare function xf:performFullCreditEvaluationFaults($exceptionCode as xs:string,
	$exceptionName as xs:string,
    $exceptionDetail as xs:string) as element(*)
{
	let $faultName := 
		if($exceptionCode = '23') then
			'MandatoryDataMissingException'
		else if($exceptionCode = ('2', '3', '4', '5', '6', '7', '25', '26') ) then
			'InternalSystemErrorException'
		else if($exceptionCode = ('20', '21', '22', '24')) then	
			'ExternalSystemNotAvailableException'
		else if($exceptionCode = '992') then	
			'ReferenceDataMissingException'
		else
			'BusinessExceptionFault'
	return	
		element{expanded-QName(string('http://commonsexceptions.schema.amx.com'), $faultName) }{
			element{ 'errorCode'} { $exceptionCode },
			element{ 'errorMsg'} { $exceptionName },
			element{ 'message'} { $exceptionDetail }	
		}
}; 

declare function xf:closeCeExceptionCaseFaults($exceptionCode as xs:string,
	$exceptionName as xs:string,
    $exceptionDetail as xs:string) as element(*)
{
	let $faultName := 
		if($exceptionCode = '23') then
			'MandatoryDataMissingException'
		else if($exceptionCode = ('2', '3', '4', '5', '6', '7', '25', '26') ) then
			'InternalSystemErrorException'
		else if($exceptionCode = ('20', '21', '22', '24')) then	
			'ExternalSystemNotAvailableException'
		else if($exceptionCode = '992') then	
			'ReferenceDataMissingException'
		else
			'BusinessExceptionFault'
	return	
		element{expanded-QName(string('http://commonsexceptions.schema.amx.com'), $faultName) }{
			element{ 'errorCode'} { $exceptionCode },
			element{ 'errorMsg'} { $exceptionName },
			element{ 'message'} { $exceptionDetail }	
		}
};    
   


declare variable $exceptionCode as xs:string external;
declare variable $exceptionName as xs:string external;
declare variable $exceptionDetail as xs:string external;
declare variable $operation as xs:string external;

xf:faultGenerator($exceptionCode,
	$exceptionName,
    $exceptionDetail,
    $operation) 

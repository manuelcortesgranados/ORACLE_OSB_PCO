(:: pragma bea:global-element-parameter parameter="$input_Parameters1" element="ns0:Input_Parameters" location="../Schemas/PS_ITEL_COMPENSAR_CAMBIARMIN.xsd" ::)
(:: pragma bea:global-element-return element="ns1:CompensarCambiarMinRequest" location="../Schemas/DA_ITEL_OPERACION_CORBA.xsd" ::)

declare namespace ns1 = "http://www.comcel.com.co/IN/OperacionCorba";
declare namespace ns0 = "http://www.comcel.com.co/CompensarCambiarMinIN/";
declare namespace xf = "http://tempuri.org/ITEL/IN/Resources/XQueries/compensarCambiarMinIN_Req_ejecutarOperacionIN/";

declare function xf:compensarCambiarMinIN_Req_ejecutarOperacionIN($input_Parameters1 as element(ns0:Input_Parameters))
    as element(ns1:CompensarCambiarMinRequest) {
        <ns1:CompensarCambiarMinRequest prefijo = "{ data($input_Parameters1/PREFIJO) }"
                                        min = "{ data($input_Parameters1/MIN) }"
                                        hostId = "{ data($input_Parameters1/HOST_ID) }"
                                        requestorId = "{ data($input_Parameters1/REQUESTOR_ID) }"
                                        in = "{ data($input_Parameters1/IN) }">
            {
                let $SUSCRIPTOR := $input_Parameters1/SUSCRIPTOR
                return
                    <ns1:suscriptor>
                        <ns1:CUSTOMERID>{ data($SUSCRIPTOR/ns1:CUSTOMERID) }</ns1:CUSTOMERID>
                        <ns1:Cgpa>{ data($SUSCRIPTOR/ns1:Cgpa) }</ns1:Cgpa>
                        <ns1:Contract>{ data($SUSCRIPTOR/ns1:Contract) }</ns1:Contract>
                        <ns1:IsLocked>{ data($SUSCRIPTOR/ns1:IsLocked) }</ns1:IsLocked>
                        <ns1:IsFraudLocked>{ data($SUSCRIPTOR/ns1:IsFraudLocked) }</ns1:IsFraudLocked>
                        <ns1:IsFirstCallPassed>{ data($SUSCRIPTOR/ns1:IsFirstCallPassed) }</ns1:IsFirstCallPassed>
                        <ns1:IsGPRSUsed>{ data($SUSCRIPTOR/ns1:IsGPRSUsed) }</ns1:IsGPRSUsed>
                        <ns1:IsWelcomeBackPromoDone>{ data($SUSCRIPTOR/ns1:IsWelcomeBackPromoDone) }</ns1:IsWelcomeBackPromoDone>
                        <ns1:IsFnFPossible>{ data($SUSCRIPTOR/ns1:IsFnFPossible) }</ns1:IsFnFPossible>
                        <ns1:FnF_Numbers>{ $SUSCRIPTOR/ns1:FnF_Numbers/@* , $SUSCRIPTOR/ns1:FnF_Numbers/node() }</ns1:FnF_Numbers>
                        <ns1:IsBestFnFPossible>{ data($SUSCRIPTOR/ns1:IsBestFnFPossible) }</ns1:IsBestFnFPossible>
                        <ns1:BestFnF_Numbers>{ $SUSCRIPTOR/ns1:BestFnF_Numbers/@* , $SUSCRIPTOR/ns1:BestFnF_Numbers/node() }</ns1:BestFnF_Numbers>
                        <ns1:OnPeakAccountID>{ $SUSCRIPTOR/ns1:OnPeakAccountID/@* , $SUSCRIPTOR/ns1:OnPeakAccountID/node() }</ns1:OnPeakAccountID>
                        <ns1:OffPeakAccountID>{ $SUSCRIPTOR/ns1:OffPeakAccountID/@* , $SUSCRIPTOR/ns1:OffPeakAccountID/node() }</ns1:OffPeakAccountID>
                        <ns1:FreeSMSAccountID>{ $SUSCRIPTOR/ns1:FreeSMSAccountID/@* , $SUSCRIPTOR/ns1:FreeSMSAccountID/node() }</ns1:FreeSMSAccountID>
                        <ns1:BonusAccountID>{ $SUSCRIPTOR/ns1:BonusAccountID/@* , $SUSCRIPTOR/ns1:BonusAccountID/node() }</ns1:BonusAccountID>
                        <ns1:MinutesAccountID2>{ $SUSCRIPTOR/ns1:MinutesAccountID2/@* , $SUSCRIPTOR/ns1:MinutesAccountID2/node() }</ns1:MinutesAccountID2>
                        <ns1:MinutesAccountID3>{ $SUSCRIPTOR/ns1:MinutesAccountID3/@* , $SUSCRIPTOR/ns1:MinutesAccountID3/node() }</ns1:MinutesAccountID3>
                        <ns1:MinutesAccountID4>{ $SUSCRIPTOR/ns1:MinutesAccountID4/@* , $SUSCRIPTOR/ns1:MinutesAccountID4/node() }</ns1:MinutesAccountID4>
                        <ns1:MonetaryAccountID2>{ $SUSCRIPTOR/ns1:MonetaryAccountID2/@* , $SUSCRIPTOR/ns1:MonetaryAccountID2/node() }</ns1:MonetaryAccountID2>
                        <ns1:MonetaryAccountID3>{ $SUSCRIPTOR/ns1:MonetaryAccountID3/@* , $SUSCRIPTOR/ns1:MonetaryAccountID3/node() }</ns1:MonetaryAccountID3>
                        <ns1:PreActiveEndDate>{ data($SUSCRIPTOR/ns1:PreActiveEndDate) }</ns1:PreActiveEndDate>
                        <ns1:LastKnownPeriod>{ data($SUSCRIPTOR/ns1:LastKnownPeriod) }</ns1:LastKnownPeriod>
                        <ns1:ActiveEndDate>{ data($SUSCRIPTOR/ns1:ActiveEndDate) }</ns1:ActiveEndDate>
                        <ns1:GraceEndDate>{ data($SUSCRIPTOR/ns1:GraceEndDate) }</ns1:GraceEndDate>
                        <ns1:BestFnF_ActivationEndTime>{ data($SUSCRIPTOR/ns1:BestFnF_ActivationEndTime) }</ns1:BestFnF_ActivationEndTime>
                    </ns1:suscriptor>
            }
        </ns1:CompensarCambiarMinRequest>
};

declare variable $input_Parameters1 as element(ns0:Input_Parameters) external;

xf:compensarCambiarMinIN_Req_ejecutarOperacionIN($input_Parameters1)
xquery version "1.0" encoding "Cp1252";
(:: pragma bea:global-element-parameter parameter="$input_Parameters1" element="ns1:Input_Parameters" location="../Schemas/PS_ITEL_RECARGAR_WSUN.xsd" ::)
(:: pragma bea:global-element-return element="ns0:CommandRequestData" location="../Schemas/PS_ITEL_OPERACION_UNIFIED_BASETYPES.xsd" ::)

declare namespace xf = "http://tempuri.org/ITEL/UN/Resources/XQueries/recargarWSUN_Req_ejecutarOperacionesWSUN/";
declare namespace ns1 = "http://www.comcel.com.co/RecargarWSUN/";
declare namespace ns0 = "http://nsn.com/ossbss/charge.once/wsdl/entity/Tis/xsd/1";
declare variable $operation := "Recharge";
declare variable $modifier := "";

declare function xf:recargarWSUN_Req_ejecutarOperacionesWSUN($input_Parameters1 as element(ns1:Input_Parameters))
    as element(ns0:CommandRequestData) {
        <ns0:CommandRequestData>
        <ns0:Environment>
                <ns0:Parameter name = "ApplicationDomain"
                               value = "CAO_LDM_00"/>
            </ns0:Environment>
            <ns0:Command>
                <ns0:Operation namespace = "CA"
                               name = "{data($operation)}" modifier = "{data($modifier)}">
                    <ns0:ParameterList>
                        <ns0:StringParameter name="EventName">{ data($input_Parameters1/CUENTA) }</ns0:StringParameter>
	             		<ns0:LongParameter name="AmountOfUnits">{ data($input_Parameters1/VALOR) }</ns0:LongParameter>
	             		<ns0:StringParameter name="EventInfo">{ concat($operation, $input_Parameters1/PREFIJO , $input_Parameters1/CUENTA , $input_Parameters1/MIN) }</ns0:StringParameter>
	             		<ns0:LongParameter namespace="@" name="MessageId">{ concat($input_Parameters1/PREFIJO , $input_Parameters1/CUENTA , $input_Parameters1/MIN) }</ns0:LongParameter>
	             		<ns0:ListParameter name="RatingInput">
	             		   <ns0:StringElement name="tiquete">{ data($input_Parameters1/TIQUETE) }</ns0:StringElement>
	             		   <ns0:StringElement name="min">{ concat($input_Parameters1/PREFIJO , $input_Parameters1/MIN) }</ns0:StringElement>
	             		   <ns0:LongElement name="diasExtension">{ data($input_Parameters1/DIAS_EXTENSION) }</ns0:LongElement>
	             		   <ns0:LongElement name="requestorId">{ data($input_Parameters1/REQUESTOR_ID) }</ns0:LongElement>
	             		   <ns0:LongElement name="timeout">{ data($input_Parameters1/TIMEOUT) }</ns0:LongElement>
	             		</ns0:ListParameter>
						<ns0:StringParameter name="CustomerId">{ concat ( $input_Parameters1/PREFIJO, $input_Parameters1/MIN) }</ns0:StringParameter>
                    </ns0:ParameterList>
                </ns0:Operation>
            </ns0:Command>
  		</ns0:CommandRequestData>
};

declare variable $input_Parameters1 as element(ns1:Input_Parameters) external;

xf:recargarWSUN_Req_ejecutarOperacionesWSUN($input_Parameters1)
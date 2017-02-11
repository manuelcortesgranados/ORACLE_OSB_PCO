xquery version "1.0" encoding "Cp1252";
(:: pragma bea:global-element-parameter parameter="$input_Parameters1" element="ns0:Input_Parameters" location="../Schemas/PS_ITEL_CONSULTARDATOSSUSCRIPTORUN.xsd" ::)
(:: pragma bea:global-element-return element="ns1:CommandRequestData" location="../Schemas/PS_ITEL_OPERACION_UNIFIED_BASETYPES.xsd" ::)

declare namespace xf = "http://tempuri.org/ITEL/UN/Resources/XQueries/consultarDatosSuscriptorWSUN_Req_ejecutarOperacionCorbaWS/";
declare namespace ns1 = "http://nsn.com/ossbss/charge.once/wsdl/entity/Tis/xsd/1";
declare namespace ns0 = "http://www.comcel.com.co/ConsultarDatosSuscriptorUN/";
declare variable $operation := "Read";
declare variable $modifier := "Customer";
declare function xf:consultarDatosSuscriptorWSUN_Req_ejecutarOperacionCorbaWS($input_Parameters1 as element(ns0:Input_Parameters))
    as element(ns1:CommandRequestData) {
        <ns1:CommandRequestData>
        <ns1:Environment>
            <ns1:Parameter name = "ApplicationDomain"
                               value = "CAO_LDM_00"/>
            </ns1:Environment>
            <ns1:Command>
                <ns1:Operation namespace = "CA"
                               name = "{data($operation)}" modifier = "{data($modifier)}">
                    <ns1:ParameterList>
	             		<ns1:StringParameter name="EventInfo">{ concat($operation,$input_Parameters1/PREFIX , $input_Parameters1/MIN) }</ns1:StringParameter>
						<ns1:StringParameter name="CustomerId">{ concat ( $input_Parameters1/PREFIX, $input_Parameters1/MIN) }</ns1:StringParameter>
                    </ns1:ParameterList>
                </ns1:Operation>
            </ns1:Command>
        </ns1:CommandRequestData>
};

declare variable $input_Parameters1 as element(ns0:Input_Parameters) external;

xf:consultarDatosSuscriptorWSUN_Req_ejecutarOperacionCorbaWS($input_Parameters1)
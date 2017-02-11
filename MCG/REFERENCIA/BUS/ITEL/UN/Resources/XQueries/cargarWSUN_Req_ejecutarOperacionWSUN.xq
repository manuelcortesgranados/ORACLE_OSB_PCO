(:: pragma bea:global-element-parameter parameter="$input_Parameters1" element="ns1:Input_Parameters" location="../Schemas/PS_ITEL_CARGAR_WSUN.xsd" ::)
(:: pragma bea:global-element-return element="ns0:CommandRequestData" location="../Schemas/PS_ITEL_OPERACION_UNIFIED_BASETYPES.xsd" ::)

declare namespace ns1 = "http://www.comcel.com.co/CargarWSUN/";
declare namespace ns0 = "http://nsn.com/ossbss/charge.once/wsdl/entity/Tis/xsd/1";
declare namespace xf = "http://tempuri.org/ITEL/UN/Resources/XQueries/cargarWSUN_Req_ejecutarOperacionWSUN/";
declare variable $operation := "Charge";
declare variable $modifier := "";

declare function xf:cargarWSUN($input_Parameters1 as element(ns1:Input_Parameters))
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
                    	(:Nombre del producto para el que se hace la recarga:)
                        <ns0:StringParameter name="EventName">{ data($input_Parameters1/CUENTA) }</ns0:StringParameter>
                        (:Nombre del grupo al que pertenece el producto:)
                        <ns0:StringParameter name="EventClass">{ data($input_Parameters1/CUENTA) }</ns0:StringParameter>
	             		(:La cantidad que se desea recargar al producto:)
	             		<ns0:LongParameter name="AmountOfUnits">{ data($input_Parameters1/VALOR) }</ns0:LongParameter>
	             		(:Descripcion de la operacion a realizar:)
	             		<ns0:StringParameter name="EventInfo">{ concat($operation,$input_Parameters1/PREFIJO , $input_Parameters1/CUENTA , $input_Parameters1/MIN) }</ns0:StringParameter>
	             		(:Parametro opcional para identificar cada operacion:)
	             		<ns0:LongParameter namespace="@" name="MessageId">{ concat($input_Parameters1/PREFIJO , $input_Parameters1/CUENTA , $input_Parameters1/MIN,fn:current-date()) }</ns0:LongParameter>
	             		(:Parametros adicionales que puedan requerirse por la operacion:)
	             		<ns0:ListParameter name="RatingInput">
	             		   <ns0:StringElement name="tiquete">{ data($input_Parameters1/TIQUETE) }</ns0:StringElement>
	             		   <ns0:StringElement name="min">{ concat($input_Parameters1/PREFIJO , $input_Parameters1/MIN) }</ns0:StringElement>
	             		   <ns0:LongElement name="diasExtension">{ data($input_Parameters1/DIAS_EXTENSION) }</ns0:LongElement>
	             		   <ns0:LongElement name="requestorId">{ data($input_Parameters1/REQUESTOR_ID) }</ns0:LongElement>
	             		   <ns0:LongElement name="timeout">{ data($input_Parameters1/TIMEOUT) }</ns0:LongElement>
	             		</ns0:ListParameter>
	             		(:Identificador del cliente:)
						<ns0:StringParameter name="CustomerId">{ concat ( $input_Parameters1/PREFIJO, $input_Parameters1/MIN) }</ns0:StringParameter>
                    </ns0:ParameterList>
                </ns0:Operation>
            </ns0:Command>
        </ns0:CommandRequestData>
};

declare variable $input_Parameters1 as element(ns1:Input_Parameters) external;

xf:cargarWSUN($input_Parameters1)
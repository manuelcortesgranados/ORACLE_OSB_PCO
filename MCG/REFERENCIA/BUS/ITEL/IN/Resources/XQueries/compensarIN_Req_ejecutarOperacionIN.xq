(:: pragma bea:global-element-parameter parameter="$input_Parameters" element="ns1:Input_Parameters" location="../Schemas/PS_ITEL_COMPENSAR.xsd" ::)
(:: pragma bea:global-element-return element="ns0:CompensacionRequest" location="../Schemas/DA_ITEL_OPERACION_CORBA.xsd" ::)

declare namespace ns1 = "http://www.comcel.com.co/CompensarIN/";
declare namespace ns0 = "http://www.comcel.com.co/IN/OperacionCorba";
declare namespace xf = "http://tempuri.org/ITEL/IN/Resources/XQueries/compensarIN_Req_ejecutarOperacionIN/";

declare function xf:compensarIN_Req_ejecutarOperacionIN($input_Parameters as element(ns1:Input_Parameters))
    as element(ns0:CompensacionRequest) {
        <ns0:CompensacionRequest prefijo = "{ data($input_Parameters/PREFIJO) }"
                                 min = "{ data($input_Parameters/MIN) }"
                                 fechaExpiracion = "{ data($input_Parameters/FECHA_EXPIRACION) }"
                                 in = "{ data($input_Parameters/IN) }">
            <ns0:operacion>{ data($input_Parameters/OPERACION) }</ns0:operacion>
            <ns0:carga politicaExpiracion = "{ data($input_Parameters/POLITICA_EXPIRACION) }"
                       diasExtension = "{ data($input_Parameters/DIAS_EXTENSION) }"
                       fechaAbsoluta = "{ data($input_Parameters/FECHA_ABSOLUTA) }"
                       cuenta = "{ data($input_Parameters/CUENTA) }"
                       valor = "{ data($input_Parameters/VALOR) }"
                       usuario = "{ data($input_Parameters/USUARIO) }"
                       requestorId = "{ data($input_Parameters/REQUESTOR_ID) }">
                <ns0:tiquete>{ data($input_Parameters/TIQUETE) }</ns0:tiquete>
                <ns0:tiqueteCompensacion>{ data($input_Parameters/TIQUETE_COMPENSACION) }</ns0:tiqueteCompensacion>
            </ns0:carga>
        </ns0:CompensacionRequest>
};

declare variable $input_Parameters as element(ns1:Input_Parameters) external;

xf:compensarIN_Req_ejecutarOperacionIN($input_Parameters)
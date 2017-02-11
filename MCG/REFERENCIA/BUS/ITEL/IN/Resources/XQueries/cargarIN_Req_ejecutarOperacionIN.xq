(:: pragma bea:global-element-parameter parameter="$input_Parameters" element="ns1:Input_Parameters" location="../Schemas/PS_ITEL_CARGAR.xsd" ::)
(:: pragma bea:global-element-return element="ns0:CargarRequest" location="../Schemas/DA_ITEL_OPERACION_CORBA.xsd" ::)

declare namespace ns1 = "http://www.comcel.com.co/CargarIN/";
declare namespace ns0 = "http://www.comcel.com.co/IN/OperacionCorba";
declare namespace xf = "http://tempuri.org/ITEL/IN/Resources/XQueries/cargarIN_Req_ejecutarOperacionIN/";

declare function xf:cargarIN_Req_ejecutarOperacionIN($input_Parameters as element(ns1:Input_Parameters))
    as element(ns0:CargarRequest) {
        <ns0:CargarRequest prefijo = "{ data($input_Parameters/PREFIJO) }"
                           min = "{ data($input_Parameters/MIN) }"
                           in = "{ data($input_Parameters/IN) }"
                           timeout = "{ data($input_Parameters/TIMEOUT) }">
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
        </ns0:CargarRequest>
};

declare variable $input_Parameters as element(ns1:Input_Parameters) external;

xf:cargarIN_Req_ejecutarOperacionIN($input_Parameters)
(:: pragma bea:global-element-parameter parameter="$input_Parameters" element="ns0:Input_Parameters" location="../Schemas/PS_ITEL_RECARGAR.xsd" ::)
(:: pragma bea:global-element-return element="ns1:RecargarRequest" location="../Schemas/DA_ITEL_OPERACION_CORBA.xsd" ::)

declare namespace ns1 = "http://www.comcel.com.co/IN/OperacionCorba";
declare namespace ns0 = "http://www.comcel.com.co/RecargarIN/";
declare namespace xf = "http://tempuri.org/ITEL/IN/Resources/XQueries/recargarIN_Req_ejecutarOperacionIN/";

declare function xf:recargarIN_Req_ejecutarOperacionIN($input_Parameters as element(ns0:Input_Parameters))
    as element(ns1:RecargarRequest) {
        <ns1:RecargarRequest prefijo = "{ data($input_Parameters/PREFIJO) }"
                             min = "{ data($input_Parameters/MIN) }"
                             in = "{ data($input_Parameters/IN) }"
                             timeout = "{ data($input_Parameters/TIMEOUT) }">
            <ns1:carga politicaExpiracion = "{ data($input_Parameters/POLITICA_EXPIRACION) }"
                       diasExtension = "{ data($input_Parameters/DIAS_EXTENSION) }"
                       fechaAbsoluta = "{ data($input_Parameters/FECHA_ABSOLUTA) }"
                       cuenta = "{ data($input_Parameters/CUENTA) }"
                       valor = "{ data($input_Parameters/VALOR) }"
                       usuario = "{ data($input_Parameters/USUARIO) }"
                       requestorId = "{ data($input_Parameters/REQUESTOR_ID) }">
                <ns1:tiquete>{ data($input_Parameters/TIQUETE) }</ns1:tiquete>
                <ns1:tiqueteCompensacion>{ data($input_Parameters/TIQUETE_COMPENSACION) }</ns1:tiqueteCompensacion>
            </ns1:carga>
        </ns1:RecargarRequest>
};

declare variable $input_Parameters as element(ns0:Input_Parameters) external;

xf:recargarIN_Req_ejecutarOperacionIN($input_Parameters)
(:: pragma bea:global-element-return element="ns0:Input_Parameters" location="../Schemas/PS_ITEL_CONSULTARRESPUESTA.xsd" ::)

declare namespace ns0 = "http://www.comcel.com.co/ConsultarRespuesta/";
declare namespace xf = "http://tempuri.org/ITEL/Core/Resources/XQueries/ejecutarTrama_Req_consultarRespuestaLocal/";

declare function xf:ejecutarTrama_Req_consultarRespuestaLocal($codigo as xs:string)
    as element(ns0:Input_Parameters) {
        <ns0:Input_Parameters>
            <RESCODIGO>{ $codigo }</RESCODIGO>
        </ns0:Input_Parameters>
};

declare variable $codigo as xs:string external;

xf:ejecutarTrama_Req_consultarRespuestaLocal($codigo)
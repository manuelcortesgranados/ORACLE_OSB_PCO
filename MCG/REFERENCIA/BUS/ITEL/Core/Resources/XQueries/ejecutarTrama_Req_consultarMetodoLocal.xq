(:: pragma bea:global-element-return element="ns0:Input_Parameters" location="../Schemas/PS_ITEL_CONSULTARMETODO.xsd" ::)

declare namespace ns0 = "http://www.comcel.com.co/ConsultarMetodos/";
declare namespace xf = "http://tempuri.org/ITEL/Core/Resources/XQueries/ejecutarTrama_Req_consultarMetodoLocal/";

declare function xf:ejecutarTrama_Req_consultarMetodoLocal($metodo as xs:decimal)
    as element(ns0:Input_Parameters) {
        <ns0:Input_Parameters>
            <CMCODIGOMETODO>{ $metodo }</CMCODIGOMETODO>
        </ns0:Input_Parameters>
};

declare variable $metodo as xs:decimal external;

xf:ejecutarTrama_Req_consultarMetodoLocal($metodo)
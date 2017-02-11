(:: pragma bea:global-element-return element="ns0:operacionSumaResponse" location="../../../OSB_PCO_000/Recursos/Firmas_XSD/Matematicas01/FirmaOperando01.xsd" ::)

declare namespace ns0 = "http://www.firmaMatematicas01.org/FirmaOperando01";
declare namespace xf = "http://tempuri.org/OSB_PCO_003/XQuery/Matematicas01/XQuery_RespSuma/";

declare function xf:XQuery_RespSuma($p_respSuma as xs:double)
    as element(ns0:operacionSumaResponse) {
        <ns0:operacionSumaResponse>
            <ns0:respuesta>{ $p_respSuma }</ns0:respuesta>
        </ns0:operacionSumaResponse>
};

declare variable $p_respSuma as xs:double external;

xf:XQuery_RespSuma($p_respSuma)
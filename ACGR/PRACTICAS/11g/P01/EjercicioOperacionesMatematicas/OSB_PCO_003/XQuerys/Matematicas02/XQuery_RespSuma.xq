(:: pragma bea:global-element-return element="ns0:operacionSumaResponse" location="../../../OSB_PCO_000/Recursos/Firmas_XSD/Matematicas02/FirmaOperandos02.xsd" ::)

declare namespace ns0 = "http://www.firmaMatematicas02.org/FirmaOperandos02";
declare namespace xf = "http://tempuri.org/OSB_PCO_003/XQuery/Matematicas02/XQuery_RespSuma/";

declare function xf:XQuery_RespSuma($p_respSuma as xs:double)
    as element(ns0:operacionSumaResponse) {
        <ns0:operacionSumaResponse>
            <ns0:respuesta>{ $p_respSuma }</ns0:respuesta>
        </ns0:operacionSumaResponse>
};

declare variable $p_respSuma as xs:double external;

xf:XQuery_RespSuma($p_respSuma)

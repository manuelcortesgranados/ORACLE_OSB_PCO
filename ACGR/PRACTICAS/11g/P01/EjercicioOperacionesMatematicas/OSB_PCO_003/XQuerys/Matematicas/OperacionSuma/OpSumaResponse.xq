(:: pragma bea:global-element-return element="ns0:operacionSumaResponse" location="../../../../OSB_PCO_000/Recursos/Firmas_XSD/Matematicas/FirmaOperandos.xsd" ::)

declare namespace ns0 = "http://www.firmaMatematicas.org/FirmaOperandos";
declare namespace xf = "http://tempuri.org/OSB_PCO_003/XQuery/OperacionSuma/OpSumaResponse/";

declare function xf:OpSumaResponse($p_respuesta as xs:double)
    as element(ns0:operacionSumaResponse) {
        <ns0:operacionSumaResponse>
            <ns0:respuesta>{ $p_respuesta }</ns0:respuesta>
        </ns0:operacionSumaResponse>
};

declare variable $p_respuesta as xs:double external;

xf:OpSumaResponse($p_respuesta)